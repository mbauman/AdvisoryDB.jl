```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlb-mkt8ve"
modified = 2025-10-18T14:07:17.231Z
upstream = ["CVE-2024-36617"]
references = ["https://gist.github.com/1047524396/f20749f8addc8f86de9cfacf17ba29df", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavformat/cafdec.c#L274", "https://github.com/ffmpeg/ffmpeg/commit/d973fcbcc2f944752ff10e6a76b0b2d9329937a7"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.2+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2024-36617"
imported = 2025-10-18T14:07:17.231Z
modified = 2025-06-03T18:06:03.973Z
published = 2024-11-29T18:15:07.230Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-36617"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-36617"
```

# FFmpeg n6.1.1 has an integer overflow vulnerability in the FFmpeg CAF decoder.

FFmpeg n6.1.1 has an integer overflow vulnerability in the FFmpeg CAF decoder.

