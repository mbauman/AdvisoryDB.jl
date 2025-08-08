# A Julia Security Advisory Database

> [!WARNING]
> Work in progress. Likely incorrect data.

## Overview

The goal of this repository is two-fold:
* Be a store of security advisories for packages in the Julia ecosystem
* Provide tooling to find, identify, convert, and validate GitHub Security Advisories (GHSAs) and CVEs

### The data store

Packages that are registered in the General registry and have vulnerabilities for released version(s) have those vulnerabilities stored in OSV-formatted YAML files named by their CVE id in the `packages/$package_name/$package_uuid/` path.

> [!TOOD]
> The exact path structure here may change. We may want to explicitly name the registry (and potentially support multiple?).
> It's unclear if the UUID is necessary or even helpful, given that this is already scoped to a name in a registry, but
> theoretically a registry could have multiple identically-named packages.  That's not allowed in the General registry, however.

### The tooling

The code in this repository aims to help create and manage those OSV-formatted YAML files, using several upstream data sources. The upstream data here is... challenging.  There are several key data sources:

* CVE: while these IDs are the unique and canonical identifiers for any major vulnerability, the reports themselves are largely unstructured text and may be of varying quality and may be disputed. They may or may not have structured information about the software **vendor** and **product**, and even versioning information may be missing or lacking. A good example is [CVE-2021-4048](https://www.cve.org/CVERecord?id=CVE-2021-4048).
* NVD: The National Vulnerability Database takes CVEs and _enriches_ them with additional metadata — most importantly the CPE (Common Platform Enumeration). The above [CVE-2021-4048 in NVD](https://nvd.nist.gov/vuln/detail/CVE-2021-4048) adds structured identifiers for OpenBLAS (`cpe:2.3:a:openblas_project:openblas:…`) and Julia itself (`cpe:2.3:a:julialang:julia:…`) with very specific version information attached.
* GHSA: GitHub Security Advisories have their own identifiers and may or may not have a CVE alias. They are attached to a GitHub repository and may have metadata to identify affected product(s) with their ecosystem (a plain-text field, e.g., "Julia"), package name (plain-text field) and version information (also completely unrestricted plain text). Currently, the Julia ecosystem is ad-hoc, but there is an [open issue requesting its inclusion](https://github.com/github/advisory-database/issues/1689). A good example is [GHSA-4g68-4pxg-mw93](https://github.com/JuliaWeb/HTTP.jl/security/advisories/GHSA-4g68-4pxg-mw93), which is on HTTP.jl's official repo, names both HTTP and URIs as vulnerable, and has a CVE. The corresponding [CVE-2025-52479](https://nvd.nist.gov/vuln/detail/CVE-2025-52479) has not yet been enriched by the NVD and has no structured information about the packages in the report.
* JuliaRegistries/General: The Pkg registry provides the available package names along with their available versions and upstream repository.

#### General strategy

There are hundreds of thousands of GitHub advisories and CVEs. The GitHub actions on this repository aim to find new vulnerabilities that have been registered, affect Julia packages, and automatically open pull requests suggesting thier inclusion in this database. The biggest challenge is in accurately identifying the relevant package(s) and version(s).

In addition to the periodic check, both NVD and GitHub support fetching all advisories for a specific CPE or repository, respectively. They also support fetching a single CVE or repository at a time.

General behaviors:
* Ideally, changes to the repository's data should be driven by automated GitHub actions, either periodically run or explicitly requested. Ideally, any modifications that would be required should be (attempted) to be addressed in the upstream data itself.
    * Periodic checks should file issues if they error in any fashion
    * Explicitly requested checks (for a specific product or advisory) may error without filing an issue
* All automated changes to the repository's data are be pull requests that are manually merged. They may be manually edited before merging.
    * One pull request per CVE per package.
* To add a package to this database, register an advisory and it should be automatically suggested for inclusion.

#### Accurately identifying Julia packages

This is the hardest part. There are three sources of truth for this, from most definitive to least:

1. A GitHub security advisory is filed on a registry that is named as the source for a General package
2. A GitHub security advisory names a package in the Julia ecosystem, and that name exists as a General package
3. An NVD CPE identifies a Julia package. To date (August 2025), there are no such CPE identifiers
4. An NVD CPE identifier is associated with a Julia package through the `cpe_equivalents.yaml` file. For example, OpenSSL_JLL tracks its upstream vulnerabilities with the `cpe:2.3:a:openssl:openssl:*:*:*:*:*:*:*:*` identifier. Care must be taken to ensure that the JLL version is indeed tracking the upstream version numbers implicated in each advisory.
5. An NVD description contains unstructured plaintext that implicates some Package.jl

## Setup

1. Install dependencies:
   ```bash
   julia --project=. -e 'using Pkg; Pkg.instantiate()'
   ```

2. (Optional) Set GitHub token for higher rate limits:
   ```bash
   export GITHUB_TOKEN=your_token_here
   ```

## Usage

Run the script:
```bash
julia --project=. fetch_github_advisories.jl
```

Or request a workflow run.

## Output Structure

Advisories are saved in the following structure:
```
packages/
├── PackageName1/UUID1/
│   └── CVE-xxxx-xxxx.yml
├── PackageName2/UUID2/
│   └── CVE-yyyy-yyyy.yml
```

Each YAML file contains the advisory in OSV format with fields like:
- `id`: GitHub Security Advisory ID
- `schema_version`: OSV schema version
- `summary`: Brief description
- `details`: Detailed vulnerability information
- `affected`: Affected packages and version ranges
- `references`: Links to additional information
