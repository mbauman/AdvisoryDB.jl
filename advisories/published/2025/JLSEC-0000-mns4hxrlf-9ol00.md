```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlf-9ol00"
modified = 2025-10-18T14:07:17.235Z
upstream = ["CVE-2024-35367"]
references = ["https://gist.github.com/1047524396/9754a44845578358f6a403447c458ca4", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavcodec/ppc/vp8dsp_altivec.c#L53", "https://github.com/ffmpeg/ffmpeg/commit/09e6840cf7a3ee07a73c3ae88a020bf27ca1a667"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 6.1.2+0"]

[[jlsec_sources]]
id = "CVE-2024-35367"
imported = 2025-10-18T14:07:17.235Z
modified = 2025-06-03T16:03:14.833Z
published = 2024-11-29T20:15:19.957Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-35367"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-35367"
```

# FFmpeg n6.1.1 has an Out-of-bounds Read via libavcodec/ppc/vp8dsp_altivec.c, static const vec_s8 h_s...

FFmpeg n6.1.1 has an Out-of-bounds Read via libavcodec/ppc/vp8dsp_altivec.c, static const vec_s8 h_subpel_filters_outer

