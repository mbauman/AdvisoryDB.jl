```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlg-1b4pmf3"
modified = 2025-10-18T14:07:17.236Z
upstream = ["CVE-2023-6602"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2334338", "https://bugzilla.redhat.com/show_bug.cgi?id=2334338"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-6602"
imported = 2025-10-18T14:07:17.236Z
modified = 2025-06-20T18:46:29.987Z
published = 2024-12-31T15:15:06.240Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-6602"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-6602"
```

# A flaw was found in FFmpeg's TTY Demuxer

A flaw was found in FFmpeg's TTY Demuxer. This vulnerability allows possible data exfiltration via improper parsing of non-TTY-compliant input files in HLS playlists.

