```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkea9m-n72lzo"
modified = 2025-09-29T17:46:20.410Z
upstream = ["CVE-2019-7663"]
references = ["http://bugzilla.maptools.org/show_bug.cgi?id=2833", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00041.html", "https://gitlab.com/libtiff/libtiff/commit/802d3cbf3043be5dce5317e140ccb1c17a6a2d39", "https://lists.debian.org/debian-lts-announce/2019/02/msg00026.html", "https://security.gentoo.org/glsa/202003-25", "https://usn.ubuntu.com/3906-1/", "https://usn.ubuntu.com/3906-2/", "https://www.debian.org/security/2020/dsa-4670", "http://bugzilla.maptools.org/show_bug.cgi?id=2833", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00041.html", "https://gitlab.com/libtiff/libtiff/commit/802d3cbf3043be5dce5317e140ccb1c17a6a2d39", "https://lists.debian.org/debian-lts-announce/2019/02/msg00026.html", "https://security.gentoo.org/glsa/202003-25", "https://usn.ubuntu.com/3906-1/", "https://usn.ubuntu.com/3906-2/", "https://www.debian.org/security/2020/dsa-4670"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.1.0+0"]

[[jlsec_sources]]
id = "CVE-2019-7663"
imported = 2025-09-29T17:46:20.410Z
modified = 2024-11-21T04:48:29.273Z
published = 2019-02-09T16:29:00.313Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-7663"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-7663"
```

# An Invalid Address dereference was discovered in TIFFWriteDirectoryTagTransferfunction in libtiff/ti...

An Invalid Address dereference was discovered in TIFFWriteDirectoryTagTransferfunction in libtiff/tif_dirwrite.c in LibTIFF 4.0.10, affecting the cpSeparateBufToContigBuf function in tiffcp.c. Remote attackers could leverage this vulnerability to cause a denial-of-service via a crafted tiff file. This is different from CVE-2018-12900.

