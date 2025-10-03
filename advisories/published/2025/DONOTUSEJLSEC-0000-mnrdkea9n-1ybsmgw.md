```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkea9n-1ybsmgw"
modified = 2025-09-29T17:46:20.411Z
upstream = ["CVE-2019-14973"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-09/msg00102.html", "http://lists.opensuse.org/opensuse-security-announce/2020-11/msg00023.html", "http://packetstormsecurity.com/files/155095/Slackware-Security-Advisory-libtiff-Updates.html", "https://gitlab.com/libtiff/libtiff/merge_requests/90", "https://lists.debian.org/debian-lts-announce/2019/08/msg00031.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/63BVT6N5KQPHWOWM4B3I7Z3ODBXUVNPS/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ADNPG7JJTRRK22GUVTAFH3GJ6WGKUZJB/", "https://seclists.org/bugtraq/2019/Nov/5", "https://seclists.org/bugtraq/2020/Jan/32", "https://www.debian.org/security/2020/dsa-4608", "https://www.debian.org/security/2020/dsa-4670", "http://lists.opensuse.org/opensuse-security-announce/2020-09/msg00102.html", "http://lists.opensuse.org/opensuse-security-announce/2020-11/msg00023.html", "http://packetstormsecurity.com/files/155095/Slackware-Security-Advisory-libtiff-Updates.html", "https://gitlab.com/libtiff/libtiff/merge_requests/90", "https://lists.debian.org/debian-lts-announce/2019/08/msg00031.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/63BVT6N5KQPHWOWM4B3I7Z3ODBXUVNPS/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ADNPG7JJTRRK22GUVTAFH3GJ6WGKUZJB/", "https://seclists.org/bugtraq/2019/Nov/5", "https://seclists.org/bugtraq/2020/Jan/32", "https://www.debian.org/security/2020/dsa-4608", "https://www.debian.org/security/2020/dsa-4670"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.1.0+0"]

[[jlsec_sources]]
id = "CVE-2019-14973"
imported = 2025-09-29T17:46:20.411Z
modified = 2024-11-21T04:27:48.033Z
published = 2019-08-14T06:15:10.303Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-14973"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-14973"
```

# _TIFFCheckMalloc and _TIFFCheckRealloc in tif_aux.c in LibTIFF through 4.0.10 mishandle Integer Over...

_TIFFCheckMalloc and _TIFFCheckRealloc in tif_aux.c in LibTIFF through 4.0.10 mishandle Integer Overflow checks because they rely on compiler behavior that is undefined by the applicable C standards. This can, for example, lead to an application crash.

