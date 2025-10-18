```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrli-ehcipf"
modified = 2025-10-18T14:07:17.238Z
upstream = ["CVE-2024-35365"]
references = ["https://gist.github.com/1047524396/d7d4ea8055b75c4a9f9bbcff31d21423", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/fftools/ffmpeg_mux_init.c#L886", "https://github.com/ffmpeg/ffmpeg/commit/ced5c5fdb8634d39ca9472a2026b2d2fea16c4e5"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 6.1.2+0"]

[[jlsec_sources]]
id = "CVE-2024-35365"
imported = 2025-10-18T14:07:17.238Z
modified = 2025-06-03T16:02:31.317Z
published = 2025-01-03T18:15:15.177Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-35365"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-35365"
```

# FFmpeg version n6.1.1 has a double-free vulnerability in the fftools/ffmpeg_mux_init.c component of ...

FFmpeg version n6.1.1 has a double-free vulnerability in the fftools/ffmpeg_mux_init.c component of FFmpeg, specifically within the new_stream_audio function.

