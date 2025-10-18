```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrgd-1g4l4tu"
modified = 2025-10-18T14:07:17.053Z
upstream = ["CVE-2019-17539"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=15733", "https://github.com/FFmpeg/FFmpeg/commit/8df6884832ec413cf032dfaa45c23b1c7876670c", "https://lists.debian.org/debian-lts-announce/2021/01/msg00026.html", "https://security.gentoo.org/glsa/202003-65", "https://usn.ubuntu.com/4431-1/", "https://www.debian.org/security/2020/dsa-4722", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=15733", "https://github.com/FFmpeg/FFmpeg/commit/8df6884832ec413cf032dfaa45c23b1c7876670c", "https://lists.debian.org/debian-lts-announce/2021/01/msg00026.html", "https://security.gentoo.org/glsa/202003-65", "https://usn.ubuntu.com/4431-1/", "https://www.debian.org/security/2020/dsa-4722"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2019-17539"
imported = 2025-10-18T14:07:17.053Z
modified = 2024-11-21T04:32:28.873Z
published = 2019-10-14T02:15:10.513Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-17539"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-17539"
```

# In FFmpeg before 4.2, avcodec_open2 in libavcodec/utils.c allows a NULL pointer dereference and poss...

In FFmpeg before 4.2, avcodec_open2 in libavcodec/utils.c allows a NULL pointer dereference and possibly unspecified other impact when there is no valid close function pointer.

