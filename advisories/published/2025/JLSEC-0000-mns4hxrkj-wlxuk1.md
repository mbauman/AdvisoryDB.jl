```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrkj-wlxuk1"
modified = 2025-10-18T14:07:17.203Z
upstream = ["CVE-2022-3341"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2157054", "https://github.com/FFmpeg/FFmpeg/commit/9cf652cef49d74afe3d454f27d49eb1a1394951e", "https://lists.debian.org/debian-lts-announce/2023/06/msg00016.html", "https://bugzilla.redhat.com/show_bug.cgi?id=2157054", "https://github.com/FFmpeg/FFmpeg/commit/9cf652cef49d74afe3d454f27d49eb1a1394951e", "https://lists.debian.org/debian-lts-announce/2023/06/msg00016.html"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2022-3341"
imported = 2025-10-18T14:07:17.203Z
modified = 2025-08-07T19:26:02.050Z
published = 2023-01-12T15:15:10.007Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3341"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3341"
```

# A null pointer dereference issue was discovered in 'FFmpeg' in decode_main_header() function of liba...

A null pointer dereference issue was discovered in 'FFmpeg' in decode_main_header() function of libavformat/nutdec.c file. The flaw occurs because the function lacks check of the return value of avformat_new_stream() and triggers the null pointer dereference error, causing an application to crash.

