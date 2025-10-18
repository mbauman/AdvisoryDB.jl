```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlo-1efej6v"
modified = 2025-10-18T14:07:17.244Z
upstream = ["CVE-2025-1594"]
references = ["https://ffmpeg.org/", "https://trac.ffmpeg.org/attachment/ticket/11418/poc", "https://trac.ffmpeg.org/ticket/11418#comment:3", "https://vuldb.com/?ctiid.296589", "https://vuldb.com/?id.296589", "https://vuldb.com/?submit.496929"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 7.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2025-1594"
imported = 2025-10-18T14:07:17.244Z
modified = 2025-06-03T18:04:04.387Z
published = 2025-02-23T21:15:09.130Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-1594"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-1594"
```

# A vulnerability, which was classified as critical, was found in FFmpeg up to 7.1

A vulnerability, which was classified as critical, was found in FFmpeg up to 7.1. This affects the function ff_aac_search_for_tns of the file libavcodec/aacenc_tns.c of the component AAC Encoder. The manipulation leads to stack-based buffer overflow. It is possible to initiate the attack remotely. The exploit has been disclosed to the public and may be used.

