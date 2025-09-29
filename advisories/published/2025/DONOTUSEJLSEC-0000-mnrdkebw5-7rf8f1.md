```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkebw5-7rf8f1"
modified = 2025-09-29T17:46:22.517Z
upstream = ["CVE-2025-8961"]
references = ["http://www.libtiff.org/", "https://drive.google.com/file/d/15L4q2eD8GX3Aj3z6SWC3_FbqaM1ChUx2/view?usp=sharing", "https://gitlab.com/libtiff/libtiff/-/issues/721", "https://gitlab.com/libtiff/libtiff/-/issues/721#note_2670686960", "https://vuldb.com/?ctiid.319955", "https://vuldb.com/?id.319955", "https://vuldb.com/?submit.627957"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.7.0+0"]

[[jlsec_sources]]
id = "CVE-2025-8961"
imported = 2025-09-29T17:46:22.517Z
modified = 2025-09-11T17:00:30.487Z
published = 2025-08-14T13:15:38.037Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-8961"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-8961"
```

# A weakness has been identified in LibTIFF 4.7.0

A weakness has been identified in LibTIFF 4.7.0. This affects the function main of the file tiffcrop.c of the component tiffcrop. Executing manipulation can lead to memory corruption. The attack can only be executed locally. The exploit has been made available to the public and could be exploited.

