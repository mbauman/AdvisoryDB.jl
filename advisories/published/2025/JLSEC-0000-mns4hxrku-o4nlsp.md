```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrku-o4nlsp"
modified = 2025-10-18T14:07:17.214Z
upstream = ["CVE-2024-31585"]
references = ["https://gist.github.com/1047524396/dc2c64ffe0c3934a6176bcd2c5cf5656", "https://git.ffmpeg.org/gitweb/ffmpeg.git/blobdiff/aec67d3d7d2895bfea61aa1358d9d8e956f8615c..ab0fdaedd1e7224f7e84ea22fcbfaa4ca75a6c06:/libavfilter/avf_showspectrum.c", "https://git.ffmpeg.org/gitweb/ffmpeg.git/blobdiff/bf2d7b20ea1c7d15dcbaedd479f40295e5c83430..3061bf668feffc7c1f0b244205167b3b86da8015:/libavfilter/avf_showspectrum.c", "https://github.com/FFmpeg/FFmpeg/commit/3061bf668feffc7c1f0b244205167b3b86da8015", "https://github.com/FFmpeg/FFmpeg/commit/81df787b53eb5c6433731f6eaaf7f2a94d8a8c80", "https://github.com/ffmpeg/ffmpeg/commit/ab0fdaedd1e7224f7e84ea22fcbfaa4ca75a6c06", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://gist.github.com/1047524396/dc2c64ffe0c3934a6176bcd2c5cf5656", "https://github.com/FFmpeg/FFmpeg/commit/81df787b53eb5c6433731f6eaaf7f2a94d8a8c80", "https://github.com/ffmpeg/ffmpeg/commit/ab0fdaedd1e7224f7e84ea22fcbfaa4ca75a6c06", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2024-31585"
imported = 2025-10-18T14:07:17.214Z
modified = 2025-06-09T16:15:34.637Z
published = 2024-04-17T19:15:08.007Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-31585"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-31585"
```

# FFmpeg version n5.1 to n6.1 was discovered to contain an Off-by-one Error vulnerability in libavfilt...

FFmpeg version n5.1 to n6.1 was discovered to contain an Off-by-one Error vulnerability in libavfilter/avf_showspectrum.c. This vulnerability allows attackers to cause a Denial of Service (DoS) via a crafted input.

