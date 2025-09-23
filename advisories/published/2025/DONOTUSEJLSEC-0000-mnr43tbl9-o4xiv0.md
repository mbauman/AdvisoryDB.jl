```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr43tbl9-o4xiv0"
modified = 2025-09-23T02:52:12.909Z
upstream = ["CVE-2019-1348"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00056.html", "http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00003.html", "https://access.redhat.com/errata/RHSA-2020:0228", "https://lore.kernel.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/T/#u", "https://public-inbox.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/", "https://security.gentoo.org/glsa/202003-30", "https://security.gentoo.org/glsa/202003-42", "https://support.apple.com/kb/HT210729", "http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00056.html", "http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00003.html", "https://access.redhat.com/errata/RHSA-2020:0228", "https://lore.kernel.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/T/#u", "https://public-inbox.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/", "https://security.gentoo.org/glsa/202003-30", "https://security.gentoo.org/glsa/202003-42", "https://support.apple.com/kb/HT210729"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.26.1+0"]

[database_specific.source]
id = "CVE-2019-1348"
modified = "2024-11-21T04:36:31.990Z"
published = "2020-01-24T22:15:19.190Z"
imported = "2025-09-23T02:52:12.909Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-1348"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-1348"
```

# Git fast-import could allow overwriting arbitrary paths

An issue was found in Git before v2.24.1, v2.23.1, v2.22.2, v2.21.1, v2.20.2, v2.19.3, v2.18.2, v2.17.3, v2.16.6, v2.15.4, and v2.14.6. The –export-marks option of git fast-import is exposed also via the in-stream command feature export-marks=... and it allows overwriting arbitrary paths.

