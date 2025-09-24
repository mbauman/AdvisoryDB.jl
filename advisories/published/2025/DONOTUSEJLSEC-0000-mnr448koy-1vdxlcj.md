```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448koy-1vdxlcj"
modified = 2025-09-23T03:04:04.546Z
upstream = ["CVE-2022-22844"]
references = ["https://gitlab.com/libtiff/libtiff/-/issues/355", "https://gitlab.com/libtiff/libtiff/-/merge_requests/287", "https://lists.debian.org/debian-lts-announce/2022/03/msg00001.html", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220311-0002/", "https://www.debian.org/security/2022/dsa-5108", "https://gitlab.com/libtiff/libtiff/-/issues/355", "https://gitlab.com/libtiff/libtiff/-/merge_requests/287", "https://lists.debian.org/debian-lts-announce/2022/03/msg00001.html", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220311-0002/", "https://www.debian.org/security/2022/dsa-5108"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.3.0+0, < 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-22844"
modified = "2024-11-21T06:47:33.353Z"
published = "2022-01-10T14:12:58.320Z"
imported = "2025-09-23T03:04:04.546Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-22844"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-22844"
```

# LibTIFF 4.3.0 has an out-of-bounds read in *TIFFmemcpy in tif*unix.c in certain situations involving...

LibTIFF 4.3.0 has an out-of-bounds read in *TIFFmemcpy in tif*unix.c in certain situations involving a custom tag and 0x0200 as the second word of the DE field.

