```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrg2-rlr0m0"
modified = 2025-10-18T14:07:17.042Z
upstream = ["CVE-2019-9718"]
references = ["http://www.securityfocus.com/bid/107382", "https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/1f00c97bc3475c477f3c468cf2d924d5761d0982", "https://github.com/FFmpeg/FFmpeg/commit/23ccf3cabb4baf6e8af4b1af3fcc59c904736f21", "https://seclists.org/bugtraq/2019/May/60", "https://usn.ubuntu.com/3967-1/", "https://www.debian.org/security/2019/dsa-4449", "http://www.securityfocus.com/bid/107382", "https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/1f00c97bc3475c477f3c468cf2d924d5761d0982", "https://github.com/FFmpeg/FFmpeg/commit/23ccf3cabb4baf6e8af4b1af3fcc59c904736f21", "https://seclists.org/bugtraq/2019/May/60", "https://usn.ubuntu.com/3967-1/", "https://www.debian.org/security/2019/dsa-4449"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2019-9718"
imported = 2025-10-18T14:07:17.042Z
modified = 2024-11-21T04:52:10.140Z
published = 2019-03-12T09:29:00.530Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-9718"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-9718"
```

# In FFmpeg 3.2 and 4.1, a denial of service in the subtitle decoder allows attackers to hog the CPU v...

In FFmpeg 3.2 and 4.1, a denial of service in the subtitle decoder allows attackers to hog the CPU via a crafted video file in Matroska format, because ff_htmlmarkup_to_ass in libavcodec/htmlsubtitles.c has a complex format argument to sscanf.

