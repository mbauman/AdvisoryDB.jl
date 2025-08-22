# A Julia Security Advisory Database

> [!WARNING]
> Work in progress. Likely incorrect and definitely incomplete data.

## Overview

The goal of this repository is two-fold:
* Be a store of security advisories for packages in the Julia ecosystem, publicizing them in [valid OSV schema](https://ossf.github.io/osv-schema/).
    * To publish a security advisory here, GitHub-based packages should author and publish a GitHub Security Advisory on their repository. All security advisories on registered GitHub packages can be automatically imported by a GitHub action on this repository (currently manually triggered, but to be regularly run over all registered packages in the future). All other packages can open a pull request to this repository directly, adding the appropriately formatted OSV json.
* Provide tooling to find, identify, and semi-automatically tag independently-issued advisories in the [NIST National Vulnerability Database](https://nvd.nist.gov), the [ENISA European Vulnerability Database](https://euvd.enisa.europa.eu), and the [GitHub Advisory Database](https://github.com/advisories).

### The data store

Packages that are registered in the General registry and have vulnerabilities for released version(s) have those vulnerabilities stored in OSV-formatted JSON files named by their source id in the `packages/General/$package_name/` directory.

In the future, we will need to register and assign our own `CVE`-like prefex as we are not just tracking upstream vulnerabilities, but we are also an _originating_ issuer (even for GitHub Security Advisories right now, see below). Python uses `PYSEC`, rust uses `RUSTSEC`, etc.

### The tooling

The code in this repository aims to help create and manage those OSV-formatted JSON files, using several upstream data sources. The upstream data here is... challenging.  There are several key data sources:

#### Data Sources

* MITRE's CVEs: while these IDs are the unique and canonical identifiers for any major vulnerability, the reports themselves are largely unstructured text and may be of varying quality and may be disputed. They may or may not have structured information about the software **vendor** and **product**, and even versioning information may be missing or lacking. A good example is [CVE-2021-4048](https://www.cve.org/CVERecord?id=CVE-2021-4048).
* NIST's NVD: The National Vulnerability Database takes CVEs and _enriches_ them with additional metadata — most importantly the CPE (Common Platform Enumeration) identifier. The above [CVE-2021-4048 in NVD](https://nvd.nist.gov/vuln/detail/CVE-2021-4048) adds structured identifiers for OpenBLAS (`cpe:2.3:a:openblas_project:openblas:…`) and Julia itself (`cpe:2.3:a:julialang:julia:…`) with very specific version information attached.
* ENISA's EUVD: Tracks nearly all CVEs with their own independent identifier (and maybe also advisories from other ecosystems). They _also_ enrich advisories (I think mostly cribbing from CISA's vulnrichment), but do not use CPEs. Instead, they have unstructured vendor, product, and version fields. That version field is _sometimes_ obviously parse-able (e.g., `1.2.0 < 1.2.3`), but often is freetext (`Fixed in libfoo 1.2.3 (Affected 1.2.0,1.2.1,1.2.2)` or `1.0.2 through 1.0.2h` or `All 1.0.2` or ...). Their vendor and product are often populated more rapidly than NVD's CPE.
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

### Automation strategy

There are hundreds of thousands of GitHub advisories and CVEs. The GitHub actions on this repository aim to find new vulnerabilities that have been registered, affect Julia packages, and automatically open pull requests suggesting thier inclusion in this database. The biggest challenge is in accurately identifying the relevant package(s) and version(s).

There are four categories of advisory that we need to handle:

* **Advisories first published here**. Package maintainers can open pull requests directly here to publish an advisory.  The OSV validation GitHub action will ensure the specification is being followed, and AdvisoryDB.jl maintainers can work with the authors within the pull request to ensure high-quality advisories. TODO: A GitHub action to auto-assign a Julia-specific identifier still needs to be written.
* **Advisories published on a registered package's GitHub repository**. The GHSA GitHub action can manually pull in GHSAs that are **not** in the global GitHub Advisories Database by specifying a given GitHub org/repo. The GitHub action opens a pull request with the converted OSV directly written to the `packages/General/$package` directory. Given that they are authored by someone in the Julia community AdvisoryDB.jl maintainers can help ensure the original GHSA has the metadata correct and is of high-quality. TODO: We should have a scheduled action periodically walk its way through all registered GitHub packages and check for new advisories, and we need the above Julia-security identifier creation.
* **Independently-issued advisories**:
    * **discussing a Julia package**. Any of the advisory databases listed above might publish an advisory that mentions a Julia package. Thanks to the convention of discussing packages as `Package.jl`, this can be fairly accurately targeted, even within freetext descriptions. But these are not definitive; the AdvisoryDB maintainers need to be able to issue determinations on relevancy and confirm the applicable version ranges.
    * **pertaining to an upstream package that a Julia package bundles**. There are two challenges here; we first must know what all the Julia packages bundle (and precisely which upstream versions a given Julia package version included), and then even when we know that, we need to be able to conclusively identify _those_ upstream packages in the upstream databases.

    In these cases, the applicability, relevance, and exact version ranges of the corresponding Julia package is not as definitive. Therefore, these advisories are published in a two step process. The `upstream_advisories.toml` file contains a table of advisories by their identifier. Each advisory entry has a table of Julia packages. These packages may have values of either a string — describing why that advisory should not apply — or an array of version ranges to which it does apply.

In addition to the periodic check, both NVD and GitHub support fetching all advisories for a specific CPE or repository, respectively. They also support fetching a single CVE or repository at a time.

### The automations

So the GitHub actions here:

* Validate the OSV schema of all jsons in `packages` (which includes ensuring that mentioned versions exist in the General registry). This runs on every PR and push for those juicy green checkmarks.
* Import a GHSA from a specific repository:
    * Manually, by a given org/repo
    * TODO: Automatically, slowly scanning across all packages with GitHub repos
* Identify possibly-related upstream advisories based upon some search and open pull requests suggesting their addition to `upstream_advisories.toml`. Multiple flavors of haystacks can be searched:
    * Manually, by single CVE or EUVD identifier
    * Manually, by a CPE-like `vendor:product` pair (searching both `a` part CPEs in the NVD and vendor/product pairs in the EUVD).
    * TODO: By recently published (EUVD) or recently updated (NVD only) advisories. The EUVD API is severly limited here. TODO: this should run nightly
* TODO: Import/update upstream advisories based upon the state of `upstream_advisories.toml`.

We also need an up-to-date listing of upstream component metadata.

* TODO: A GitHub action should scan package source for upstream components matched based upon the contents of `cpe_config.toml` and auto-generate `cpe_map.toml`.

## References

* [OSV Schema](https://ossf.github.io/osv-schema/)
* [pypa/advisory-db](https://github.com/pypa/advisory-database)
* [rustsec/advisory-db](https://github.com/rustsec/advisory-db)
* [golang/vulndb](https://github.com/golang/vulndb)
* [rubysec/ruby-advisory-db](https://github.com/rubysec/ruby-advisory-db)
* [RConsortium/R-Advisory-Database](https://github.com/RConsortium/R-Advisory-Database)
