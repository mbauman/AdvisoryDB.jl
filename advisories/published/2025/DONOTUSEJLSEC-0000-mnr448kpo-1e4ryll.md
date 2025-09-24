```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpo-1e4ryll"
modified = 2025-09-23T03:04:04.572Z
upstream = ["CVE-2022-3626"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3626.json", "https://gitlab.com/libtiff/libtiff/-/commit/236b7191f04c60d09ee836ae13b50f812c841047", "https://gitlab.com/libtiff/libtiff/-/issues/426", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3626.json", "https://gitlab.com/libtiff/libtiff/-/commit/236b7191f04c60d09ee836ae13b50f812c841047", "https://gitlab.com/libtiff/libtiff/-/issues/426", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2022-3626"
modified = "2025-05-07T16:15:20.460Z"
published = "2022-10-21T16:15:11.140Z"
imported = "2025-09-23T03:04:04.572Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3626"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3626"
```

# LibTIFF 4.4.0 has an out-of-bounds write in *TIFFmemset in libtiff/tif*unix.c:340 when called from p...

LibTIFF 4.4.0 has an out-of-bounds write in *TIFFmemset in libtiff/tif*unix.c:340 when called from processCropSelections, tools/tiffcrop.c:7619, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit 236b7191.

