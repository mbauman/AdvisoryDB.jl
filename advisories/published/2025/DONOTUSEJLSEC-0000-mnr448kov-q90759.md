```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kov-q90759"
modified = 2025-09-23T03:04:04.543Z
upstream = ["CVE-2019-17546"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=16443", "https://github.com/OSGeo/gdal/commit/21674033ee246f698887604c7af7ba1962a40ddf", "https://gitlab.com/libtiff/libtiff/commit/4bb584a35f87af42d6cf09d15e9ce8909a839145", "https://lists.debian.org/debian-lts-announce/2019/11/msg00027.html", "https://lists.debian.org/debian-lts-announce/2020/03/msg00020.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LM5ZW7E3IEW7LT2BPJP7D3RN6OUOE3MX/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/M3S4WNIMZ7XSLY2LD5FPRPZMGNUBVKOG/", "https://seclists.org/bugtraq/2020/Jan/32", "https://security.gentoo.org/glsa/202003-25", "https://www.debian.org/security/2020/dsa-4608", "https://www.debian.org/security/2020/dsa-4670", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=16443", "https://github.com/OSGeo/gdal/commit/21674033ee246f698887604c7af7ba1962a40ddf", "https://gitlab.com/libtiff/libtiff/commit/4bb584a35f87af42d6cf09d15e9ce8909a839145", "https://lists.debian.org/debian-lts-announce/2019/11/msg00027.html", "https://lists.debian.org/debian-lts-announce/2020/03/msg00020.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LM5ZW7E3IEW7LT2BPJP7D3RN6OUOE3MX/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/M3S4WNIMZ7XSLY2LD5FPRPZMGNUBVKOG/", "https://seclists.org/bugtraq/2020/Jan/32", "https://security.gentoo.org/glsa/202003-25", "https://security.netapp.com/advisory/ntap-20241220-0007/", "https://www.debian.org/security/2020/dsa-4608", "https://www.debian.org/security/2020/dsa-4670"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.1.0+0"]

[database_specific.source]
id = "CVE-2019-17546"
modified = "2024-12-20T13:15:16.870Z"
published = "2019-10-14T02:15:11.107Z"
imported = "2025-09-23T03:04:04.543Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-17546"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-17546"
```

# tif_getimage.c in LibTIFF through 4.0.10, as used in GDAL through 3.0.1 and other products, has an i...

tif_getimage.c in LibTIFF through 4.0.10, as used in GDAL through 3.0.1 and other products, has an integer overflow that potentially causes a heap-based buffer overflow via a crafted RGBA image, related to a "Negative-size-param" condition.

