```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpw-25br3r"
modified = 2025-09-23T03:04:04.580Z
upstream = ["CVE-2023-26965"]
references = ["https://gitlab.com/libtiff/libtiff/-/merge_requests/472", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://security.netapp.com/advisory/ntap-20230706-0009/", "https://gitlab.com/libtiff/libtiff/-/merge_requests/472", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://security.netapp.com/advisory/ntap-20230706-0009/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2023-26965"
modified = "2025-01-06T17:15:12.030Z"
published = "2023-06-14T21:15:09.483Z"
imported = "2025-09-23T03:04:04.580Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-26965"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-26965"
```

# loadImage() in tools/tiffcrop.c in LibTIFF through 4.5.0 has a heap-based use after free via a craft...

loadImage() in tools/tiffcrop.c in LibTIFF through 4.5.0 has a heap-based use after free via a crafted TIFF image.

