```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr43tbso-1wgp0zm"
modified = 2025-09-23T02:52:13.176Z
upstream = ["CVE-2023-22742"]
references = ["http://www.openwall.com/lists/oss-security/2023/11/06/5", "https://github.com/libgit2/libgit2/commit/42e5db98b963ae503229c63e44e06e439df50e56", "https://github.com/libgit2/libgit2/commit/cd6f679af401eda1f172402006ef8265f8bd58ea", "https://github.com/libgit2/libgit2/releases/tag/v1.4.5", "https://github.com/libgit2/libgit2/releases/tag/v1.5.1", "https://github.com/libgit2/libgit2/security/advisories/GHSA-8643-3wh5-rmjq", "https://www.libssh2.org", "http://www.openwall.com/lists/oss-security/2023/11/06/5", "https://github.com/libgit2/libgit2/commit/42e5db98b963ae503229c63e44e06e439df50e56", "https://github.com/libgit2/libgit2/commit/cd6f679af401eda1f172402006ef8265f8bd58ea", "https://github.com/libgit2/libgit2/releases/tag/v1.4.5", "https://github.com/libgit2/libgit2/releases/tag/v1.5.1", "https://github.com/libgit2/libgit2/security/advisories/GHSA-8643-3wh5-rmjq", "https://www.libssh2.org"]

[[affected]]
pkg = "LibGit2_jll"
ranges = ["< 1.6.1+0"]

[database_specific.source]
id = "CVE-2023-22742"
modified = "2024-11-21T07:45:20.250Z"
published = "2023-01-20T23:15:10.307Z"
imported = "2025-09-23T02:52:13.176Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-22742"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-22742"
```

# libgit2 is a cross-platform, linkable library implementation of Git

libgit2 is a cross-platform, linkable library implementation of Git. When using an SSH remote with the optional libssh2 backend, libgit2 does not perform certificate checking by default. Prior versions of libgit2 require the caller to set the `certificate_check` field of libgit2's `git_remote_callbacks` structure - if a certificate check callback is not set, libgit2 does not perform any certificate checking. This means that by default - without configuring a certificate check callback, clients will not perform validation on the server SSH keys and may be subject to a man-in-the-middle attack. Users are encouraged to upgrade to v1.4.5 or v1.5.1. Users unable to upgrade should ensure that all relevant certificates are manually checked.

