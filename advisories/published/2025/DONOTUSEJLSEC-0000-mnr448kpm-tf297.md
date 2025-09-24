```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpm-tf297"
modified = 2025-09-23T03:04:04.570Z
upstream = ["CVE-2022-3597"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3597.json", "https://gitlab.com/libtiff/libtiff/-/commit/236b7191f04c60d09ee836ae13b50f812c841047", "https://gitlab.com/libtiff/libtiff/-/issues/413", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3597.json", "https://gitlab.com/libtiff/libtiff/-/commit/236b7191f04c60d09ee836ae13b50f812c841047", "https://gitlab.com/libtiff/libtiff/-/issues/413", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2022-3597"
modified = "2025-05-07T21:15:56.593Z"
published = "2022-10-21T16:15:10.973Z"
imported = "2025-09-23T03:04:04.570Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3597"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3597"
```

# LibTIFF 4.4.0 has an out-of-bounds write in *TIFFmemcpy in libtiff/tif*unix.c:346 when called from e...

LibTIFF 4.4.0 has an out-of-bounds write in *TIFFmemcpy in libtiff/tif*unix.c:346 when called from extractImageSection, tools/tiffcrop.c:6826, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit 236b7191.

