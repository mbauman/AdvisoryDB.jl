```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrgs-fgi3ek"
modified = 2025-10-18T14:07:17.068Z
upstream = ["CVE-2021-30123"]
references = ["http://git.videolan.org/?p=ffmpeg.git%3Ba=commitdiff%3Bh=d6f293353c94c7ce200f6e0975ae3de49787f91f", "https://security.gentoo.org/glsa/202105-24", "https://trac.ffmpeg.org/ticket/8845", "https://trac.ffmpeg.org/ticket/8863", "http://git.videolan.org/?p=ffmpeg.git%3Ba=commitdiff%3Bh=d6f293353c94c7ce200f6e0975ae3de49787f91f", "https://security.gentoo.org/glsa/202105-24", "https://trac.ffmpeg.org/ticket/8845", "https://trac.ffmpeg.org/ticket/8863"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.4.0+0, < 4.4.2+0"]

[[jlsec_sources]]
id = "CVE-2021-30123"
imported = 2025-10-18T14:07:17.068Z
modified = 2024-11-21T06:03:21.060Z
published = 2021-04-07T20:15:13.403Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-30123"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-30123"
```

# FFmpeg <=4.3 contains a buffer overflow vulnerability in libavcodec through a crafted file that may ...

FFmpeg <=4.3 contains a buffer overflow vulnerability in libavcodec through a crafted file that may lead to remote code execution.

