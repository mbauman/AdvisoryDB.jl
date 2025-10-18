```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrgp-1be807n"
modified = 2025-10-18T14:07:17.065Z
upstream = ["CVE-2020-35964"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26622", "https://github.com/FFmpeg/FFmpeg/commit/27a99e2c7d450fef15594671eef4465c8a166bd7", "https://security.gentoo.org/glsa/202105-24", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26622", "https://github.com/FFmpeg/FFmpeg/commit/27a99e2c7d450fef15594671eef4465c8a166bd7", "https://security.gentoo.org/glsa/202105-24"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.3.1+2, < 4.4.0+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 4.4.4+0"]

[[jlsec_sources]]
id = "CVE-2020-35964"
imported = 2025-10-18T14:07:17.065Z
modified = 2024-11-21T05:28:36.243Z
published = 2021-01-03T19:15:11.720Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-35964"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-35964"
```

# track_header in libavformat/vividas.c in FFmpeg 4.3.1 has an out-of-bounds write because of incorrec...

track_header in libavformat/vividas.c in FFmpeg 4.3.1 has an out-of-bounds write because of incorrect extradata packing.

