```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrgm-15d5aox"
modified = 2025-10-18T14:07:17.062Z
upstream = ["CVE-2020-12284"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=19734", "https://github.com/FFmpeg/FFmpeg/commit/1812352d767ccf5431aa440123e2e260a4db2726", "https://github.com/FFmpeg/FFmpeg/commit/a3a3730b5456ca00587455004d40c047f7b20a99", "https://security.gentoo.org/glsa/202007-58", "https://usn.ubuntu.com/4431-1/", "https://www.debian.org/security/2020/dsa-4722", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=19734", "https://github.com/FFmpeg/FFmpeg/commit/1812352d767ccf5431aa440123e2e260a4db2726", "https://github.com/FFmpeg/FFmpeg/commit/a3a3730b5456ca00587455004d40c047f7b20a99", "https://security.gentoo.org/glsa/202007-58", "https://usn.ubuntu.com/4431-1/", "https://www.debian.org/security/2020/dsa-4722"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["< 4.3.1+0"]

[[jlsec_sources]]
id = "CVE-2020-12284"
imported = 2025-10-18T14:07:17.062Z
modified = 2024-11-21T04:59:26.903Z
published = 2020-04-28T06:15:10.777Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-12284"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-12284"
```

# cbs_jpeg_split_fragment in libavcodec/cbs_jpeg.c in FFmpeg 4.1 and 4.2.2 has a heap-based buffer ove...

cbs_jpeg_split_fragment in libavcodec/cbs_jpeg.c in FFmpeg 4.1 and 4.2.2 has a heap-based buffer overflow during JPEG_MARKER_SOS handling because of a missing length check.

