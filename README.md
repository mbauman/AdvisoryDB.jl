# The Julia Security Advisory Database

> [!WARNING]
> Work in progress. The advisories here are imported on a best-effort basis and are known to be incomplete.

## Overview

There are four key goals of this repository:
* Be the database of security advisories that pertain to packages in the Julia ecosystem.
* Provide the structure for authoring, reviewing, and maintaining these security advisories.
* Export the security advisories in standard format for downstream consumers.
* Provide tooling to search, identify, and import applicable security advisories (*both* upstream and aliasing) from multiple independent advisory databases.

### Scope

This database only supports advisories against packages in the "Julia" ecosystem. The packages in the "Julia" ecosystem are defined to be exactly those in the default [General registry](https://github.com/JuliaRegistries/General).

This is a **security** advisory database; informational and other notices that are not security issues are out of scope.

## The database

Security advisories against packages in the [Julia General registry](https://github.com/JuliaRegistries/General) are published in the `advisories/published` directory of this repository, grouped by year, with filenames corresponding to their uniquely assigned identifier. All published advisories have an identifier of `JLSEC-YYYY-nnn`, and are stored as Markdown files with a TOML "front-matter" section with structured metadata.

With a few important exceptions, these fields correspond _exactly_ (including the `schema_version`!) to their definitions in the [Open Source Vulnerability (OSV) format](https://ossf.github.io/osv-schema). The exceptions are:
* The `summary` is the first Markdown section after the TOML frontmatter (if it's a header).
* The `details` are the remainder of the file.
* The `affected` packages are stored much more succinctly as just an array of tables with each package's name (`pkg`) and vulnerable `ranges`. The ranges themselves are vectors of strings, using [GitHub's vulnerable version range (VVR) syntax](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/best-practices-for-writing-repository-security-advisories#affected-versions).
* Timestamps are stored directly as TOML datetimes, not as strings.
* Credits support an optional shorthand `"author <author@example.com>"` string format for the common cases where no credit type is assigned and there is only one email-based contact method.
* References support an optional shorthand string format to just contain the URL itself for the default `"WEB"` reference type.
* Severities similarly support an optional shorthand string format that contains just CVSS vector itself.
* Fields with names starting with `jlsec_` are placed into `database_specific` (the the prefix removed).

<details><summary>In practice, a valid JLSEC advisory looks like this:</summary>

````md
```toml
schema_version = "1.7.3"
id = "JLSEC-2025-1"
modified = 2025-09-23T02:23:16.095Z
published = 2025-09-23T02:23:16.095Z
aliases = ["GHSA-4g68-4pxg-mw93", "CVE-2025-52479"]

[[affected]]
pkg = "HTTP"
ranges = ["<= 1.10.16"]
[[affected]]
pkg = "URIs"
ranges = ["< 1.6.0"]

[[jlsec_sources]]
html_url = "https://github.com/JuliaWeb/HTTP.jl/security/advisories/GHSA-4g68-4pxg-mw93"
id = "GHSA-4g68-4pxg-mw93"
imported = 2025-09-23T02:06:09.198Z
modified = 2025-06-24T23:01:25Z
published = 2025-06-24T23:01:25Z
url = "https://api.github.com/repos/JuliaWeb/HTTP.jl/security-advisories/GHSA-4g68-4pxg-mw93"
```

# CR/LF injection in URIs.jl (also affects HTTP.jl)

### Description

The URIs.jl and HTTP.jl packages allowed the construction of URIs containing CR/LF characters. If user input was not otherwise escaped or protected, this can lead to a CRLF injection attack.
````

</details>

## Authoring, reviewing, and maintaining JLSEC advisories

New JLSEC advisories are published through a typical pull request process on this repository; see [CONTRIBUTING.md](https://github.com/JuliaLang/SecurityAdvisories.jl/blob/main/CONTRIBUTING.md) for details.

Once published, an advisory **shall not** be deleted. If it is determined to have been published in error, its `withdrawn` date should be set.

A particular advisory identifier may be reserved by creating an empty file in `advisories/reserved/` with the reserved ID.

All fields (other than the `id` and `published` timestamp) may be edited through subsequent pull requests; the updated time will be appropriately set after merging.

JLSEC advisories that correspond to advisories in other databases should take care to appropriately set their `alias`, `upstream`, and `related` fields.

## Security advisory export

All advisories in the `advisories/published` folder are automatically exported to JSON files grouped by year in [valid OSV schema](https://ossf.github.io/osv-schema/) on the [`generated/osv` branch](https://github.com/mbauman/SecurityAdvisories.jl/tree/generated/osv). Pull request CI does a dry-run of this conversion and validation before merging.

## The tooling

The code in this repository aims to help create and manage these advisories, using several upstream data sources. The upstream data here is... challenging.  There are several key data sources:

### Data Sources

* MITRE's CVEs: while these IDs are the unique and canonical identifiers for any major vulnerability, the reports themselves are largely unstructured text and may be of varying quality and may be disputed. They may or may not have structured information about the software **vendor** and **product**, and even versioning information may be missing or lacking. A good example is [CVE-2021-4048](https://www.cve.org/CVERecord?id=CVE-2021-4048).
* NIST's NVD: The National Vulnerability Database takes CVEs and _enriches_ them with additional metadata — most importantly the CPE (Common Platform Enumeration) identifier. The above [CVE-2021-4048 in NVD](https://nvd.nist.gov/vuln/detail/CVE-2021-4048) adds structured identifiers for OpenBLAS (`cpe:2.3:a:openblas_project:openblas:…`) and Julia itself (`cpe:2.3:a:julialang:julia:…`) with very specific version information attached. This enrichment step often lags behind the initial CVE publication by many months.
* ENISA's EUVD: Tracks nearly all CVEs with their own independent identifier (and maybe also advisories from other ecosystems). They _also_ enrich advisories (I think mostly cribbing from CISA's vulnrichment), but do not use CPEs. Instead, they have unstructured vendor, product, and version fields. That version field is _sometimes_ obviously parse-able (e.g., `1.2.0 < 1.2.3`), but often is freetext (`Fixed in libfoo 1.2.3 (Affected 1.2.0,1.2.1,1.2.2)` or `1.0.2 through 1.0.2h` or `All 1.0.2` or ...). Their vendor and product are often populated more rapidly than NVD's CPE. Their summary and details are often qualitatively worse than NVD's.
* GitHub's GHSA: GitHub Security Advisories have their own identifiers and may or may not have a CVE alias. Some GHSAs are "orginated" by GitHub, but most are imported from NVD. Note that there are three flavors of GHSAs:
    * There are the advisories available in their advisory database at `github.com/advisories`. *These are not all the GHSAs!*
        * Some GHSAs in this database are GitHub reviewed, tagged with a specific package, package metadata, and an ecosystem. Julia is not (yet!) a reviewed ecosystem. Cf. https://github.com/github/advisory-database/issues/1689.
        * Some GHSAs in this database are not reviewed, but are still accessible at `/advisories` and via API. These are mostly (maybe entirely?) CVEs that were automatically imported from upstream advisory databases (maybe just NVD?).
    * There are advisories published on a repository. These also have `GHSA-xxxx-xxxx-xxxx` ids. You can request GitHub review and GitHub can — as a CVE Numbering Authority — assign and publish a corresponding CVE if appropriate. However, even with that review step, this GHSA will not be available at `/advisories` if not part of a reviewed ecosystem (see above)! They are not available via API unless you specifically ask for the security advisories _at a particular repository_. Without being a part of a reviewed ecosystem, the affected product and version fields are unrestricted plain text. A good example is [GHSA-4g68-4pxg-mw93](https://github.com/JuliaWeb/HTTP.jl/security/advisories/GHSA-4g68-4pxg-mw93), which is on HTTP.jl's repository, names both HTTP and URIs as vulnerable, and has a CVE that was assigned by GitHub staff. The corresponding [CVE-2025-52479](https://nvd.nist.gov/vuln/detail/CVE-2025-52479) has not yet been enriched by the NVD and has no structured information about the packages in the report. It's also worth noting that GitHub's `/advisories` database _did not import_ that CVE from NVD.
* JuliaRegistries/General: The Pkg registry provides the available package names along with their available versions and upstream repository.
* Every package's source code and dependency graph. All Julia dependencies are tracked in a first-class manner through Pkg and the `Manifest.toml`, but a Julia package might _also_ ship **non-Julia** code. We need to identify these upstream components; they are _not_ tracked in the Manifest. There are four possible ways in which these upstream components might be provided:
    * As a JLL built by BinaryBuilder and a build script in Yggdrasil. These packages are easy to identify (they end in `_jll`!) and are the canonical way to bundle upstream components today. There is ([not yet](https://github.com/JuliaPackaging/BinaryBuilder.jl/issues/639)) structured metadata about these components. JLLs built with BinaryBuilder v0.2.5+ (after June 2020) have a **Sources** section in their README that lists URLs from which sources were downloaded — often including their version numbers. Prior to this, (roughly August 2019-June 2020), this information is best found by correlating against build scripts themselves. A good example is [Cairo_jll@1.18.5+0](https://github.com/JuliaBinaryWrappers/Cairo_jll.jl/tree/Cairo-v1.18.5%2B0). Its README logged that it downloaded and built `cairo-1.18.4.tar.xz` (downloaded from cairographics.org), and it provides that binary as an Julia Artifact pointing to its release (v1.18.5+0) assets. Versions at [Cairo_jll@1.16.0+5](https://github.com/JuliaBinaryWrappers/Cairo_jll.jl/releases/tag/Cairo-v1.16.0%2B5) and prior _do not have this logged_. To identify prior versions, we'd need to correlate against the (likely) Yggdrasil build script.
    * Prior to JLLs, BinaryProvider was briefly used. They used `deps/build.jl` scripts in the higher-level Cairo.jl package to gather artifacts from the `_jll` repositories. Early in BinaryProvider's evolution, they did not list the JLLs in the Project/Manifest, but later they did. See, e.g., [Cairo@0.7.0](https://github.com/JuliaGraphics/Cairo.jl/tree/v0.7.0) and [Cairo@0.8.0](https://github.com/JuliaGraphics/Cairo.jl/tree/v0.8.0).
    * Prior to BinaryProvider, BinDeps was largely used. Here, the `deps/build.jl` went out to all the various package managers (WinRPM, Homebrew, apt-get, yum) to get the built binaries — or it did a wholesale from-source build. See [Cairo@0.6.0](https://github.com/JuliaGraphics/Cairo.jl/tree/v0.6.0), which provided _not just Cairo_, but all its dependencies, too.
    * It is also possible that `deps/build.jl` was (ab)used in other ways, too.
    * It is also possible that `Artifacts.toml` downloads arbitrary executables.

## Automation strategy

There are hundreds of thousands of GitHub advisories and CVEs. The GitHub actions on this repository aim to find new vulnerabilities that have been registered, affect Julia packages, and automatically open pull requests suggesting thier inclusion in this database. The biggest challenge is in accurately identifying the relevant package(s) and version(s).

There are four categories of advisory that we need to handle:

* **Advisories first published here**. Advisories can be published here directly via pull request. Subsequent advisories may be created in other databases; these should then later be added as `alias`es.
* **Advisories published on a registered package's GitHub repository**. A GitHub-based package maintainer can create a new GHSA security advisory directly against the canonical (registered) package repository. The versions listed within this GHSA directly corresponds to the registered and vulnerable, and the JLSEC here **must** have this GHSA listed as one of its `alias`es.
* **Independently-issued advisories**:
    * **discussing or affecting a Julia package**. Any of the advisory databases listed above might publish an advisory with a Julia package mentioned or explicitly listed as `affected`. Thanks to the convention of discussing packages as `Package.jl`, this can be fairly accurately targeted, even within freetext descriptions. The versions here (if there are any) correspond directly against the registered versions of the Package, and the independently-issued advisory **must** be listed as an `alias`.
    * **pertaining to an upstream package that a Julia package bundles**. There are two challenges here; we first must know what upstream projects the Julia packages bundle (and precisely which upstream versions a given Julia package version included), and then even when we know that, we need to be able to conclusively identify _those_ upstream projects in these other advisory databases. The versions listed in this independently-issued advisory are _arbitrary_ and dependent upon the upstream project itself, making range comparisons _fraught_. Because the newly issued JLSEC corresponding to this advisory contains _novel version information_ these advisories **must** be listed as `upstream`.

In addition to the periodic check, NVD, EUVD, and GitHub all support fetching all advisories for a specific CPE or repository, respectively. They also support fetching a single CVE or repository at a time.

### The automations

So the GitHub actions here:

* Run some basic unit tests of the Julia `src` functionality
* Automatically update ids, timestamps, export to OSV, and validate that OSV. This is run upon merges to main, and also dry-run on pull requests.
* Search upstream advisory databases for potentially relevant advisories, opening pull requests to import them. Finding relevant advisories to JLL packages is done based upon its components (store in the `package_components.toml` file)
* Automatically update the `package_components.toml` file by looking through the JLL's sources (in `jll_metadata.toml`) and finding download URLs and repositories that match an upstream project (manually populated in `upstream_project_info.toml`)
* Automatically evaluates Yggdrasil's build scripts to update the `jll_metadata.toml` file.

## References

* [OSV Schema](https://ossf.github.io/osv-schema/)
* [OSV.dev discussions](https://github.com/google/osv.dev/discussions) and issues, in particular:
    * [Best practice for retrospective advisory identifier assignment & dating #3977](https://github.com/google/osv.dev/discussions/3977)
    * [OSV.dev downstream users have a clearly defined user journey to make corrections to OSV records served by OSV.dev with minimal overhead by all parties #2191](https://github.com/google/osv.dev/issues/2191)
* [haskell/security-advisories](https://github.com/haskell/security-advisories)
* [pypa/advisory-db](https://github.com/pypa/advisory-database)
* [rustsec/advisory-db](https://github.com/rustsec/advisory-db)
* [golang/vulndb](https://github.com/golang/vulndb)
* [rubysec/ruby-advisory-db](https://github.com/rubysec/ruby-advisory-db)
* [RConsortium/R-Advisory-Database](https://github.com/RConsortium/R-Advisory-Database)
