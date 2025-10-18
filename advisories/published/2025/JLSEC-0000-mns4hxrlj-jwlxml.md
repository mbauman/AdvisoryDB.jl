```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlj-jwlxml"
modified = 2025-10-18T14:07:17.239Z
upstream = ["CVE-2024-36613"]
references = ["https://gist.github.com/1047524396/0f4d90ef87553f772f888223085ac806", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavformat/dxa.c#L125", "https://github.com/ffmpeg/ffmpeg/commit/50d8e4f27398fd5778485a827d7a2817921f8540"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 6.1.2+0"]

[[jlsec_sources]]
id = "CVE-2024-36613"
imported = 2025-10-18T14:07:17.239Z
modified = 2025-06-03T16:02:11.443Z
published = 2025-01-03T18:15:15.343Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-36613"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-36613"
```

# FFmpeg n6.1.1 has a vulnerability in the DXA demuxer of the libavformat library allowing for an inte...

FFmpeg n6.1.1 has a vulnerability in the DXA demuxer of the libavformat library allowing for an integer overflow, potentially resulting in a denial-of-service (DoS) condition or other undefined behavior.

