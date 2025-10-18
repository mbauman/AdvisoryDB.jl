```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrkx-4agfrd"
modified = 2025-10-18T14:07:17.217Z
upstream = ["CVE-2023-50008"]
references = ["https://github.com/FFmpeg/FFmpeg/commit/5f87a68cf70dafeab2fb89b42e41a4c29053b89b", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10701", "https://github.com/FFmpeg/FFmpeg/commit/5f87a68cf70dafeab2fb89b42e41a4c29053b89b", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10701"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-50008"
imported = 2025-10-18T14:07:17.217Z
modified = 2025-06-06T13:15:23.937Z
published = 2024-04-19T17:15:52.013Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-50008"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-50008"
```

# FFmpeg v.n6.1-3-g466799d4f5 allows memory consumption when using the colorcorrect filter, in the av_...

FFmpeg v.n6.1-3-g466799d4f5 allows memory consumption when using the colorcorrect filter, in the av_malloc function in libavutil/mem.c:105:9 component.

