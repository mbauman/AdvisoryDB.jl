```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrgb-11tewt3"
modified = 2025-10-18T14:07:17.051Z
upstream = ["CVE-2019-15942"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00012.html", "https://security.gentoo.org/glsa/202007-58", "https://trac.ffmpeg.org/ticket/8093", "http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00012.html", "https://security.gentoo.org/glsa/202007-58", "https://trac.ffmpeg.org/ticket/8093"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2019-15942"
imported = 2025-10-18T14:07:17.051Z
modified = 2024-11-21T04:29:47.143Z
published = 2019-09-05T16:15:12.027Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-15942"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-15942"
```

# FFmpeg through 4.2 has a "Conditional jump or move depends on uninitialised value" issue in h2645_pa...

FFmpeg through 4.2 has a "Conditional jump or move depends on uninitialised value" issue in h2645_parse because alloc_rbsp_buffer in libavcodec/h2645_parse.c mishandles rbsp_buffer.

