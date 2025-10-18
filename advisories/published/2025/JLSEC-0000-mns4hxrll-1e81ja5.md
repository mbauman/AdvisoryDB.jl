```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrll-1e81ja5"
modified = 2025-10-18T14:07:17.241Z
upstream = ["CVE-2023-6605"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2334336"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-6605"
imported = 2025-10-18T14:07:17.241Z
modified = 2025-08-05T16:58:45.920Z
published = 2025-01-06T17:15:14.613Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-6605"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-6605"
```

# A flaw was found in FFmpeg's DASH playlist support

A flaw was found in FFmpeg's DASH playlist support. This vulnerability allows arbitrary HTTP GET requests to be made on behalf of the machine running FFmpeg via a crafted DASH playlist containing malicious URLs.

