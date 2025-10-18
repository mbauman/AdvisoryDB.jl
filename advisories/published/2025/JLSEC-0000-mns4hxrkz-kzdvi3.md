```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrkz-kzdvi3"
modified = 2025-10-18T14:07:17.219Z
upstream = ["CVE-2023-50010"]
references = ["https://ffmpeg.org/", "https://git.ffmpeg.org/gitweb/ffmpeg.git/blobdiff/ab0fdaedd1e7224f7e84ea22fcbfaa4ca75a6c06..e4d2666bdc3dbd177a81bbf428654a5f2fa3787a:/libavfilter/vf_gradfun.c", "https://github.com/FFmpeg/FFmpeg/commit/e4d2666bdc3dbd177a81bbf428654a5f2fa3787a", "https://github.com/FFmpeg/FFmpeg/commit/e809c23786fe297797198a7b9f5d3392d581daf1", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10702", "https://ffmpeg.org/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10702"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-50010"
imported = 2025-10-18T14:07:17.219Z
modified = 2025-06-09T16:15:34.457Z
published = 2024-04-19T17:15:52.127Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-50010"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-50010"
```

# FFmpeg v.n6.1-3-g466799d4f5 allows a buffer over-read at ff_gradfun_blur_line_movdqa_sse2, as demons...

FFmpeg v.n6.1-3-g466799d4f5 allows a buffer over-read at ff_gradfun_blur_line_movdqa_sse2, as demonstrated by a call to the set_encoder_id function in /fftools/ffmpeg_enc.c component.

