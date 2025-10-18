```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrkt-1pmxar1"
modified = 2025-10-18T14:07:17.213Z
upstream = ["CVE-2024-31582"]
references = ["https://gist.github.com/1047524396/b47d5efe3bc420fb91dbb77c73c0fff3", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavfilter/vf_codecview.c#L220", "https://github.com/ffmpeg/ffmpeg/commit/99debe5f823f45a482e1dc08de35879aa9c74bd2", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://gist.github.com/1047524396/b47d5efe3bc420fb91dbb77c73c0fff3", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavfilter/vf_codecview.c#L220", "https://github.com/ffmpeg/ffmpeg/commit/99debe5f823f45a482e1dc08de35879aa9c74bd2", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2024-31582"
imported = 2025-10-18T14:07:17.213Z
modified = 2025-06-03T15:42:14.187Z
published = 2024-04-17T19:15:07.893Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-31582"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-31582"
```

# FFmpeg version n6.1 was discovered to contain a heap buffer overflow vulnerability in the draw_block...

FFmpeg version n6.1 was discovered to contain a heap buffer overflow vulnerability in the draw_block_rectangle function of libavfilter/vf_codecview.c. This vulnerability allows attackers to cause undefined behavior or a Denial of Service (DoS) via crafted input.

