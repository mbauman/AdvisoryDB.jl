```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kov-103qnyr"
modified = 2025-09-23T03:04:04.543Z
upstream = ["CVE-2019-14973"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-09/msg00102.html", "http://lists.opensuse.org/opensuse-security-announce/2020-11/msg00023.html", "http://packetstormsecurity.com/files/155095/Slackware-Security-Advisory-libtiff-Updates.html", "https://gitlab.com/libtiff/libtiff/merge_requests/90", "https://lists.debian.org/debian-lts-announce/2019/08/msg00031.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/63BVT6N5KQPHWOWM4B3I7Z3ODBXUVNPS/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ADNPG7JJTRRK22GUVTAFH3GJ6WGKUZJB/", "https://seclists.org/bugtraq/2019/Nov/5", "https://seclists.org/bugtraq/2020/Jan/32", "https://www.debian.org/security/2020/dsa-4608", "https://www.debian.org/security/2020/dsa-4670", "http://lists.opensuse.org/opensuse-security-announce/2020-09/msg00102.html", "http://lists.opensuse.org/opensuse-security-announce/2020-11/msg00023.html", "http://packetstormsecurity.com/files/155095/Slackware-Security-Advisory-libtiff-Updates.html", "https://gitlab.com/libtiff/libtiff/merge_requests/90", "https://lists.debian.org/debian-lts-announce/2019/08/msg00031.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/63BVT6N5KQPHWOWM4B3I7Z3ODBXUVNPS/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ADNPG7JJTRRK22GUVTAFH3GJ6WGKUZJB/", "https://seclists.org/bugtraq/2019/Nov/5", "https://seclists.org/bugtraq/2020/Jan/32", "https://www.debian.org/security/2020/dsa-4608", "https://www.debian.org/security/2020/dsa-4670"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.1.0+0"]

[database_specific.source]
id = "CVE-2019-14973"
modified = "2024-11-21T04:27:48.033Z"
published = "2019-08-14T06:15:10.303Z"
imported = "2025-09-23T03:04:04.543Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-14973"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-14973"
```

# *TIFFCheckMalloc and _TIFFCheckRealloc in tif*aux.c in LibTIFF through 4.0.10 mishandle Integer Over...

*TIFFCheckMalloc and _TIFFCheckRealloc in tif*aux.c in LibTIFF through 4.0.10 mishandle Integer Overflow checks because they rely on compiler behavior that is undefined by the applicable C standards. This can, for example, lead to an application crash.

