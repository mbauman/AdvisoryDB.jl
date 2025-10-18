```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrgh-1ay9m4u"
modified = 2025-10-18T14:07:17.057Z
upstream = ["CVE-2019-17542"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=15919", "https://github.com/FFmpeg/FFmpeg/commit/02f909dc24b1f05cfbba75077c7707b905e63cd2", "https://lists.debian.org/debian-lts-announce/2019/12/msg00003.html", "https://lists.debian.org/debian-lts-announce/2020/07/msg00022.html", "https://security.gentoo.org/glsa/202003-65", "https://usn.ubuntu.com/4431-1/", "https://www.debian.org/security/2020/dsa-4722", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=15919", "https://github.com/FFmpeg/FFmpeg/commit/02f909dc24b1f05cfbba75077c7707b905e63cd2", "https://lists.debian.org/debian-lts-announce/2019/12/msg00003.html", "https://lists.debian.org/debian-lts-announce/2020/07/msg00022.html", "https://security.gentoo.org/glsa/202003-65", "https://usn.ubuntu.com/4431-1/", "https://www.debian.org/security/2020/dsa-4722"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2019-17542"
imported = 2025-10-18T14:07:17.057Z
modified = 2024-11-21T04:32:29.313Z
published = 2019-10-14T02:15:10.780Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-17542"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-17542"
```

# FFmpeg before 4.2 has a heap-based buffer overflow in vqa_decode_chunk because of an out-of-array ac...

FFmpeg before 4.2 has a heap-based buffer overflow in vqa_decode_chunk because of an out-of-array access in vqa_decode_init in libavcodec/vqavideo.c.

