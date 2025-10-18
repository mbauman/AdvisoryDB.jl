```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxri6-1744f5h"
modified = 2025-10-18T14:07:17.118Z
upstream = ["CVE-2021-38114"]
references = ["https://github.com/FFmpeg/FFmpeg/commit/7150f9575671f898382c370acae35f9087a30ba1", "https://lists.debian.org/debian-lts-announce/2021/08/msg00018.html", "https://patchwork.ffmpeg.org/project/ffmpeg/patch/PAXP193MB12624C21AE412BE95BA4D4A4B6F09%40PAXP193MB1262.EURP193.PROD.OUTLOOK.COM/", "https://www.debian.org/security/2021/dsa-4990", "https://www.debian.org/security/2021/dsa-4998", "https://github.com/FFmpeg/FFmpeg/commit/7150f9575671f898382c370acae35f9087a30ba1", "https://lists.debian.org/debian-lts-announce/2021/08/msg00018.html", "https://patchwork.ffmpeg.org/project/ffmpeg/patch/PAXP193MB12624C21AE412BE95BA4D4A4B6F09%40PAXP193MB1262.EURP193.PROD.OUTLOOK.COM/", "https://www.debian.org/security/2021/dsa-4990", "https://www.debian.org/security/2021/dsa-4998"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.4.0+0, < 4.4.2+0"]

[[jlsec_sources]]
id = "CVE-2021-38114"
imported = 2025-10-18T14:07:17.118Z
modified = 2024-11-21T06:16:25.210Z
published = 2021-08-04T21:15:08.130Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-38114"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-38114"
```

# libavcodec/dnxhddec.c in FFmpeg 4.4 does not check the return value of the init_vlc function, a simi...

libavcodec/dnxhddec.c in FFmpeg 4.4 does not check the return value of the init_vlc function, a similar issue to CVE-2013-0868.

