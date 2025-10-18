```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrkl-mm4k2o"
modified = 2025-10-18T14:07:17.205Z
upstream = ["CVE-2020-36138"]
references = ["https://github.com/FFmpeg/FFmpeg/commit/292e41ce650a7b5ca5de4ae87fff0d6a90d9fc97", "https://lists.ffmpeg.org/pipermail/ffmpeg-devel/2020-November/272001.html", "https://trac.ffmpeg.org/ticket/8960", "https://github.com/FFmpeg/FFmpeg/commit/292e41ce650a7b5ca5de4ae87fff0d6a90d9fc97", "https://lists.ffmpeg.org/pipermail/ffmpeg-devel/2020-November/272001.html", "https://trac.ffmpeg.org/ticket/8960"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.3.1+0, < 4.3.1+2"]

[[jlsec_sources]]
id = "CVE-2020-36138"
imported = 2025-10-18T14:07:17.205Z
modified = 2024-11-21T05:28:47.703Z
published = 2023-08-11T14:15:11.910Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36138"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36138"
```

# An issue was discovered in decode_frame in libavcodec/tiff.c in FFmpeg version 4.3, allows remote at...

An issue was discovered in decode_frame in libavcodec/tiff.c in FFmpeg version 4.3, allows remote attackers to cause a denial of service (DoS).

