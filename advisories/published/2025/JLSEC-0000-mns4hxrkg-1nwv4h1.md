```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4hxrkg-1nwv4h1"
modified = 2025-10-18T14:07:17.200Z
upstream = ["CVE-2022-3964"]
references = ["https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/92f9b28ed84a77138105475beba16c146bdaf984", "https://security.gentoo.org/glsa/202312-14", "https://vuldb.com/?id.213543", "https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/92f9b28ed84a77138105475beba16c146bdaf984", "https://security.gentoo.org/glsa/202312-14", "https://vuldb.com/?id.213543"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 4.4.0+0, < 4.4.4+0"]

[[jlsec_sources]]
id = "CVE-2022-3964"
imported = 2025-10-18T14:07:17.200Z
modified = 2024-11-21T07:20:37.760Z
published = 2022-11-13T08:15:14.657Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3964"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3964"
```

# A vulnerability classified as problematic has been found in ffmpeg

A vulnerability classified as problematic has been found in ffmpeg. This affects an unknown part of the file libavcodec/rpzaenc.c of the component QuickTime RPZA Video Encoder. The manipulation of the argument y_size leads to out-of-bounds read. It is possible to initiate the attack remotely. The name of the patch is 92f9b28ed84a77138105475beba16c146bdaf984. It is recommended to apply a patch to fix this issue. The associated identifier of this vulnerability is VDB-213543.

