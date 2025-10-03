using DataStructures: OrderedDict
using Dates: Dates, DateTime
using CommonMark: CommonMark

"""
    PackageVulnerability(; pkgs, ranges, source_type=nothing, source_mapping=nothing)

Represent an item in OSV's `affected` array, but using ranges of `VersionRange` instead of named events.

The `source_type` and `source_mapping` are a bit of *unserialized* metadata to "show the work" of doing version conversion,
particularly of importance when the type is `"upstream"` and the version mappings are nontrivial.
"""
@kwdef struct PackageVulnerability
    pkg::String
    ranges::Vector{VersionRange{VersionNumber}}
    source_type::Union{Nothing, String} = nothing # or "upstream" or "alias"
    source_mapping::Union{Nothing, AbstractDict} = nothing
end
function Base.convert(::Type{PackageVulnerability}, d::AbstractDict)
    PackageVulnerability(; Dict(Symbol(k)=>(Symbol(k) == :ranges ? VersionRange{VersionNumber}.(v) : v) for (k,v) in d)...)
end
function Base.:(==)(a::PackageVulnerability, b::PackageVulnerability)
    return a.pkg == b.pkg && a.ranges == b.ranges && a.source_type == b.source_type && a.source_mapping == b.source_mapping
end
function Base.hash(a::PackageVulnerability, h::UInt)
    return hash(a.pkg, hash(a.ranges, hash(a.source_type, hash(a.source_mapping, hash(0x30652ead7d10dc57, h)))))
end
is_vulnerable(v::PackageVulnerability) = !isempty(v.ranges)
has_lower_bound(v::PackageVulnerability) = all(has_lower_bound, v.ranges)
has_upper_bound(v::PackageVulnerability) = all(has_upper_bound, v.ranges)
purl(v::PackageVulnerability) = purl(v.pkg)
function purl(pkg::String)
    uuid = get_uuids_in_general_stdlib(pkg)
    if isempty(uuid)
        error("Found no UUID for $pkg")
    end
    return "pkg:julia/$pkg?uuid=$(first(uuid))"
end
"""
    Reference(; url, type="WEB")

Represent a URL in OSV's reference field. Assumes `"WEB"` if the type is not in OSV schema.
"""
@kwdef struct Reference
    type::String = "WEB"
    url::String
    function Reference(type, url)
        TYPE = uppercase(convert(String, type))
        if TYPE ∉ ("ADVISORY", "ARTICLE", "DETECTION", "DISCUSSION", "REPORT",
                   "FIX", "INTRODUCED", "PACKAGE", "EVIDENCE", "WEB")
            @warn "unknown reference type $(repr(type))"
            TYPE = "WEB"
        end
        return new(TYPE, convert(String, url))
    end
end
Base.convert(::Type{Reference}, s::AbstractString) = Reference(; url = s)
Base.convert(::Type{Reference}, d::AbstractDict) = Reference(; Dict(Symbol(k)=>v for (k,v) in d)...)

"""
    Credit(; name, contact=String[], type=nothing)
    Credit(shorthand)

Represent a :credit field item. Supports reading and writing a shorthand `\$name <\$email>` string syntax.
The `type` must be a value in OSV schema or will be omitted.
"""
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
function Credit(shorthand::AbstractString)
    # Support typical "Name <name@example.com>" shorthand
    m = match(r"^\s*(.+?)\s<([^>]+@[^>]+)>\s*$", shorthand)
    if m === nothing
        return Credit(shorthand, String[], nothing)
    else
        return Credit(m.captures[1], [string("mailto:", m.captures[2])], nothing)
    end
end
Base.convert(::Type{Credit}, s::AbstractString) = Credit(s)
Base.convert(::Type{Credit}, d::AbstractDict) = Credit(; Dict(Symbol(k)=>v for (k,v) in d)...)
Base.:(==)(a::Credit, b::Credit) = isequal(a.name, b.name) && isequal(a.contact, b.contact) && isequal(a.type, b.type)
Base.hash(a::Credit, h::UInt) = hash(a.name, hash(a.contact, hash(a.type, hash(0x6a890f8c2b38fe87, h))))

"""
    Severity(; type, score)
    Severity(score)

Represent a CVSS severity. If no type is given, CVSS_V2/3/4 are auto-detected.
"""
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

@kwdef struct AdvisorySource
    id::String
    imported::DateTime
    modified::DateTime
    published::Union{Nothing, DateTime}
    url::String
    html_url::String
    fields::Vector{String} = String[] # An optional subset of fields that were updated by this source (excepting alias/upstream)
