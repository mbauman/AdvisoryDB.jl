```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrkk-idbdqv"
modified = 2025-10-18T14:07:17.204Z
upstream = ["CVE-2022-48434"]
references = ["https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/cc867f2c09d2b69cee8a0eccd62aff002cbbfe11", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KOMB6WRUC55VWV25IKJTV22KARBUGWGQ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PQHNSWXFUN3VJ3AO2AEJUK3BURSGM5G2/", "https://news.ycombinator.com/item?id=35356201", "https://security.gentoo.org/glsa/202312-14", "https://wrv.github.io/h26forge.pdf", "https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/cc867f2c09d2b69cee8a0eccd62aff002cbbfe11", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KOMB6WRUC55VWV25IKJTV22KARBUGWGQ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PQHNSWXFUN3VJ3AO2AEJUK3BURSGM5G2/", "https://news.ycombinator.com/item?id=35356201", "https://security.gentoo.org/glsa/202312-14", "https://wrv.github.io/h26forge.pdf"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2022-48434"
imported = 2025-10-18T14:07:17.204Z
modified = 2024-11-21T07:33:20.487Z
published = 2023-03-29T17:15:07.053Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-48434"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-48434"
```

# libavcodec/pthread_frame.c in FFmpeg before 5.1.2, as used in VLC and other products, leaves stale h...

libavcodec/pthread_frame.c in FFmpeg before 5.1.2, as used in VLC and other products, leaves stale hwaccel state in worker threads, which allows attackers to trigger a use-after-free and execute arbitrary code in some circumstances (e.g., hardware re-initialization upon a mid-video SPS change when Direct3D11 is used).

