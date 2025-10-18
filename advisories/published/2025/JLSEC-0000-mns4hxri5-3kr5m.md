```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxri5-3kr5m"
modified = 2025-10-18T14:07:17.117Z
upstream = ["CVE-2021-33815"]
references = ["https://github.com/FFmpeg/FFmpeg/commit/26d3c81bc5ef2f8c3f09d45eaeacfb4b1139a777", "https://security.gentoo.org/glsa/202312-14", "https://github.com/FFmpeg/FFmpeg/commit/26d3c81bc5ef2f8c3f09d45eaeacfb4b1139a777", "https://security.gentoo.org/glsa/202312-14"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.4.0+0, < 4.4.2+0"]

[[jlsec_sources]]
id = "CVE-2021-33815"
imported = 2025-10-18T14:07:17.117Z
modified = 2024-11-21T06:09:37.263Z
published = 2021-06-03T17:15:15.073Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-33815"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-33815"
```

# dwa_uncompress in libavcodec/exr.c in FFmpeg 4.4 allows an out-of-bounds array access because dc_cou...

dwa_uncompress in libavcodec/exr.c in FFmpeg 4.4 allows an out-of-bounds array access because dc_count is not strictly checked.

