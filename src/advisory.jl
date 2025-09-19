using DataStructures: OrderedDict
using Dates: Dates, DateTime
using Markdown: Markdown

@kwdef struct PackageVulnerability
    pkg::String
    ranges::Vector{VersionRange{VersionNumber}}
    source_type::Union{Nothing, String} = nothing # or "upstream" or "alias"
    source_mapping::Union{Nothing, AbstractDict} = nothing
end
function Base.convert(::Type{PackageVulnerability}, d::AbstractDict)
    PackageVulnerability(; Dict(Symbol(k)=>(Symbol(k) == :ranges ? VersionRange{VersionNumber}.(v) : v) for (k,v) in d)...)
end

@kwdef struct Reference
    type::String = "WEB"
    url::String
    function Reference(type, url)
        TYPE = uppercase(convert(String, type))
        TYPE in ("ADVISORY", "ARTICLE", "DETECTION", "DISCUSSION", "REPORT",
                 "FIX", "INTRODUCED", "PACKAGE", "EVIDENCE", "WEB") ||
            throw(ArgumentError("unknown reference type $(repr(type))"))
        return new(TYPE, convert(String, url))
    end
end
Base.convert(::Type{Reference}, s::AbstractString) = Reference(; url = s)
Base.convert(::Type{Reference}, d::AbstractDict) = Reference(; Dict(Symbol(k)=>v for (k,v) in d)...)

@kwdef struct Credit
    name::String
    contact::Vector{String} = String[]
    type::Union{String,Nothing} = nothing
    function Credit(name, contact, type)
        if type !== nothing
            type = uppercase(convert(String, type))
            if type ∉ ("FINDER", "REPORTER", "ANALYST", "COORDINATOR", "REMEDIATION_DEVELOPER",
                        "REMEDIATION_REVIEWER", "REMEDIATION_VERIFIER", "TOOL", "SPONSOR", "OTHER")
                @warn "unknown credit type $type"
                type = nothing
            end
        end
        new(convert(String, name), convert(Vector{String}, contact), type)
    end
end
function Credit(s::AbstractString)
    # Support typical "Name <name@example.com>" shorthand
    m = match(r"^\s*(.+?)\s<([^>]+@[^>]+)>\s*$", s)
    if m === nothing
        return Credit(s, String[], nothing)
    else
        return Credit(m.captures[1], [string("mailto:", m.captures[2])], nothing)
    end
end
Base.convert(::Type{Credit}, s::AbstractString) = Credit(s)
Base.convert(::Type{Credit}, d::AbstractDict) = Credit(; Dict(Symbol(k)=>v for (k,v) in d)...)
Base.:(==)(a::Credit, b::Credit) = isequal(a.name, b.name) && isequal(a.contact, b.contact) && isequal(a.type, b.type)
Base.hash(a::Credit, h::UInt) = hash(a.name, hash(a.contact, hash(a.type, hash(0x6a890f8c2b38fe87, h))))

@kwdef struct Severity
    type::String
    score::String
end
function Severity(score)
    s = tryparse(Severity, score)
    isnothing(s) && throw(ArgumentError("cannot parse severity score $score"))
    return s
end
Base.convert(::Type{Severity}, s::AbstractString) = Severity(s)
Base.convert(::Type{Severity}, d::AbstractDict) = Severity(; Dict(Symbol(k)=>v for (k,v) in d)...)

function Base.tryparse(::Type{Severity}, score)
    if startswith(score, r"^AV:[LAN]\/AC:[HML]\/Au:[MSN]\/C:[NPC]\/I:[NPC]\/A:[NPC]")
        type = "CVSS_V2"
    elseif (m = match(r"^CVSS:([34])", score); m !== nothing)
        type = "CVSS_V$(m.captures[1])"
    else
        # TODO: Should this assume medium/high/critical are Ubuntu's definitions?
        return nothing
    end
    return Severity(type, String(score))
end

@kwdef mutable struct Advisory
    ## OSV fields
    schema_version::String = "1.7.3"
    id::Union{String,Nothing} = nothing # This is required, but may not exist before publish
    modified::DateTime = Dates.now(Dates.UTC)
    published::Union{DateTime, Nothing} = nothing
    withdrawn::Union{DateTime, Nothing} = nothing
    aliases::Vector{String} = String[]
    upstream::Vector{String} = String[]
    related::Vector{String} = String[]
    summary::Union{String, Nothing} = nothing
    details::Union{String, Nothing} = nothing
    # The more complicated fields:
    severity::Vector{Severity} = Severity[]
    affected::Vector{PackageVulnerability} = PackageVulnerability[]
    references::Vector{Reference} = Reference[]
    credits::Vector{Credit} = Credit[]
    ## JULSEC-specific fields
    database_specific::Dict{String,Any} = Dict{String,Any}() # TODO: define these fields?
end

