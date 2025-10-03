```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-19"
modified = 2025-10-03T10:34:06.736Z
published = 2025-09-23T14:07:03.670Z
upstream = ["CVE-2023-22490"]
references = ["https://github.com/git/git/commit/c867e4fa180bec4750e9b54eb10f459030dbebfd", "https://github.com/git/git/security/advisories/GHSA-3wp6-j8xr-qw85", "https://github.com/git/git/security/advisories/GHSA-gw92-x3fm-3g3q", "https://security.gentoo.org/glsa/202312-15", "https://github.com/git/git/commit/c867e4fa180bec4750e9b54eb10f459030dbebfd", "https://github.com/git/git/security/advisories/GHSA-3wp6-j8xr-qw85", "https://github.com/git/git/security/advisories/GHSA-gw92-x3fm-3g3q", "https://security.gentoo.org/glsa/202312-15"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.42.0+0"]

[[jlsec_sources]]
id = "CVE-2023-22490"
imported = 2025-09-23T02:52:12.936Z
modified = 2024-11-21T07:44:54.803Z
published = 2023-02-14T20:15:16.683Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-22490"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-22490"
```

# Git is a revision control system

Git is a revision control system. Using a specially-crafted repository, Git prior to versions 2.39.2, 2.38.4, 2.37.6, 2.36.5, 2.35.7, 2.34.7, 2.33.7, 2.32.6, 2.31.7, and 2.30.8 can be tricked into using its local clone optimization even when using a non-local transport. Though Git will abort local clones whose source `$GIT_DIR/objects` directory contains symbolic links, the `objects` directory itself may still be a symbolic link. These two may be combined to include arbitrary files based on known paths on the victim's filesystem within the malicious repository's working copy, allowing for data exfiltration in a similar manner as CVE-2022-39253.

A fix has been prepared and will appear in v2.39.2 v2.38.4 v2.37.6 v2.36.5 v2.35.7 v2.34.7 v2.33.7 v2.32.6, v2.31.7 and v2.30.8. If upgrading is impractical, two short-term workarounds are available. Avoid cloning repositories from untrusted sources with `--recurse-submodules`. Instead, consider cloning repositories without recursively cloning their submodules, and instead run `git submodule update` at each layer. Before doing so, inspect each new `.gitmodules` file to ensure that it does not contain suspicious module URLs.

