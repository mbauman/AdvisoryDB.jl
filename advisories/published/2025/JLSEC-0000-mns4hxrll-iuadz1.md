```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrll-iuadz1"
modified = 2025-10-18T14:07:17.241Z
upstream = ["CVE-2023-6604"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2334337"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-6604"
imported = 2025-10-18T14:07:17.241Z
modified = 2025-08-05T18:05:55.853Z
published = 2025-01-06T17:15:14.413Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-6604"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-6604"
```

# A flaw was found in FFmpeg

A flaw was found in FFmpeg. This vulnerability allows unexpected additional CPU load and storage consumption, potentially leading to degraded performance or denial of service via the demuxing of arbitrary data as XBIN-formatted data without proper format validation.

