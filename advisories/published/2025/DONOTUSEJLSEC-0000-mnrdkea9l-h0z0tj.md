```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkea9l-h0z0tj"
modified = 2025-09-29T17:46:20.409Z
upstream = ["CVE-2019-6128"]
references = ["http://bugzilla.maptools.org/show_bug.cgi?id=2836", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00041.html", "http://packetstormsecurity.com/files/155095/Slackware-Security-Advisory-libtiff-Updates.html", "https://gitlab.com/libtiff/libtiff/commit/0c74a9f49b8d7a36b17b54a7428b3526d20f88a8", "https://lists.debian.org/debian-lts-announce/2019/11/msg00027.html", "https://seclists.org/bugtraq/2019/Nov/5", "https://security.gentoo.org/glsa/202003-25", "https://usn.ubuntu.com/3906-1/", "https://usn.ubuntu.com/3906-2/", "http://bugzilla.maptools.org/show_bug.cgi?id=2836", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00041.html", "http://packetstormsecurity.com/files/155095/Slackware-Security-Advisory-libtiff-Updates.html", "https://gitlab.com/libtiff/libtiff/commit/0c74a9f49b8d7a36b17b54a7428b3526d20f88a8", "https://lists.debian.org/debian-lts-announce/2019/11/msg00027.html", "https://seclists.org/bugtraq/2019/Nov/5", "https://security.gentoo.org/glsa/202003-25", "https://usn.ubuntu.com/3906-1/", "https://usn.ubuntu.com/3906-2/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.1.0+0"]

[[jlsec_sources]]
id = "CVE-2019-6128"
imported = 2025-09-29T17:46:20.409Z
modified = 2024-11-21T04:45:59.583Z
published = 2019-01-11T05:29:01.577Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-6128"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-6128"
```

# The TIFFFdOpen function in tif_unix.c in LibTIFF 4.0.10 has a memory leak, as demonstrated by pal2rg...

The TIFFFdOpen function in tif_unix.c in LibTIFF 4.0.10 has a memory leak, as demonstrated by pal2rgb.

