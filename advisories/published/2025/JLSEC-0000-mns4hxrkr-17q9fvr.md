```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrkr-17q9fvr"
modified = 2025-10-18T14:07:17.211Z
upstream = ["CVE-2024-31578"]
references = ["https://gist.github.com/1047524396/45400cce5859d78dcd3a62010df8d179", "https://github.com/ffmpeg/ffmpeg/commit/3bb00c0a420c3ce83c6fafee30270d69622ccad7", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://gist.github.com/1047524396/45400cce5859d78dcd3a62010df8d179", "https://github.com/ffmpeg/ffmpeg/commit/3bb00c0a420c3ce83c6fafee30270d69622ccad7", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 7.1.0+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2024-31578"
imported = 2025-10-18T14:07:17.211Z
modified = 2025-06-03T18:09:18.917Z
published = 2024-04-17T14:15:08.563Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-31578"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-31578"
```

# FFmpeg version n6.1.1 was discovered to contain a heap use-after-free via the av_hwframe_ctx_init fu...

FFmpeg version n6.1.1 was discovered to contain a heap use-after-free via the av_hwframe_ctx_init function.

