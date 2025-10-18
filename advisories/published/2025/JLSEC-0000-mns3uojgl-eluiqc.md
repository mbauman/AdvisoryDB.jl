```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3uojgl-eluiqc"
modified = 2025-10-18T03:16:15.621Z
upstream = ["CVE-2025-53644"]
references = ["https://github.com/opencv/opencv/commit/a39db41390de546d18962ee1278bd6dbb715f466", "https://github.com/opencv/opencv/issues/27271", "https://github.com/opencv/opencv/releases/tag/4.12.0", "https://securitylab.github.com/advisories/GHSL-2025-057_OpenCV/"]

[[affected]]
pkg = "OpenCV_jll"
ranges = [">= 4.10.0+0"]

[[jlsec_sources]]
id = "CVE-2025-53644"
imported = 2025-10-18T03:16:15.621Z
modified = 2025-10-17T19:18:41.637Z
published = 2025-07-17T18:15:27.913Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-53644"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-53644"
```

# OpenCV is an Open Source Computer Vision Library

OpenCV is an Open Source Computer Vision Library. Versions 4.10.0 and 4.11.0 have an uninitialized pointer variable on stack that may lead to arbitrary heap buffer write when reading crafted JPEG images. Version 4.12.0 fixes the vulnerability.

