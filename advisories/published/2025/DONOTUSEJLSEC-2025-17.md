```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-17"
modified = 2000-09-26T18:39:59Z
published = 2025-09-23T14:07:03.665Z
upstream = ["CVE-2022-23521"]
references = ["https://github.com/git/git/commit/508386c6c5857b4faa2c3e491f422c98cc69ae76", "https://github.com/git/git/security/advisories/GHSA-c738-c5qq-xg89", "https://security.gentoo.org/glsa/202312-15", "https://github.com/git/git/commit/508386c6c5857b4faa2c3e491f422c98cc69ae76", "https://github.com/git/git/security/advisories/GHSA-c738-c5qq-xg89", "https://security.gentoo.org/glsa/202312-15"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.42.0+0"]

[[jlsec_sources]]
id = "CVE-2022-23521"
imported = 2025-09-23T02:52:12.931Z
modified = 2024-11-21T06:48:44.380Z
published = 2023-01-17T23:15:15.580Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-23521"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-23521"
```

# Git is distributed revision control system

Git is distributed revision control system. gitattributes are a mechanism to allow defining attributes for paths. These attributes can be defined by adding a `.gitattributes` file to the repository, which contains a set of file patterns and the attributes that should be set for paths matching this pattern. When parsing gitattributes, multiple integer overflows can occur when there is a huge number of path patterns, a huge number of attributes for a single pattern, or when the declared attribute names are huge. These overflows can be triggered via a crafted `.gitattributes` file that may be part of the commit history. Git silently splits lines longer than 2KB when parsing gitattributes from a file, but not when parsing them from the index. Consequentially, the failure mode depends on whether the file exists in the working tree, the index or both. This integer overflow can result in arbitrary heap reads and writes, which may result in remote code execution. The problem has been patched in the versions published on 2023-01-17, going back to v2.30.7. Users are advised to upgrade. There are no known workarounds for this issue.

