```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448m1u-1xcklmb"
modified = 2025-09-23T03:04:06.306Z
upstream = ["CVE-2025-8177"]
references = ["http://www.libtiff.org/", "https://gitlab.com/libtiff/libtiff/-/commit/e8c9d6c616b19438695fd829e58ae4fde5bfbc22", "https://gitlab.com/libtiff/libtiff/-/issues/715", "https://gitlab.com/libtiff/libtiff/-/merge_requests/737", "https://vuldb.com/?ctiid.317591", "https://vuldb.com/?id.317591", "https://vuldb.com/?submit.621797", "https://gitlab.com/libtiff/libtiff/-/issues/715", "https://vuldb.com/?submit.621797"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2025-8177"
modified = "2025-09-11T16:57:45.093Z"
published = "2025-07-26T04:16:10.983Z"
imported = "2025-09-23T03:04:06.306Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-8177"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-8177"
```

# A vulnerability was found in LibTIFF up to 4.7.0

A vulnerability was found in LibTIFF up to 4.7.0. It has been rated as critical. This issue affects the function setrow of the file tools/thumbnail.c. The manipulation leads to buffer overflow. An attack has to be approached locally. The patch is named e8c9d6c616b19438695fd829e58ae4fde5bfbc22. It is recommended to apply a patch to fix this issue. This vulnerability only affects products that are no longer supported by the maintainer.

