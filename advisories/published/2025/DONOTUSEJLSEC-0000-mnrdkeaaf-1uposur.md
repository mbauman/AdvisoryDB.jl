```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaaf-1uposur"
modified = 2025-09-29T17:46:20.439Z
upstream = ["CVE-2022-3970"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137", "https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://oss-fuzz.com/download?testcase_id=5738253143900160", "https://security.netapp.com/advisory/ntap-20221215-0009/", "https://support.apple.com/kb/HT213841", "https://support.apple.com/kb/HT213843", "https://vuldb.com/?id.213549", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137", "https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://oss-fuzz.com/download?testcase_id=5738253143900160", "https://security.netapp.com/advisory/ntap-20221215-0009/", "https://support.apple.com/kb/HT213841", "https://support.apple.com/kb/HT213843", "https://vuldb.com/?id.213549"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2022-3970"
imported = 2025-09-29T17:46:20.439Z
modified = 2024-11-21T07:20:38.640Z
published = 2022-11-13T08:15:16.047Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3970"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3970"
```

# A vulnerability was found in LibTIFF

A vulnerability was found in LibTIFF. It has been classified as critical. This affects the function TIFFReadRGBATileExt of the file libtiff/tif_getimage.c. The manipulation leads to integer overflow. It is possible to initiate the attack remotely. The exploit has been disclosed to the public and may be used. The name of the patch is 227500897dfb07fb7d27f7aa570050e62617e3be. It is recommended to apply a patch to fix this issue. The identifier VDB-213549 was assigned to this vulnerability.

