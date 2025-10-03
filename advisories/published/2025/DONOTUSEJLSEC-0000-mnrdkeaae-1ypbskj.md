```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaae-1ypbskj"
modified = 2025-09-29T17:46:20.438Z
upstream = ["CVE-2022-3627"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3627.json", "https://gitlab.com/libtiff/libtiff/-/commit/236b7191f04c60d09ee836ae13b50f812c841047", "https://gitlab.com/libtiff/libtiff/-/issues/411", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3627.json", "https://gitlab.com/libtiff/libtiff/-/commit/236b7191f04c60d09ee836ae13b50f812c841047", "https://gitlab.com/libtiff/libtiff/-/issues/411", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2022-3627"
imported = 2025-09-29T17:46:20.438Z
modified = 2025-05-07T15:15:54.603Z
published = 2022-10-21T16:15:11.197Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3627"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3627"
```

# LibTIFF 4.4.0 has an out-of-bounds write in _TIFFmemcpy in libtiff/tif_unix.c:346 when called from e...

LibTIFF 4.4.0 has an out-of-bounds write in _TIFFmemcpy in libtiff/tif_unix.c:346 when called from extractImageSection, tools/tiffcrop.c:6860, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit 236b7191.

