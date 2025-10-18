```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrfz-1ed562i"
modified = 2025-10-18T14:07:17.039Z
upstream = ["CVE-2019-1000016"]
references = ["https://github.com/FFmpeg/FFmpeg/commit/b97a4b658814b2de8b9f2a3bce491c002d34de31#diff-cd7e24986650014d67f484f3ffceef3f", "https://github.com/FFmpeg/FFmpeg/commit/b97a4b658814b2de8b9f2a3bce491c002d34de31#diff-cd7e24986650014d67f484f3ffceef3f"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2019-1000016"
imported = 2025-10-18T14:07:17.039Z
modified = 2024-11-21T04:17:41.023Z
published = 2019-02-04T21:29:01.283Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-1000016"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-1000016"
```

# FFMPEG version 4.1 contains a CWE-129: Improper Validation of Array Index vulnerability in libavcode...

FFMPEG version 4.1 contains a CWE-129: Improper Validation of Array Index vulnerability in libavcodec/cbs_av1.c that can result in Denial of service. This attack appears to be exploitable via specially crafted AV1 file has to be provided as input. This vulnerability appears to have been fixed in after commit b97a4b658814b2de8b9f2a3bce491c002d34de31.

