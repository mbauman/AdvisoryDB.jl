```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxri7-1bnx4du"
modified = 2025-10-18T14:07:17.119Z
upstream = ["CVE-2021-3566"]
references = ["https://github.com/FFmpeg/FFmpeg/commit/3bce9e9b3ea35c54bacccc793d7da99ea5157532#diff-74f6b92a0541378ad15de9c29c0a2b0c69881ad9ffc71abe568b88b535e00a7f", "https://lists.debian.org/debian-lts-announce/2021/08/msg00018.html", "https://github.com/FFmpeg/FFmpeg/commit/3bce9e9b3ea35c54bacccc793d7da99ea5157532#diff-74f6b92a0541378ad15de9c29c0a2b0c69881ad9ffc71abe568b88b535e00a7f", "https://lists.debian.org/debian-lts-announce/2021/08/msg00018.html"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2021-3566"
imported = 2025-10-18T14:07:17.119Z
modified = 2024-11-21T06:21:51.763Z
published = 2021-08-05T21:15:12.783Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3566"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3566"
```

# Prior to ffmpeg version 4.3, the tty demuxer did not have a 'read_probe' function assigned to it

Prior to ffmpeg version 4.3, the tty demuxer did not have a 'read_probe' function assigned to it. By crafting a legitimate "ffconcat" file that references an image, followed by a file the triggers the tty demuxer, the contents of the second file will be copied into the output file verbatim (as long as the `-vcodec copy` option is passed to ffmpeg).

