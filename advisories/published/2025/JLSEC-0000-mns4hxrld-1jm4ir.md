```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrld-1jm4ir"
modified = 2025-10-18T14:07:17.233Z
upstream = ["CVE-2024-36616"]
references = ["https://gist.github.com/1047524396/ded3e1509d8296ec4a91817867d108e0", "https://github.com/FFmpeg/FFmpeg/blob/n6.1.1/libavformat/westwood_vqa.c#L265", "https://github.com/ffmpeg/ffmpeg/commit/86f73277bf014e2ce36dd2594f1e0fb8b3bd6661"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 6.1.1+0, < 6.1.2+0"]

[[jlsec_sources]]
id = "CVE-2024-36616"
imported = 2025-10-18T14:07:17.233Z
modified = 2025-06-03T16:04:30.813Z
published = 2024-11-29T19:15:07.817Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-36616"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-36616"
```

# An integer overflow in the component /libavformat/westwood_vqa.c of FFmpeg n6.1.1 allows attackers t...

An integer overflow in the component /libavformat/westwood_vqa.c of FFmpeg n6.1.1 allows attackers to cause a denial of service in the application via a crafted VQA file.

