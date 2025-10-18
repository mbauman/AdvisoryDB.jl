```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrl6-1ag22ga"
modified = 2025-10-18T14:07:17.226Z
upstream = ["CVE-2024-7272"]
references = ["https://ffmpeg.org/", "https://github.com/CookedMelon/ReportCVE/tree/main/FFmpeg/poc5", "https://github.com/CookedMelon/ReportCVE/tree/main/FFmpeg/poc6", "https://vuldb.com/?ctiid.273945", "https://vuldb.com/?id.273945"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 6.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2024-7272"
imported = 2025-10-18T14:07:17.226Z
modified = 2024-08-13T15:16:23.837Z
published = 2024-08-12T13:38:40.850Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-7272"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-7272"
```

# A vulnerability, which was classified as critical, was found in FFmpeg up to 5.1.5

A vulnerability, which was classified as critical, was found in FFmpeg up to 5.1.5. This affects the function fill_audiodata of the file /libswresample/swresample.c. The manipulation leads to heap-based buffer overflow. It is possible to initiate the attack remotely. This issue was fixed in version 6.0 by 9903ba28c28ab18dc7b7b6fb8571cc8b5caae1a6 but a backport for 5.1 was forgotten. The exploit has been disclosed to the public and may be used. Upgrading to version 5.1.6 and 6.0 9903ba28c28ab18dc7b7b6fb8571cc8b5caae1a6 is able to address this issue. It is recommended to upgrade the affected component.

