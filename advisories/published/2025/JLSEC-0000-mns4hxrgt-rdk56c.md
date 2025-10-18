```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrgt-rdk56c"
modified = 2025-10-18T14:07:17.069Z
upstream = ["CVE-2020-21041"]
references = ["https://lists.debian.org/debian-lts-announce/2021/08/msg00018.html", "https://trac.ffmpeg.org/ticket/7989", "https://www.debian.org/security/2021/dsa-4990", "https://lists.debian.org/debian-lts-announce/2021/08/msg00018.html", "https://trac.ffmpeg.org/ticket/7989", "https://www.debian.org/security/2021/dsa-4990"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2020-21041"
imported = 2025-10-18T14:07:17.069Z
modified = 2024-11-21T05:12:23.010Z
published = 2021-05-24T18:15:07.800Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-21041"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-21041"
```

# Buffer Overflow vulnerability exists in FFmpeg 4.1 via apng_do_inverse_blend in libavcodec/pngenc.c,...

Buffer Overflow vulnerability exists in FFmpeg 4.1 via apng_do_inverse_blend in libavcodec/pngenc.c, which could let a remote malicious user cause a Denial of Service

