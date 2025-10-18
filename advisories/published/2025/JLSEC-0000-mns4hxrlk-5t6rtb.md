```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlk-5t6rtb"
modified = 2025-10-18T14:07:17.240Z
upstream = ["CVE-2023-6601"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2253172"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-6601"
imported = 2025-10-18T14:07:17.240Z
modified = 2025-08-05T18:04:59.290Z
published = 2025-01-06T17:15:14.217Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-6601"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-6601"
```

# A flaw was found in FFmpeg's HLS demuxer

A flaw was found in FFmpeg's HLS demuxer. This vulnerability allows bypassing unsafe file extension checks and triggering arbitrary demuxers via base64-encoded data URIs appended with specific file extensions.