# TOML creation. The one funny thing we do here is that the JULSEC parser supports a few
# shorthand idioms. But only do this if _all_ values in a collection can be represented
# with such shorthands.
to_toml_frontmatter(v::Union{VersionNumber, VersionString, VersionRange}) = string(v)
to_toml_frontmatter(x::Union{AbstractString, Integer, AbstractFloat, Bool, Dates.DateTime, Dates.Time, Dates.Date}) = x
to_toml_frontmatter(d::AbstractDict) = OrderedDict(k=>to_toml_frontmatter_collection(v, values(d)) for (k,v) in d)
to_toml_frontmatter(A::AbstractArray) = [to_toml_frontmatter_collection(x, A) for x in A]
to_toml_frontmatter_collection(x, _) = to_toml_frontmatter(x)
function to_toml_frontmatter(a::Advisory)
    return OrderedDict{String,Any}(string(f) => to_toml_frontmatter(getproperty(a, f)) for f in fieldnames(Advisory) if is_populated(getproperty(a, f)) && f ∉ (:summary, :details))
end
to_toml_frontmatter(s::Severity) = to_toml_frontmatter_collection(s, [s])
function to_toml_frontmatter_collection(s::Severity, xs)
    if all(x isa Severity && x == tryparse(Severity, x.score) for x in xs)
        return s.score
    else
        return OrderedDict(string(f) => to_toml_frontmatter(getproperty(s, f)) for f in fieldnames(Severity))
    end
end
to_toml_frontmatter(c::Credit) = to_toml_frontmatter_collection(c, [c])
function _credit_shorthand(c::Credit)
    contact = chopprefix(get(c.contact, 1, ""), "mailto:")
    return string(c.name, isempty(contact) ? "" : " <$contact>")
end
function to_toml_frontmatter_collection(c::Credit, xs)
    if all(x isa Credit && x == Credit(_credit_shorthand(x)) for x in xs)
        return _credit_shorthand(c)
    else
        return OrderedDict(string(f) => to_toml_frontmatter(getproperty(c, f)) for f in fieldnames(Credit) if is_populated(getproperty(c, f)))
    end
end
to_toml_frontmatter(r::Reference) = to_toml_frontmatter_collection(r, [r])
function to_toml_frontmatter_collection(r::Reference, xs)
    if all(x isa Reference && x.type == "WEB" for x in xs)
        return r.url
    else
        return OrderedDict(string(f) => to_toml_frontmatter(getproperty(s, f)) for f in fieldnames(Reference))
    end
end
function to_toml_frontmatter(v::PackageVulnerability)
    return OrderedDict(string(f) => to_toml_frontmatter(getproperty(v, f)) for f in fieldnames(PackageVulnerability))
end

function Base.print(io::IO, vuln::Advisory)
    frontmatter = sprint(TOML.print, to_toml_frontmatter(vuln))
    nticks = maximum(x->length(x.captures[1])+1, eachmatch(r"(`+)", frontmatter), init=3)
    println(io, repeat("`", nticks), "toml")
    print(io, frontmatter)
    println(io, repeat("`", nticks))
    println(io)
    is_populated(vuln.summary) && println(io, "# ", vuln.summary, "\n")
    is_populated(vuln.details) && println(io, vuln.details)
    return nothing
end

# Use the TOML/Markdown as the display:
Base.show(io::IO, mime::MIME"text/plain", vuln::Advisory) = show(io, mime, Markdown.parse(string(vuln)))
Base.show(io::IO, vuln::Advisory) = print(io, vuln)

#######
function Base.tryparse(::Type{Advisory}, s::Union{AbstractString, IO})
    m = Markdown.parse(s).content
    (length(m) >= 1 && m[1] isa Markdown.Code && m[1].language == "toml") || return nothing
    frontmatter = TOML.tryparse(m[1].code)
    frontmatter === nothing && return nothing
    summary = if length(m) >= 2 && m[2] isa Markdown.Header
        chopprefix(Markdown.plain(m[2]), r"^#+s+")
    end
    details = if length(m) >= 2+!isnothing(summary)
        Markdown.plain(m[2+!isnothing(summary):end])
    end

    return try
        Advisory(; Dict(Symbol(k)=>v for (k,v) in frontmatter)..., summary, details)
    catch _
        nothing
    end
end


to_osv_dict(v::Union{VersionNumber, VersionString, VersionRange, Dates.Time, Dates.Date}) = string(v)
to_osv_dict(x::Dates.DateTime) = chopsuffix(string(x), "Z") * "Z" # All times should be UTC; print them as such
to_osv_dict(x::Union{AbstractString, Integer, AbstractFloat, Bool}) = x
to_osv_dict(d::AbstractDict) = OrderedDict(string(k)=>to_osv_dict(v) for (k,v) in d)
function to_osv_dict(a::Union{Advisory, Severity, Reference, Credit})
    return OrderedDict(string(f) => to_osv_dict(getproperty(a, f)) for f in fieldnames(Advisory) if is_populated(getproperty(a, f)))
end
# Package vulnerabilities are the one thing we store quite differently:
function to_osv_dict(vuln::PackageVulnerability)
    return Dict{String, Any}(
        "package" => OrderedDict(
            "ecosystem" => "Julia",
            "name" => vuln.pkg,
            # TODO: "purl" => purl(vuln.pkg)
        ),
        "ranges" => [OrderedDict("type"=>"SEMVER", "events"=>osv_events(vuln.ranges))],
        # TODO: "versions" => registered_versions_within_the_ranges(vuln.pkg, vuln.ranges)
        # TODO: "database_specific" => Dict(vuln.source_type, vuln.source_mapping, etc...)
    )
end
