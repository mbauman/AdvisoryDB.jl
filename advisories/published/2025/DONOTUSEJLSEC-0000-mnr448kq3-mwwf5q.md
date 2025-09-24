```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kq3-mwwf5q"
modified = 2025-09-23T03:04:04.587Z
upstream = ["CVE-2025-8176"]
references = ["http://www.libtiff.org/", "https://gitlab.com/libtiff/libtiff/-/commit/fe10872e53efba9cc36c66ac4ab3b41a839d5172", "https://gitlab.com/libtiff/libtiff/-/issues/707", "https://gitlab.com/libtiff/libtiff/-/merge_requests/727", "https://vuldb.com/?ctiid.317590", "https://vuldb.com/?id.317590", "https://vuldb.com/?submit.621796"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2025-8176"
modified = "2025-09-11T16:58:39.627Z"
published = "2025-07-26T04:16:10.527Z"
imported = "2025-09-23T03:04:04.587Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-8176"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-8176"
```

# A vulnerability was found in LibTIFF up to 4.7.0

A vulnerability was found in LibTIFF up to 4.7.0. It has been declared as critical. This vulnerability affects the function get_histogram of the file tools/tiffmedian.c. The manipulation leads to use after free. The attack needs to be approached locally. The exploit has been disclosed to the public and may be used. The patch is identified as fe10872e53efba9cc36c66ac4ab3b41a839d5172. It is recommended to apply a patch to fix this issue.

