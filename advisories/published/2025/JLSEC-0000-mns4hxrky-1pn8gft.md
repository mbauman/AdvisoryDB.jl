```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrky-1pn8gft"
modified = 2025-10-18T14:07:17.218Z
upstream = ["CVE-2023-50009"]
references = ["https://ffmpeg.org/", "https://github.com/FFmpeg/FFmpeg", "https://github.com/FFmpeg/FFmpeg/commit/162b4c60c8f72be2e93b759f3b1e14652b70b3ba", "https://github.com/FFmpeg/FFmpeg/commit/c443658d26d2b8e19901f9507a890e0efca79056", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10699", "https://ffmpeg.org/", "https://github.com/FFmpeg/FFmpeg", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10699"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-50009"
imported = 2025-10-18T14:07:17.218Z
modified = 2025-06-09T16:15:34.193Z
published = 2024-04-19T17:15:52.070Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-50009"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-50009"
```

# FFmpeg v.n6.1-3-g466799d4f5 allows a heap-based buffer overflow via the ff_gaussian_blur_8 function ...

FFmpeg v.n6.1-3-g466799d4f5 allows a heap-based buffer overflow via the ff_gaussian_blur_8 function in libavfilter/edge_template.c:116:5 component.

