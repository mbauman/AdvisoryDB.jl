```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-15"
modified = 2000-01-01T00:00:00.000Z
published = 2025-09-23T14:07:03.659Z
upstream = ["CVE-2022-39260"]
references = ["http://seclists.org/fulldisclosure/2022/Nov/1", "https://github.com/git/git/security/advisories/GHSA-rjr6-wcq6-83p6", "https://lists.debian.org/debian-lts-announce/2022/12/msg00025.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/C7B6JPKX5CGGLAHXJVQMIZNNEEB72FHD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OHNO2FB55CPX47BAXMBWUBGWHO6N6ZZH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UKFHE4KVD7EKS5J3KTDFVBEKU3CLXGVV/", "https://security.gentoo.org/glsa/202312-15", "https://support.apple.com/kb/HT213496", "http://seclists.org/fulldisclosure/2022/Nov/1", "https://github.com/git/git/security/advisories/GHSA-rjr6-wcq6-83p6", "https://lists.debian.org/debian-lts-announce/2022/12/msg00025.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/C7B6JPKX5CGGLAHXJVQMIZNNEEB72FHD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OHNO2FB55CPX47BAXMBWUBGWHO6N6ZZH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UKFHE4KVD7EKS5J3KTDFVBEKU3CLXGVV/", "https://security.gentoo.org/glsa/202312-15", "https://support.apple.com/kb/HT213496"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.42.0+0"]

[[jlsec_sources]]
id = "CVE-2022-39260"
imported = 2025-09-23T02:52:12.928Z
modified = 2024-11-21T07:17:54.090Z
published = 2022-10-19T12:15:10.160Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-39260"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-39260"
```

# Git is an open source, scalable, distributed revision control system

Git is an open source, scalable, distributed revision control system. `git shell` is a restricted login shell that can be used to implement Git's push/pull functionality via SSH. In versions prior to 2.30.6, 2.31.5, 2.32.4, 2.33.5, 2.34.5, 2.35.5, 2.36.3, and 2.37.4, the function that splits the command arguments into an array improperly uses an `int` to represent the number of entries in the array, allowing a malicious actor to intentionally overflow the return value, leading to arbitrary heap writes. Because the resulting array is then passed to `execv()`, it is possible to leverage this attack to gain remote code execution on a victim machine. Note that a victim must first allow access to `git shell` as a login shell in order to be vulnerable to this attack. This problem is patched in versions 2.30.6, 2.31.5, 2.32.4, 2.33.5, 2.34.5, 2.35.5, 2.36.3, and 2.37.4 and users are advised to upgrade to the latest version. Disabling `git shell` access via remote logins is a viable short-term workaround.

