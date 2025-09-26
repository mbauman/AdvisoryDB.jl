```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-25"
modified = 2025-09-26T17:16:58.363Z
published = 2025-09-23T14:07:03.685Z
upstream = ["CVE-2024-24575"]
references = ["https://github.com/libgit2/libgit2/commit/add2dabb3c16aa49b33904dcdc07cd915efc12fa", "https://github.com/libgit2/libgit2/releases/tag/v1.6.5", "https://github.com/libgit2/libgit2/releases/tag/v1.7.2", "https://github.com/libgit2/libgit2/security/advisories/GHSA-54mf-x2rh-hq9v", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/4M3P7WIEPXNRLBINQRJFXUSTNKBCHYC7/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/7CNDW3PF6NHO7OXNM5GN6WSSGAMA7MZE/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S635BGHHZUMRPI7QOXOJ45QHDD5FFZ3S/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/Z6MXOX7I43OWNN7R6M54XLG6U5RXY244/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/ZGNHOEE2RBLH7KCJUPUNYG4CDTW4HTBT/", "https://github.com/libgit2/libgit2/commit/add2dabb3c16aa49b33904dcdc07cd915efc12fa", "https://github.com/libgit2/libgit2/releases/tag/v1.6.5", "https://github.com/libgit2/libgit2/releases/tag/v1.7.2", "https://github.com/libgit2/libgit2/security/advisories/GHSA-54mf-x2rh-hq9v", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/4M3P7WIEPXNRLBINQRJFXUSTNKBCHYC7/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/7CNDW3PF6NHO7OXNM5GN6WSSGAMA7MZE/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S635BGHHZUMRPI7QOXOJ45QHDD5FFZ3S/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/Z6MXOX7I43OWNN7R6M54XLG6U5RXY244/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/ZGNHOEE2RBLH7KCJUPUNYG4CDTW4HTBT/"]

[[affected]]
pkg = "LibGit2_jll"
ranges = [">= 1.4.3+0, < 1.7.2+0"]

[[jlsec_sources]]
id = "CVE-2024-24575"
imported = 2025-09-23T02:52:13.176Z
modified = 2024-11-21T08:59:27.280Z
published = 2024-02-06T22:16:15.057Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-24575"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-24575"
```

# libgit2 is a portable C implementation of the Git core methods provided as a linkable library with a...

libgit2 is a portable C implementation of the Git core methods provided as a linkable library with a solid API, allowing to build Git functionality into your application. Using well-crafted inputs to `git_revparse_single` can cause the function to enter an infinite loop, potentially causing a Denial of Service attack in the calling application. The revparse function in `src/libgit2/revparse.c` uses a loop to parse the user-provided spec string. There is an edge-case during parsing that allows a bad actor to force the loop conditions to access arbitrary memory. Potentially, this could also leak memory if the extracted rev spec is reflected back to the attacker. As such, libgit2 versions before 1.4.0 are not affected. Users should upgrade to version 1.6.5 or 1.7.2.

