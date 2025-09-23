```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpu-gppzn0"
modified = 2025-09-23T03:04:04.578Z
upstream = ["CVE-2023-2731"]
references = ["https://access.redhat.com/security/cve/CVE-2023-2731", "https://bugzilla.redhat.com/show_bug.cgi?id=2207635", "https://github.com/libsdl-org/libtiff/commit/9be22b639ea69e102d3847dca4c53ef025e9527b", "https://gitlab.com/libtiff/libtiff/-/issues/548", "https://security.netapp.com/advisory/ntap-20230703-0009/", "https://access.redhat.com/security/cve/CVE-2023-2731", "https://bugzilla.redhat.com/show_bug.cgi?id=2207635", "https://github.com/libsdl-org/libtiff/commit/9be22b639ea69e102d3847dca4c53ef025e9527b", "https://gitlab.com/libtiff/libtiff/-/issues/548", "https://security.netapp.com/advisory/ntap-20230703-0009/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2023-2731"
modified = "2025-01-22T19:15:09.643Z"
published = "2023-05-17T22:15:11.047Z"
imported = "2025-09-23T03:04:04.578Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-2731"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-2731"
```

# A NULL pointer dereference flaw was found in Libtiff's LZWDecode() function in the libtiff/tif_lzw.c...

A NULL pointer dereference flaw was found in Libtiff's LZWDecode() function in the libtiff/tif_lzw.c file. This flaw allows a local attacker to craft specific input data that can cause the program to dereference a NULL pointer when decompressing a TIFF format file, resulting in a program crash or denial of service.

