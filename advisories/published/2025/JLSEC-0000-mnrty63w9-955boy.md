```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrty63w9-955boy"
modified = 2025-10-11T04:56:12.345Z
aliases = ["GHSA-7q92-pph9-5686"]

[[credits]]
name = "abdtyx"
type = "REPORTER"
[[credits]]
name = "nbshenxm"
type = "REPORTER"
[[credits]]
name = "haruki3hhh"
type = "REPORTER"
[[credits]]
name = "jorgectf"
type = "REPORTER"

[[jlsec_sources]]
id = "GHSA-7q92-pph9-5686"
imported = 2025-10-11T04:56:12.345Z
modified = 2024-07-23T12:55:10.000Z
published = 2024-07-23T12:55:10.000Z
url = "https://api.github.com/repos/duckdb/duckdb/security-advisories/GHSA-7q92-pph9-5686"
html_url = "https://github.com/duckdb/duckdb/security/advisories/GHSA-7q92-pph9-5686"
```

# GitHub Actions expression injection vulnerability in CheckIssueForCodeFormatting workflow

### Summary

Pull request #10149 introduced a GitHub Actions expression injection vulnerability, potentially allowing an attacker to take over the repository.

### Details

There is a vulnerability in Line 24 of `.github/workflow/CheckIssueForCodeFormatting.yml`, where the `${{ github.event.issue.body }}` entry is directly used in the run statement. This design allows for the execution of arbitrary commands if a malicious issue is submitted. Consequently, an attacker could compromise the GitHub Runner, thereby accessing sensitive CI secrets such as `GH_TOKEN` and `GITHUB_TOKEN`. Therefore, the attacker can push arbitrary code to the repository using the `GITHUB_TOKEN`.

### Impact

We have searched through the entire issue log of the `duckdb` repository (including the history of the issue bodies) for potential abuses of this vulnerability and have found that this has not been exploited. The vulnerability was patched via PR #11522. No releases were affected by the vulnerability. There are no actions required of users.

