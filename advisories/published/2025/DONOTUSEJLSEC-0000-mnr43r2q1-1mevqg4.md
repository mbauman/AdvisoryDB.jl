```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr43r2q1-1mevqg4"
modified = 2025-09-23T02:50:28.105Z
upstream = ["CVE-2023-6879"]
references = ["https://aomedia.googlesource.com/aom/+/refs/tags/v3.7.1", "https://crbug.com/aomedia/3491", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/AYONA2XSNFMXLAW4IHLFI5UVV3QRNG5K/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/D6C2HN4T2S6GYNTAUXLH45LQZHK7QPHP/", "https://aomedia.googlesource.com/aom/+/refs/tags/v3.7.1", "https://crbug.com/aomedia/3491", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/AYONA2XSNFMXLAW4IHLFI5UVV3QRNG5K/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/D6C2HN4T2S6GYNTAUXLH45LQZHK7QPHP/"]

[[affected]]
pkg = "libaom_jll"
ranges = ["< 3.9.0+0"]

[database_specific.source]
id = "CVE-2023-6879"
modified = "2025-02-13T18:16:11.250Z"
published = "2023-12-27T23:15:07.530Z"
imported = "2025-09-23T02:50:28.105Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-6879"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-6879"
```

# Increasing the resolution of video frames, while performing a multi-threaded encode, can result in a...

Increasing the resolution of video frames, while performing a multi-threaded encode, can result in a heap overflow in av1*loop*restoration_dealloc().

