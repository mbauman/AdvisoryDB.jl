```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-20"
modified = 2025-09-25T16:53:33.000Z
published = 2025-09-23T14:07:03.672Z
upstream = ["CVE-2023-23946"]
references = ["https://github.com/git/git/commit/c867e4fa180bec4750e9b54eb10f459030dbebfd", "https://github.com/git/git/security/advisories/GHSA-r87m-v37r-cwfh", "https://security.gentoo.org/glsa/202312-15", "https://github.com/git/git/commit/c867e4fa180bec4750e9b54eb10f459030dbebfd", "https://github.com/git/git/security/advisories/GHSA-r87m-v37r-cwfh", "https://security.gentoo.org/glsa/202312-15"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.42.0+0"]

[[jlsec_sources]]
id = "CVE-2023-23946"
imported = 2025-09-23T02:52:12.942Z
modified = 2024-11-21T07:47:09.383Z
published = 2023-02-14T20:15:17.457Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-23946"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-23946"
```

# Git, a revision control system, is vulnerable to path traversal prior to versions 2.39.2, 2.38.4, 2....

Git, a revision control system, is vulnerable to path traversal prior to versions 2.39.2, 2.38.4, 2.37.6, 2.36.5, 2.35.7, 2.34.7, 2.33.7, 2.32.6, 2.31.7, and 2.30.8. By feeding a crafted input to `git apply`, a path outside the working tree can be overwritten as the user who is running `git apply`. A fix has been prepared and will appear in v2.39.2, v2.38.4, v2.37.6, v2.36.5, v2.35.7, v2.34.7, v2.33.7, v2.32.6, v2.31.7, and v2.30.8. As a workaround, use `git apply --stat` to inspect a patch before applying; avoid applying one that creates a symbolic link and then creates a file beyond the symbolic link.

