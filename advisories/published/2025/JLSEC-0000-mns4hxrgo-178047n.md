```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrgo-178047n"
modified = 2025-10-18T14:07:17.064Z
upstream = ["CVE-2020-14212"]
references = ["https://patchwork.ffmpeg.org/project/ffmpeg/list/?series=1463", "https://security.gentoo.org/glsa/202007-58", "https://trac.ffmpeg.org/ticket/8716", "https://patchwork.ffmpeg.org/project/ffmpeg/list/?series=1463", "https://security.gentoo.org/glsa/202007-58", "https://trac.ffmpeg.org/ticket/8716"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.3.1+0, < 4.3.1+2"]

[[jlsec_sources]]
id = "CVE-2020-14212"
imported = 2025-10-18T14:07:17.064Z
modified = 2024-11-21T05:02:52.750Z
published = 2020-06-16T22:15:10.443Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-14212"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-14212"
```

# FFmpeg through 4.3 has a heap-based buffer overflow in avio_get_str in libavformat/aviobuf.c because...

FFmpeg through 4.3 has a heap-based buffer overflow in avio_get_str in libavformat/aviobuf.c because dnn_backend_native.c calls ff_dnn_load_model_native and a certain index check is omitted.

