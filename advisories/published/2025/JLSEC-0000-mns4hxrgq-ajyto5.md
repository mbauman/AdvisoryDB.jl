```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrgq-ajyto5"
modified = 2025-10-18T14:07:17.066Z
upstream = ["CVE-2020-35965"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26532", "https://github.com/FFmpeg/FFmpeg/commit/3e5959b3457f7f1856d997261e6ac672bba49e8b", "https://github.com/FFmpeg/FFmpeg/commit/b0a8b40294ea212c1938348ff112ef1b9bf16bb3", "https://lists.debian.org/debian-lts-announce/2021/01/msg00026.html", "https://security.gentoo.org/glsa/202105-24", "https://www.debian.org/security/2021/dsa-4990", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26532", "https://github.com/FFmpeg/FFmpeg/commit/3e5959b3457f7f1856d997261e6ac672bba49e8b", "https://github.com/FFmpeg/FFmpeg/commit/b0a8b40294ea212c1938348ff112ef1b9bf16bb3", "https://lists.debian.org/debian-lts-announce/2021/01/msg00026.html", "https://security.gentoo.org/glsa/202105-24", "https://www.debian.org/security/2021/dsa-4990"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.3.1+2, < 4.4.0+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 4.4.4+0"]

[[jlsec_sources]]
id = "CVE-2020-35965"
imported = 2025-10-18T14:07:17.066Z
modified = 2024-11-21T05:28:36.403Z
published = 2021-01-04T02:15:11.273Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-35965"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-35965"
```

# decode_frame in libavcodec/exr.c in FFmpeg 4.3.1 has an out-of-bounds write because of errors in cal...

decode_frame in libavcodec/exr.c in FFmpeg 4.3.1 has an out-of-bounds write because of errors in calculations of when to perform memset zero operations.

