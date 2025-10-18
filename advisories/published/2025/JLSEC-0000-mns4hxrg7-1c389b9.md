```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrg7-1c389b9"
modified = 2025-10-18T14:07:17.047Z
upstream = ["CVE-2019-11339"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00012.html", "http://www.securityfocus.com/bid/108037", "https://github.com/FFmpeg/FFmpeg/commit/1f686d023b95219db933394a7704ad9aa5f01cbb", "https://github.com/FFmpeg/FFmpeg/commit/d227ed5d598340e719eff7156b1aa0a4469e9a6a", "https://usn.ubuntu.com/3967-1/", "http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00012.html", "http://www.securityfocus.com/bid/108037", "https://github.com/FFmpeg/FFmpeg/commit/1f686d023b95219db933394a7704ad9aa5f01cbb", "https://github.com/FFmpeg/FFmpeg/commit/d227ed5d598340e719eff7156b1aa0a4469e9a6a", "https://usn.ubuntu.com/3967-1/"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2019-11339"
imported = 2025-10-18T14:07:17.047Z
modified = 2024-11-21T04:20:54.743Z
published = 2019-04-19T00:29:00.293Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-11339"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-11339"
```

# The studio profile decoder in libavcodec/mpeg4videodec.c in FFmpeg 4.0 before 4.0.4 and 4.1 before 4...

The studio profile decoder in libavcodec/mpeg4videodec.c in FFmpeg 4.0 before 4.0.4 and 4.1 before 4.1.2 allows remote attackers to cause a denial of service (out-of-array access) or possibly have unspecified other impact via crafted MPEG-4 video data.

