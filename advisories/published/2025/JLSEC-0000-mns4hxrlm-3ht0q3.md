```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrlm-3ht0q3"
modified = 2025-10-18T14:07:17.242Z
upstream = ["CVE-2025-0518"]
references = ["https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 7.1.0+0, < 7.1.1+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = [">= 7.1.0+0, < 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2025-0518"
imported = 2025-10-18T14:07:17.242Z
modified = 2025-08-05T19:54:45.033Z
published = 2025-01-16T17:15:12.577Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-0518"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-0518"
```

# Unchecked Return Value, Out-of-bounds Read vulnerability in FFmpeg allows Read Sensitive Constants W...

Unchecked Return Value, Out-of-bounds Read vulnerability in FFmpeg allows Read Sensitive Constants Within an Executable. This vulnerability is associated with program files  https://github.Com/FFmpeg/FFmpeg/blob/master/libavfilter/af_pan.C .

This issue affects FFmpeg: 7.1.

Issue was fixed:  https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a

https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a This issue was discovered by: Simcha Kosman