end
Base.:(==)(a::AdvisorySource, b::AdvisorySource) = to_toml_frontmatter(a) == to_toml_frontmatter(b)
Base.hash(a::AdvisorySource, h::UInt) = hash(to_toml_frontmatter(a), hash(0xa3a999db00b21f4d, h))
Base.convert(::Type{AdvisorySource}, d::AbstractDict) = AdvisorySource(; Dict(Symbol(k)=>v for (k,v) in d)...)

"""
    Advisory(; osv_kwargs...)

Represent an advisory using OSV schema's definitions for nearly all its fields.
There is just one place where we differ:
* `affected` is a vector of the differently-structured [`PackageVulnerability`](@ref)
"""
@kwdef mutable struct Advisory
    ## OSV fields
    schema_version::String = "1.7.3"
    # The identifier and dates are re-written by GitHub Actions upon publication and modification
    id::String = string(PREFIX, "-0000-", string(Dates.datetime2epochms(Dates.now()), base=36), "-", string(rand(UInt32), base=36))
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
    ## JLSEC database_specific fields:
    jlsec_sources::Vector{AdvisorySource} = AdvisorySource[]
end
osv_fieldnames(::Type{Advisory}) = filter(!startswith("jlsec_")∘string, fieldnames(Advisory))
osv_pairs(adv::Advisory) = [string(f)=>getproperty(adv, f) for f in osv_fieldnames(typeof(adv))]
database_specific_fieldnames(::Type{Advisory}) = filter(startswith("jlsec_")∘string, fieldnames(Advisory))
database_specific_pairs(adv::Advisory) =
    [chopprefix(string(f), "jlsec_")=>getproperty(adv, f) for f in database_specific_fieldnames(typeof(adv))]

# Advisory identity is purely determined by the serialization format
function Base.:(==)(a::Advisory, b::Advisory)
    return to_toml_frontmatter(a) == to_toml_frontmatter(b) && a.summary == b.summary && a.details == b.details
end
function Base.hash(a::Advisory, h::UInt)
    return hash(to_toml_frontmatter(a), hash(a.summary, hash(a.details, hash(0x913cfa4716e3f874, h))))
end
"""
    is_vulnerable(x)

Return `true` if the `Advisory` or `PackageVulnerability` has a non-empty set of versions
"""
is_vulnerable(a::Advisory) = any(is_vulnerable, a.affected)
vulnerable_packages(a::Advisory) = [entry.pkg for entry in a.affected if is_vulnerable(entry)]

"""
    update(original::Advisory, updates::Advisory)

Given an `original` advisory and some `updates`, return a new advisory with the same ID
and dates
"""
function update(original::Advisory, updates::Advisory)
    return Advisory(;
        # use whatever the default `schema_version` is
        id = original.id,
        modified = original.modified, # This may or may not get overwritten later
        published = original.published,
        withdrawn = something(original.withdrawn, updates.withdrawn, Some(nothing)),
        ## All other fields are directly taken from the updated advisory
        aliases = updates.aliases,
        upstream = updates.upstream,
        related = updates.related,
        summary = updates.summary,
        details = updates.details,
        severity = updates.severity,
        affected = updates.affected,
        references = updates.references,
        credits = updates.credits,
        jlsec_sources = updates.jlsec_sources,
    )
end

function year(advisory::Advisory)
    yyyy = tryparse(Int, split(advisory.id, "-")[2])
    isnothing(yyyy) || yyyy == 0 ? Dates.year(Dates.now(Dates.UTC)) : yyyy
end

#### IO and serialization ####

# TOML creation. The one funny thing we do here is that the JULSEC parser supports a few
# shorthand idioms. But only do this if _all_ values in a collection can be represented
# with such shorthands.
"""
    to_toml_frontmatter(x)

Recursively convert an Advisory and all its fields (except `summary` and `details`) to serializable values for `TOML.print`
"""
to_toml_frontmatter(v::Union{VersionNumber, VersionString, VersionRange}) = string(v)
to_toml_frontmatter(x::Union{AbstractString, Integer, AbstractFloat, Bool, Dates.DateTime, Dates.Time, Dates.Date}) = x
to_toml_frontmatter(d::AbstractDict) = OrderedDict(k=>to_toml_frontmatter_collection(v, values(d)) for (k,v) in d)
to_toml_frontmatter(A::AbstractArray) = [to_toml_frontmatter_collection(x, A) for x in A]
to_toml_frontmatter(s::AdvisorySource) = OrderedDict(string(f) => to_toml_frontmatter(getproperty(s, f)) for f in fieldnames(AdvisorySource) if is_populated(getfield(s, f)))
to_toml_frontmatter_collection(x, _) = to_toml_frontmatter(x)
function to_toml_frontmatter(a::Advisory)
    # Convert all fields to TOML with a few special cases:
    return OrderedDict{String,Any}(
        string(f) => to_toml_frontmatter(
            f == :affected ? filter(is_vulnerable, getproperty(a, f)) : # Skip (empty) non-vulnerabilities
            getproperty(a, f))
        for f in fieldnames(Advisory) if
            is_populated(getproperty(a, f)) && (f ∉ (:summary, :details))) # Summary and details are not frontmatter
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
    return OrderedDict("pkg" => to_toml_frontmatter(v.pkg),
                    "ranges" => to_toml_frontmatter(v.ranges))
