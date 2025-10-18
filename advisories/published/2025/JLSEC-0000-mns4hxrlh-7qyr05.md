```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlh-7qyr05"
modified = 2025-10-18T14:07:17.237Z
upstream = ["CVE-2023-6603"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2334335", "https://bugzilla.redhat.com/show_bug.cgi?id=2334335"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-6603"
imported = 2025-10-18T14:07:17.237Z
modified = 2025-08-21T16:15:30.363Z
published = 2024-12-31T15:15:07.490Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-6603"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-6603"
```

# A flaw was found in FFmpeg's HLS playlist parsing

A flaw was found in FFmpeg's HLS playlist parsing. This vulnerability allows a denial of service via a maliciously crafted HLS playlist that triggers a null pointer dereference during initialization.

