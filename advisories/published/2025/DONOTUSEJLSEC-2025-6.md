```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-6"
modified = 2025-09-26T17:16:58.363Z
published = 2025-09-23T14:07:03.373Z
upstream = ["CVE-2019-1353"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00056.html", "http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00003.html", "https://lore.kernel.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/T/#u", "https://public-inbox.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/", "https://security.gentoo.org/glsa/202003-30", "http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00056.html", "http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00003.html", "https://lore.kernel.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/T/#u", "https://public-inbox.org/git/xmqqr21cqcn9.fsf%40gitster-ct.c.googlers.com/", "https://security.gentoo.org/glsa/202003-30"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.26.1+0"]

[[jlsec_sources]]
id = "CVE-2019-1353"
imported = 2025-09-23T02:52:12.911Z
modified = 2024-11-21T04:36:32.663Z
published = 2020-01-24T22:15:19.253Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-1353"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-1353"
```

# Git on WSL did not have NTFS protections

An issue was found in Git before v2.24.1, v2.23.1, v2.22.2, v2.21.1, v2.20.2, v2.19.3, v2.18.2, v2.17.3, v2.16.6, v2.15.4, and v2.14.6. When running Git in the Windows Subsystem for Linux (also known as "WSL") while accessing a working directory on a regular Windows drive, none of the NTFS protections were active.

