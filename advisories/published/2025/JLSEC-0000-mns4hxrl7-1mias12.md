```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrl7-1mias12"
modified = 2025-10-18T14:07:17.227Z
upstream = ["CVE-2024-36619"]
references = ["https://gist.github.com/1047524396/fad68e8251f4e34a1bb838de697d5119", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavcodec/wavarc.c#L651", "https://github.com/ffmpeg/ffmpeg/commit/28c7094b25b689185155a6833caf2747b94774a4"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 6.1.2+0"]

[[jlsec_sources]]
id = "CVE-2024-36619"
imported = 2025-10-18T14:07:17.227Z
modified = 2025-06-03T16:06:04.510Z
published = 2024-11-29T17:15:07.813Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-36619"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-36619"
```

# FFmpeg n6.1.1 has a vulnerability in the WAVARC decoder of the libavcodec library which allows for a...

FFmpeg n6.1.1 has a vulnerability in the WAVARC decoder of the libavcodec library which allows for an integer overflow when handling certain block types, leading to a denial-of-service (DoS) condition.

