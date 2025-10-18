```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrln-pzvch5"
modified = 2025-10-18T14:07:17.243Z
upstream = ["CVE-2025-1373"]
references = ["https://ffmpeg.org/", "https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/43be8d07281caca2e88bfd8ee2333633e1fb1a13", "https://trac.ffmpeg.org/attachment/ticket/11460/poc", "https://trac.ffmpeg.org/ticket/11460", "https://vuldb.com/?ctiid.295982", "https://vuldb.com/?id.295982", "https://vuldb.com/?submit.496930"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 7.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2025-1373"
imported = 2025-10-18T14:07:17.243Z
modified = 2025-06-03T17:53:41.843Z
published = 2025-02-17T04:15:08.447Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-1373"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-1373"
```

# A vulnerability was found in FFmpeg up to 7.1

A vulnerability was found in FFmpeg up to 7.1. It has been rated as problematic. Affected by this issue is the function mov_read_trak of the file libavformat/mov.c of the component MOV Parser. The manipulation leads to null pointer dereference. Local access is required to approach this attack. The exploit has been disclosed to the public and may be used. The patch is identified as 43be8d07281caca2e88bfd8ee2333633e1fb1a13. It is recommended to apply a patch to fix this issue.

