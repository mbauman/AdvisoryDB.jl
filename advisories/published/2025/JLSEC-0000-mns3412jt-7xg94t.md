```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3412jt-7xg94t"
modified = 2025-10-17T14:50:10.601Z
upstream = ["CVE-2024-56378"]
references = ["https://gitlab.freedesktop.org/poppler/poppler/-/blob/30eada0d2bceb42c2d2a87361339063e0b9bea50/CMakeLists.txt#L621", "https://gitlab.freedesktop.org/poppler/poppler/-/commit/ade9b5ebed44b0c15522c27669ef6cdf93eff84e", "https://gitlab.freedesktop.org/poppler/poppler/-/issues/1553"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-56378"
imported = 2025-10-17T14:50:10.601Z
modified = 2025-10-10T18:31:11.853Z
published = 2024-12-23T00:15:05.133Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-56378"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-56378"
```

# libpoppler.so in Poppler through 24.12.0 has an out-of-bounds read vulnerability within the JBIG2Bit...

libpoppler.so in Poppler through 24.12.0 has an out-of-bounds read vulnerability within the JBIG2Bitmap::combine function in JBIG2Stream.cc.

