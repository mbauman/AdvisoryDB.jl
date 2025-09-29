```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaak-1cwb1w4"
modified = 2025-09-29T17:46:20.444Z
upstream = ["CVE-2023-1916"]
references = ["https://gitlab.com/libtiff/libtiff/-/issues/536%2C", "https://gitlab.com/libtiff/libtiff/-/issues/537", "https://support.apple.com/kb/HT213844", "https://gitlab.com/libtiff/libtiff/-/issues/536", "https://gitlab.com/libtiff/libtiff/-/issues/536%2C", "https://gitlab.com/libtiff/libtiff/-/issues/537", "https://support.apple.com/kb/HT213844"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2023-1916"
imported = 2025-09-29T17:46:20.444Z
modified = 2024-11-21T07:40:08.090Z
published = 2023-04-10T22:15:09.223Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-1916"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-1916"
```

# A flaw was found in tiffcrop, a program distributed by the libtiff package

A flaw was found in tiffcrop, a program distributed by the libtiff package. A specially crafted tiff file can lead to an out-of-bounds read in the extractImageSection function in tools/tiffcrop.c, resulting in a denial of service and limited information disclosure. This issue affects libtiff versions 4.x.

