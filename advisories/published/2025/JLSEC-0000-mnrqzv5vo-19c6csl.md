```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrqzv5vo-19c6csl"
modified = 2025-10-09T03:20:22.404Z
upstream = ["CVE-2025-53015"]
references = ["https://drive.google.com/file/d/1iegkwlTjqnJTtM4XkiheYsjKsC6pxtId/view?usp=sharing", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vmhh-8rxq-fp9g", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vmhh-8rxq-fp9g"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = [">= 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2025-53015"
imported = 2025-10-09T03:20:22.386Z
modified = 2025-10-08T17:06:58.590Z
published = 2025-07-14T20:15:28.890Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-53015"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-53015"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. In versions prior to 7.1.2-0, infinite lines occur when writing during a specific XMP file conversion command. Version 7.1.2-0 fixes the issue.

