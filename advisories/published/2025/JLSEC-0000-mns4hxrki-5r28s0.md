```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrki-5r28s0"
modified = 2025-10-18T14:07:17.202Z
upstream = ["CVE-2022-3109"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2153551", "https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568", "https://lists.debian.org/debian-lts-announce/2023/06/msg00016.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KOMB6WRUC55VWV25IKJTV22KARBUGWGQ/", "https://www.debian.org/security/2023/dsa-5394", "https://bugzilla.redhat.com/show_bug.cgi?id=2153551", "https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568", "https://lists.debian.org/debian-lts-announce/2023/06/msg00016.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KOMB6WRUC55VWV25IKJTV22KARBUGWGQ/", "https://www.debian.org/security/2023/dsa-5394"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2022-3109"
imported = 2025-10-18T14:07:17.202Z
modified = 2025-08-07T19:26:18.477Z
published = 2022-12-16T15:15:09.483Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3109"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3109"
```

# An issue was discovered in the FFmpeg package, where vp3_decode_frame in libavcodec/vp3.c lacks chec...

An issue was discovered in the FFmpeg package, where vp3_decode_frame in libavcodec/vp3.c lacks check of the return value of av_malloc() and will cause a null pointer dereference, impacting availability.

