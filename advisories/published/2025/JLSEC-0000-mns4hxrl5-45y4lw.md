```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrl5-45y4lw"
modified = 2025-10-18T14:07:17.225Z
upstream = ["CVE-2024-7055"]
references = ["https://ffmpeg.org/", "https://ffmpeg.org/download.html", "https://github.com/CookedMelon/ReportCVE/tree/main/FFmpeg/poc3", "https://vuldb.com/?ctiid.273651", "https://vuldb.com/?id.273651", "https://vuldb.com/?submit.376532"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.2+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2024-7055"
imported = 2025-10-18T14:07:17.225Z
modified = 2025-06-03T17:20:06.493Z
published = 2024-08-06T06:15:36.107Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-7055"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-7055"
```

# A vulnerability was found in FFmpeg up to 7.0.1

A vulnerability was found in FFmpeg up to 7.0.1. It has been classified as critical. This affects the function pnm_decode_frame in the library /libavcodec/pnmdec.c. The manipulation leads to heap-based buffer overflow. It is possible to initiate the attack remotely. The exploit has been disclosed to the public and may be used. Upgrading to version 7.0.2 is able to address this issue. It is recommended to upgrade the affected component. The associated identifier of this vulnerability is VDB-273651.

