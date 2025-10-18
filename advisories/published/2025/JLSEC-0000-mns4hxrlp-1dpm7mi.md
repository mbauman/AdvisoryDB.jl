```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlp-1dpm7mi"
modified = 2025-10-18T14:07:17.245Z
upstream = ["CVE-2024-55069"]
references = ["https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/4cc1495aca45445181a107a682c32cfe31459929", "https://trac.ffmpeg.org/ticket/11326"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 7.1.0+0, < 7.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = [">= 7.1.0+0, < 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2024-55069"
imported = 2025-10-18T14:07:17.245Z
modified = 2025-06-03T18:13:05.697Z
published = 2025-05-02T22:15:16.750Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-55069"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-55069"
```

# ffmpeg 7.1 is vulnerable to Null Pointer Dereference in function iamf_read_header in /libavformat/ia...

ffmpeg 7.1 is vulnerable to Null Pointer Dereference in function iamf_read_header in /libavformat/iamfdec.c.

