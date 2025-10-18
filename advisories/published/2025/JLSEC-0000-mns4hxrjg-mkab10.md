```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrjg-mkab10"
modified = 2025-10-18T14:07:17.164Z
upstream = ["CVE-2021-38291"]
references = ["https://lists.debian.org/debian-lts-announce/2021/11/msg00012.html", "https://security.gentoo.org/glsa/202312-14", "https://trac.ffmpeg.org/ticket/9312", "https://www.debian.org/security/2021/dsa-4990", "https://www.debian.org/security/2021/dsa-4998", "https://lists.debian.org/debian-lts-announce/2021/11/msg00012.html", "https://security.gentoo.org/glsa/202312-14", "https://trac.ffmpeg.org/ticket/9312", "https://www.debian.org/security/2021/dsa-4990", "https://www.debian.org/security/2021/dsa-4998"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0", ">= 4.3.1+2, < 4.4.0+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 4.4.4+0"]

[[jlsec_sources]]
id = "CVE-2021-38291"
imported = 2025-10-18T14:07:17.164Z
modified = 2024-11-21T06:16:43.953Z
published = 2021-08-12T16:15:10.490Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-38291"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-38291"
```

# FFmpeg version (git commit de8e6e67e7523e48bb27ac224a0b446df05e1640) suffers from a an assertion fai...

FFmpeg version (git commit de8e6e67e7523e48bb27ac224a0b446df05e1640) suffers from a an assertion failure at src/libavutil/mathematics.c.

