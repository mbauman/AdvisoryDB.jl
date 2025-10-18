```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlb-205bg8"
modified = 2025-10-18T14:07:17.231Z
upstream = ["CVE-2024-36618"]
references = ["https://gist.github.com/1047524396/a148f3679415a6da53ca112eb2ba1523", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavformat/avidec.c#L1699", "https://github.com/ffmpeg/ffmpeg/commit/7a089ed8e049e3bfcb22de1250b86f2106060857"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 6.1.2+0"]

[[jlsec_sources]]
id = "CVE-2024-36618"
imported = 2025-10-18T14:07:17.231Z
modified = 2025-06-03T16:05:40.027Z
published = 2024-11-29T18:15:07.390Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-36618"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-36618"
```

# FFmpeg n6.1.1 has a vulnerability in the AVI demuxer of the libavformat library which allows for an ...

FFmpeg n6.1.1 has a vulnerability in the AVI demuxer of the libavformat library which allows for an integer overflow, potentially resulting in a denial-of-service (DoS) condition.

