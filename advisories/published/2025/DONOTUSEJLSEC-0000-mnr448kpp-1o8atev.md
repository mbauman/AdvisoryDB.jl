```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpp-1o8atev"
modified = 2025-09-23T03:04:04.573Z
upstream = ["CVE-2022-48281"]
references = ["https://gitlab.com/libtiff/libtiff/-/commit/d1b6b9c1b3cae2d9e37754506c1ad8f4f7b646b5", "https://gitlab.com/libtiff/libtiff/-/issues/488", "https://lists.debian.org/debian-lts-announce/2023/01/msg00037.html", "https://security.gentoo.org/glsa/202305-31", "https://security.netapp.com/advisory/ntap-20230302-0004/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/libtiff/libtiff/-/commit/d1b6b9c1b3cae2d9e37754506c1ad8f4f7b646b5", "https://gitlab.com/libtiff/libtiff/-/issues/488", "https://lists.debian.org/debian-lts-announce/2023/01/msg00037.html", "https://security.gentoo.org/glsa/202305-31", "https://security.netapp.com/advisory/ntap-20230302-0004/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2022-48281"
modified = "2025-04-03T14:15:23.037Z"
published = "2023-01-23T03:15:09.447Z"
imported = "2025-09-23T03:04:04.573Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-48281"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-48281"
```

# processCropSelections in tools/tiffcrop.c in LibTIFF through 4.5.0 has a heap-based buffer overflow ...

processCropSelections in tools/tiffcrop.c in LibTIFF through 4.5.0 has a heap-based buffer overflow (e.g., "WRITE of size 307203") via a crafted TIFF image.

