module VersionStrings

"""
    VersionString

A not-necessarily-SemVer version string that implements version-like
lexicographic splitting at punctuation and numeric-like comparisons
of digits without assuming anything about the structure of the string
itself.

There are four special version-y things this implements:
* Digits are compared as integer values, ignoring leading zeros
* The delimiters '-', '.' and '+' split parts to be compared separately
* The delimiter '-' is considered a prerelease and _precedes_ the version to its left
* The extrema are VersionString("") and VersionString("∞")
"""
struct VersionString
    str::String
end
Base.tryparse(::Type{VersionString}, str) = VersionString(str)
Base.:(==)(a::VersionString, b::VersionString) = a.str == b.str
Base.hash(a::VersionString, h::UInt) = hash(a.str, hash(0x30eeab00fd453583, h))

isdelim(c::Char) = c in ('-','+','.')
const DELIM_ORDERING = Dict('-'=>1,'+'=>2,'.'=>3)
delimisless(c1,c2) = DELIM_ORDERING[c1] < DELIM_ORDERING[c2]

function last_digit_ind_and_leading_zeros(str, i)
    counting_leading_zeros = str[i] == '0'
    nzeros = Int(counting_leading_zeros)
    while i < lastindex(str) && isdigit(str[nextind(str, i)])
        i = nextind(str, i)
        if counting_leading_zeros
            counting_leading_zeros &= str[i] == '0'
            nzeros += counting_leading_zeros
        end
    end
    return i, nzeros
end

function Base.isless(aver::VersionString, bver::VersionString)
    # A very naive version comparison that is delimiter-aware and compares digits numerically
    a = aver.str
    b = bver.str
    # Catch the special extrema
    a == "∞" && return false
    b == "∞" && return true
    b == "" && return false # These would otherwise allow empty -prereleases per below
    a == "" && return true
    ai = bi = 1
    while true
        # Skip to the first difference _or_ the first digit
        while ai <= lastindex(a) && bi <= lastindex(b) && a[ai] == b[bi] && !isdigit(a[ai])
            ai = nextind(a, ai)
            bi = nextind(b, bi)
        end
        # There are three reasons why we might be here:
        # 1: we hit the end of one or both strings
        if ai > lastindex(a) && bi > lastindex(b)
            # both expired; they're equal
            return false
        elseif ai > lastindex(a)
            # a is shorter than b; typically this means that a < b, but hyphens typically denote prereleases
            return (b[bi] != '-')
        elseif bi > lastindex(b)
            # b is shorter than a; like above, a is only less than b if it's a prerelease
            return (a[ai] == '-')
        end
        # 2: we hit a difference and one or both are delimiters; these similarly "end" a part like above
        if isdelim(a[ai]) && isdelim(b[bi])
            return delimisless(a[ai], b[bi])
        elseif isdelim(a[ai])
            # This part of a is shorter (and we know b is not a prerelease)
            return true
        elseif isdelim(b[bi])
            # This part of a is longer (and we know a is not a prerelease)
            return false
        end
        # 3: we hit digit(s)
        if isdigit(a[ai]) && !isdigit(b[bi])
            # this portion of a is shorter than b; it's smaller (unless pre-release)
            return (b[bi] != '-')
        elseif !isdigit(a[ai]) && isdigit(b[bi])
            # Vice-versa
            return (a[ai] == '-')
        elseif isdigit(a[ai]) && isdigit(b[bi])
            # Consume all digits and compare them
            adigitend, anzeros = last_digit_ind_and_leading_zeros(a, ai)
            bdigitend, bnzeros = last_digit_ind_and_leading_zeros(b, bi)
            adigit = parse(Int, SubString(a, ai, adigitend))
            bdigit = parse(Int, SubString(b, bi, bdigitend))
            ai = nextind(a, adigitend)
            bi = nextind(b, bdigitend)
            if adigit == bdigit && anzeros == bnzeros
                continue
            elseif adigit == bdigit
                # Having leading zeros is considered less than not; this allows using straight string equality
                return bnzeros < anzeros
            else
                return adigit < bdigit
            end
        else
            # No delimiters or digits; plain old char compare
            return a[ai] < b[ai]
        end
    end
end
function Base.show(io::IO, a::VersionString)
    show(io, typeof(a))
    print(io, "(")
    show(io, a.str)
    print(io, ")")
    return nothing
end
Base.print(io::IO, a::VersionString) = print(io, a.str)
Base.typemin(::Type{VersionString}) = VersionString("")
Base.typemax(::Type{VersionString}) = VersionString("∞")


end
