```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrjt-y447n5"
modified = 2025-10-18T14:07:17.177Z
upstream = ["CVE-2022-1475"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2076764", "https://security.gentoo.org/glsa/202312-14", "https://trac.ffmpeg.org/ticket/9651", "https://bugzilla.redhat.com/show_bug.cgi?id=2076764", "https://security.gentoo.org/glsa/202312-14", "https://trac.ffmpeg.org/ticket/9651"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.3.1+0, < 4.4.2+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["< 4.4.4+0"]

[[jlsec_sources]]
id = "CVE-2022-1475"
imported = 2025-10-18T14:07:17.177Z
modified = 2024-11-21T06:40:47.853Z
published = 2022-05-02T19:15:08.977Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1475"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1475"
```

# An integer overflow vulnerability was found in FFmpeg versions before 4.4.2 and before 5.0.1 in g729...

An integer overflow vulnerability was found in FFmpeg versions before 4.4.2 and before 5.0.1 in g729_parse() in llibavcodec/g729_parser.c when processing a specially crafted file.

