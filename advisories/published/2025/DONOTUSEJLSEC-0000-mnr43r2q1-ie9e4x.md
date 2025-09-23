```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr43r2q1-ie9e4x"
modified = 2025-09-23T02:50:28.105Z
upstream = ["CVE-2023-39616"]
references = ["https://bugs.chromium.org/p/aomedia/issues/detail?id=3372#c3", "https://bugs.chromium.org/p/aomedia/issues/detail?id=3372#c3"]

[[affected]]
pkg = "libaom_jll"
ranges = ["< 3.9.0+0"]

[database_specific.source]
id = "CVE-2023-39616"
modified = "2024-11-21T08:15:42.747Z"
published = "2023-08-29T17:15:12.633Z"
imported = "2025-09-23T02:50:28.105Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-39616"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-39616"
```

# AOMedia v3.0.0 to v3.5.0 was discovered to contain an invalid read memory access via the component a...

AOMedia v3.0.0 to v3.5.0 was discovered to contain an invalid read memory access via the component assign*frame*buffer*p in av1/common/av1*common_int.h.

