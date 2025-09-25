```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-9"
modified = 2025-09-25T16:53:33.000Z
published = 2025-09-23T14:07:03.624Z
upstream = ["CVE-2021-40330"]
references = ["https://github.com/git/git/commit/a02ea577174ab8ed18f847cf1693f213e0b9c473", "https://github.com/git/git/compare/v2.30.0...v2.30.1", "https://lists.debian.org/debian-lts-announce/2022/10/msg00014.html", "https://github.com/git/git/commit/a02ea577174ab8ed18f847cf1693f213e0b9c473", "https://github.com/git/git/compare/v2.30.0...v2.30.1", "https://lists.debian.org/debian-lts-announce/2022/10/msg00014.html"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.31.0+0"]

[[jlsec_sources]]
id = "CVE-2021-40330"
imported = 2025-09-23T02:52:12.921Z
modified = 2024-11-21T06:23:52.550Z
published = 2021-08-31T04:15:10.667Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-40330"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-40330"
```

# `git_connect_git` in connect.c in Git before 2.30.1 allows a repository path to contain a newline character

`git_connect_git` in connect.c in Git before 2.30.1 allows a repository path to contain a newline character, which may result in unexpected cross-protocol requests, as demonstrated by the `git://localhost:1234/%0d%0a%0d%0aGET%20/%20HTTP/1.1` substring.