end

function Base.print(io::IO, vuln::Advisory)
    frontmatter = sprint(TOML.print, to_toml_frontmatter(vuln))
    # I don't think it's possible for TOML.print to output ``` on a line, but just in case:
    nticks = maximum(x->length(x.captures[1])+1, eachmatch(r"^\s*(`+)\s*$", frontmatter), init=3)
    buf = IOBuffer()
    println(buf, repeat("`", nticks), "toml")
    print(buf, frontmatter)
    println(buf, repeat("`", nticks))
    println(buf)
    is_populated(vuln.summary) && println(buf, "# ", replace(vuln.summary, r"\s+"=>" "), "\n\n")
    is_populated(vuln.details) && println(buf, vuln.details)
    seekstart(buf)
    # Roundtrip through the parser to standardize some syntaxes and avoid churn from subsequent parse/prints
    println(io, CommonMark.markdown(CommonMark.Parser()(buf)))
end

# Use the TOML/Markdown as the display:
Base.show(io::IO, mime::MIME"text/plain", vuln::Advisory) = show(io, mime, CommonMark.Parser()(string(vuln)))
Base.show(io::IO, vuln::Advisory) = print(io, vuln)

####### Read a Markdown/TOML advisory
parsefile(filename) = something(open(io->tryparse(Advisory, io), filename))
function Base.tryparse(::Type{Advisory}, s::Union{AbstractString, IO})
    doc = (CommonMark.Parser())(s)
    toml = doc.first_child
    isdefined(toml, :t) && toml.t isa CommonMark.CodeBlock && toml.t.info == "toml" || return nothing
    frontmatter = TOML.tryparse(toml.literal)
    frontmatter === nothing && return nothing
    doc.first_child = toml.nxt
    summary = if isdefined(doc.first_child, :t) && doc.first_child.t isa CommonMark.Heading
        s = strip(chopprefix(CommonMark.markdown(doc.first_child), r"^#+"))
        doc.first_child = doc.first_child.nxt
        s
    end
    remainder = strip(CommonMark.markdown(doc))
    details = isempty(remainder) ? nothing : remainder

    return try
        Advisory(; Dict(Symbol(k)=>v for (k,v) in frontmatter)..., summary, details)
    catch _
        nothing
    end
end

"""
    to_osv_dict(x)

Recursively convert an Advisory and all its fields (except `summary` and `details`) to serializable values for `JSON3.write`
such that it will create a valid OSV JSON
"""
to_osv_dict(v::Union{VersionNumber, VersionString, VersionRange, Dates.Time, Dates.Date}) = string(v)
to_osv_dict(x::Dates.DateTime) = chopsuffix(string(x), "Z") * "Z" # All times should be UTC; print them as such
to_osv_dict(x::Union{AbstractString, Integer, AbstractFloat, Bool}) = x
to_osv_dict(d::AbstractDict) = OrderedDict(string(k)=>to_osv_dict(v) for (k,v) in d)
to_osv_dict(A::AbstractArray) = [to_osv_dict(v) for v in A]
function to_osv_dict(a::Union{Severity, Reference, Credit, AdvisorySource})
    return OrderedDict(string(f) => to_osv_dict(getproperty(a, f)) for f in fieldnames(typeof(a)) if is_populated(getproperty(a, f)))
end
function to_osv_dict(a::Advisory)
    # The only special thing we need to is `database_specific`
    d = OrderedDict(k => to_osv_dict(v) for (k,v) in osv_pairs(a) if is_populated(v))
    d["database_specific"] = OrderedDict{String,Any}("license" => "CC-BY-4.0")
    for (k,v) in database_specific_pairs(a)
        is_populated(v) || continue
        k == "license" && error("license may not be separately specified")
        d["database_specific"][k] = to_osv_dict(v)
    end
    return d
end
# Package vulnerabilities are the one thing we store quite differently:
function to_osv_dict(vuln::PackageVulnerability)
    return Dict{String, Any}(
        "package" => OrderedDict(
            "ecosystem" => "Julia",
            "name" => vuln.pkg,
            "purl" => purl(vuln)
        ),
        "ranges" => [OrderedDict("type"=>"SEMVER", "events"=>osv_events(vuln.ranges))],
        # TODO: "versions" => registered_versions_within_the_ranges(vuln.pkg, vuln.ranges)
    )
end
