```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrl7-41kohz"
modified = 2025-10-18T14:07:17.227Z
upstream = ["CVE-2024-35369"]
references = ["https://gist.github.com/1047524396/455093807666f2e351d674750c8cd0b8", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavcodec/speexdec.c#L1423", "https://github.com/ffmpeg/ffmpeg/commit/0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 6.1.2+0"]

[[jlsec_sources]]
id = "CVE-2024-35369"
imported = 2025-10-18T14:07:17.227Z
modified = 2025-06-03T16:06:20.667Z
published = 2024-11-29T17:15:07.707Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-35369"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-35369"
```

# In FFmpeg version n6.1.1, specifically within the avcodec/speexdec.c module, a potential security vu...

In FFmpeg version n6.1.1, specifically within the avcodec/speexdec.c module, a potential security vulnerability exists due to insufficient validation of certain parameters when parsing Speex codec extradata. This vulnerability could lead to integer overflow conditions, potentially resulting in undefined behavior or crashes during the decoding process.

