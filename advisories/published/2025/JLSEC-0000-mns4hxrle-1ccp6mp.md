```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrle-1ccp6mp"
modified = 2025-10-18T14:07:17.234Z
upstream = ["CVE-2024-35366"]
references = ["https://gist.github.com/1047524396/1e72f170d58c2547ebd4db4cdf6cfabf", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavformat/sbgdec.c#L389", "https://github.com/ffmpeg/ffmpeg/commit/0bed22d597b78999151e3bde0768b7fe763fc2a6"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 6.1.2+0"]

[[jlsec_sources]]
id = "CVE-2024-35366"
imported = 2025-10-18T14:07:17.234Z
modified = 2025-06-03T16:03:53.080Z
published = 2024-11-29T20:15:19.863Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-35366"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-35366"
```

# FFmpeg n6.1.1 is Integer Overflow

FFmpeg n6.1.1 is Integer Overflow. The vulnerability exists in the parse_options function of sbgdec.c within the libavformat module. When parsing certain options, the software does not adequately validate the input. This allows for negative duration values to be accepted without proper bounds checking.

