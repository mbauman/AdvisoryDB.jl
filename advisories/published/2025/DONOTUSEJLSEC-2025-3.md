```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-3"
modified = 2025-10-06T13:10:23.999Z
published = 2025-09-23T14:07:03.364Z
upstream = ["CVE-2019-19604"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00056.html", "http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00003.html", "http://www.openwall.com/lists/oss-security/2019/12/13/1", "https://gitlab.com/gitlab-com/gl-security/disclosures/blob/master/003_git_submodule/advisory.md", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/HCYSSCA5ZTEP46SB4XRPSQGFV2L3NKMZ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/N6UGTEOXWIYSM5KDZL74QD2GK6YQNQCP/", "https://public-inbox.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/", "https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.24.1.txt", "https://security.gentoo.org/glsa/202003-30", "https://www.debian.org/security/2019/dsa-4581", "http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00056.html", "http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00003.html", "http://www.openwall.com/lists/oss-security/2019/12/13/1", "https://gitlab.com/gitlab-com/gl-security/disclosures/blob/master/003_git_submodule/advisory.md", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/HCYSSCA5ZTEP46SB4XRPSQGFV2L3NKMZ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/N6UGTEOXWIYSM5KDZL74QD2GK6YQNQCP/", "https://public-inbox.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/", "https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.24.1.txt", "https://security.gentoo.org/glsa/202003-30", "https://www.debian.org/security/2019/dsa-4581"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.26.1+0"]

[[jlsec_sources]]
id = "CVE-2019-19604"
imported = 2025-09-23T02:52:12.904Z
modified = 2024-11-21T04:35:02.160Z
published = 2019-12-11T00:15:13.260Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-19604"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-19604"
```

# Arbitrary command execution is possible in Git before 2.20.2, 2.21.x before 2.21.1, 2.22.x before 2....

Arbitrary command execution is possible in Git before 2.20.2, 2.21.x before 2.21.1, 2.22.x before 2.22.2, 2.23.x before 2.23.1, and 2.24.x before 2.24.1 because a "git submodule update" operation can run commands found in the .gitmodules file of a malicious repository.

