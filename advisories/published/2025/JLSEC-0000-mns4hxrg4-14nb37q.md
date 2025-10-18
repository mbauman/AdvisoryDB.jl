```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrg4-14nb37q"
modified = 2025-10-18T14:07:17.044Z
upstream = ["CVE-2019-9721"]
references = ["http://www.securityfocus.com/bid/107384", "https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/894995c41e0795c7a44f81adc4838dedc3932e65", "https://github.com/FFmpeg/FFmpeg/commit/273f2755ce8635d42da3cde0eeba15b2e7842774", "https://usn.ubuntu.com/3967-1/", "http://www.securityfocus.com/bid/107384", "https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/894995c41e0795c7a44f81adc4838dedc3932e65", "https://github.com/FFmpeg/FFmpeg/commit/273f2755ce8635d42da3cde0eeba15b2e7842774", "https://usn.ubuntu.com/3967-1/"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2019-9721"
imported = 2025-10-18T14:07:17.044Z
modified = 2024-11-21T04:52:10.573Z
published = 2019-03-12T09:29:00.577Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-9721"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-9721"
```

# A denial of service in the subtitle decoder in FFmpeg 3.2 and 4.1 allows attackers to hog the CPU vi...

A denial of service in the subtitle decoder in FFmpeg 3.2 and 4.1 allows attackers to hog the CPU via a crafted video file in Matroska format, because handle_open_brace in libavcodec/htmlsubtitles.c has a complex format argument to sscanf.

