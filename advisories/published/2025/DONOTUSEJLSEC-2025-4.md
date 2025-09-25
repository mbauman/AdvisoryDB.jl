```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-4"
modified = 2025-09-25T17:06:05.000Z
published = 2025-09-23T14:07:03.367Z
upstream = ["CVE-2019-1387"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00056.html", "http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00003.html", "https://access.redhat.com/errata/RHSA-2019:4356", "https://access.redhat.com/errata/RHSA-2020:0002", "https://access.redhat.com/errata/RHSA-2020:0124", "https://access.redhat.com/errata/RHSA-2020:0228", "https://lists.debian.org/debian-lts-announce/2020/01/msg00019.html", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/N6UGTEOXWIYSM5KDZL74QD2GK6YQNQCP/", "https://lore.kernel.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/T/#u", "https://public-inbox.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/", "https://security.gentoo.org/glsa/202003-30", "https://security.gentoo.org/glsa/202003-42", "http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00056.html", "http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00003.html", "https://access.redhat.com/errata/RHSA-2019:4356", "https://access.redhat.com/errata/RHSA-2020:0002", "https://access.redhat.com/errata/RHSA-2020:0124", "https://access.redhat.com/errata/RHSA-2020:0228", "https://lists.debian.org/debian-lts-announce/2020/01/msg00019.html", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/N6UGTEOXWIYSM5KDZL74QD2GK6YQNQCP/", "https://lore.kernel.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/T/#u", "https://public-inbox.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/", "https://security.gentoo.org/glsa/202003-30", "https://security.gentoo.org/glsa/202003-42"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.26.1+0"]

[[jlsec_sources]]
id = "CVE-2019-1387"
imported = 2025-09-23T02:52:12.906Z
modified = 2024-11-21T04:36:36.370Z
published = 2019-12-18T21:15:13.820Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-1387"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-1387"
```

# Git recursive clones could allow remote code execution

An issue was found in Git before v2.24.1, v2.23.1, v2.22.2, v2.21.1, v2.20.2, v2.19.3, v2.18.2, v2.17.3, v2.16.6, v2.15.4, and v2.14.6. Recursive clones are currently affected by a vulnerability that is caused by too-lax validation of submodule names, allowing very targeted attacks via remote code execution in recursive clones.

