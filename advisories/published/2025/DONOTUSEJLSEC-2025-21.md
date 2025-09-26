```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-21"
modified = 2000-09-26T18:39:59Z
published = 2025-09-23T14:07:03.675Z
upstream = ["CVE-2023-25652"]
references = ["http://www.openwall.com/lists/oss-security/2023/04/25/2", "https://github.com/git/git/commit/18e2b1cfc80990719275d7b08e6e50f3e8cbc902", "https://github.com/git/git/commit/668f2d53613ac8fd373926ebe219f2c29112d93e", "https://github.com/git/git/security/advisories/GHSA-2hvf-7c8p-28fx", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/BSXOGVVBJLYX26IAYX6PJSYQB36BREWH/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/PI7FZ4NNR5S5J5K6AMVQBH2JFP6NE4L7/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/RKOXOAZ42HLXHXTW6JZI4L5DAIYDTYCU/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/YFZWGQKB6MM5MNF2DLFTD7KS2KWPICKL/", "https://security.gentoo.org/glsa/202312-15", "http://www.openwall.com/lists/oss-security/2023/04/25/2", "https://github.com/git/git/commit/18e2b1cfc80990719275d7b08e6e50f3e8cbc902", "https://github.com/git/git/commit/668f2d53613ac8fd373926ebe219f2c29112d93e", "https://github.com/git/git/security/advisories/GHSA-2hvf-7c8p-28fx", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/BSXOGVVBJLYX26IAYX6PJSYQB36BREWH/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/PI7FZ4NNR5S5J5K6AMVQBH2JFP6NE4L7/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/RKOXOAZ42HLXHXTW6JZI4L5DAIYDTYCU/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/YFZWGQKB6MM5MNF2DLFTD7KS2KWPICKL/", "https://security.gentoo.org/glsa/202312-15"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.42.0+0"]

[[jlsec_sources]]
id = "CVE-2023-25652"
imported = 2025-09-23T02:52:12.944Z
modified = 2024-11-21T07:49:52.417Z
published = 2023-04-25T20:15:09.933Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-25652"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-25652"
```

# Git is a revision control system

Git is a revision control system. Prior to versions 2.30.9, 2.31.8, 2.32.7, 2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, by feeding specially crafted input to `git apply --reject`, a path outside the working tree can be overwritten with partially controlled contents (corresponding to the rejected hunk(s) from the given patch). A fix is available in versions 2.30.9, 2.31.8, 2.32.7, 2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1. As a workaround, avoid using `git apply` with `--reject` when applying patches from an untrusted source. Use `git apply --stat` to inspect a patch before applying; avoid applying one that create a conflict where a link corresponding to the `*.rej` file exists.

