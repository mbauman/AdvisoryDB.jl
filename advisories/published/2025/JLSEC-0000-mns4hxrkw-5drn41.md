```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrkw-5drn41"
modified = 2025-10-18T14:07:17.216Z
upstream = ["CVE-2023-50007"]
references = ["https://github.com/FFmpeg/FFmpeg/commit/b1942734c7cbcdc9034034373abcc9ecb9644c47", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10700", "https://github.com/FFmpeg/FFmpeg/commit/b1942734c7cbcdc9034034373abcc9ecb9644c47", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10700"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-50007"
imported = 2025-10-18T14:07:17.216Z
modified = 2025-06-06T13:15:23.593Z
published = 2024-04-19T17:15:51.957Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-50007"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-50007"
```

# FFmpeg v.n6.1-3-g466799d4f5 allows an attacker to trigger use of a parameter of negative size in the...

FFmpeg v.n6.1-3-g466799d4f5 allows an attacker to trigger use of a parameter of negative size in the av_samples_set_silence function in thelibavutil/samplefmt.c:260:9 component.

