```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrjh-1uyrrna"
modified = 2025-10-18T14:07:17.165Z
upstream = ["CVE-2021-38171"]
references = ["https://github.com/FFmpeg/FFmpeg/commit/9ffa49496d1aae4cbbb387aac28a9e061a6ab0a6", "https://lists.debian.org/debian-lts-announce/2021/11/msg00012.html", "https://patchwork.ffmpeg.org/project/ffmpeg/patch/AS8P193MB12542A86E22F8207EC971930B6F19%40AS8P193MB1254.EURP193.PROD.OUTLOOK.COM/", "https://security.gentoo.org/glsa/202312-14", "https://www.debian.org/security/2021/dsa-4990", "https://www.debian.org/security/2021/dsa-4998", "https://github.com/FFmpeg/FFmpeg/commit/9ffa49496d1aae4cbbb387aac28a9e061a6ab0a6", "https://lists.debian.org/debian-lts-announce/2021/11/msg00012.html", "https://patchwork.ffmpeg.org/project/ffmpeg/patch/AS8P193MB12542A86E22F8207EC971930B6F19%40AS8P193MB1254.EURP193.PROD.OUTLOOK.COM/", "https://security.gentoo.org/glsa/202312-14", "https://www.debian.org/security/2021/dsa-4990", "https://www.debian.org/security/2021/dsa-4998"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.4.0+0, < 4.4.2+0"]

[[jlsec_sources]]
id = "CVE-2021-38171"
imported = 2025-10-18T14:07:17.165Z
modified = 2024-11-21T06:16:33.257Z
published = 2021-08-21T17:15:07.700Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-38171"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-38171"
```

# adts_decode_extradata in libavformat/adtsenc.c in FFmpeg 4.4 does not check the init_get_bits return...

adts_decode_extradata in libavformat/adtsenc.c in FFmpeg 4.4 does not check the init_get_bits return value, which is a necessary step because the second argument to init_get_bits can be crafted.

