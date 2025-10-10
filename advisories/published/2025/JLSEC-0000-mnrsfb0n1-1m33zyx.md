```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrsfb0n1-1m33zyx"
modified = 2025-10-10T03:20:22.525Z
upstream = ["CVE-2025-32365"]
references = ["https://gitlab.freedesktop.org/poppler/poppler/-/issues/1577", "https://gitlab.freedesktop.org/poppler/poppler/-/merge_requests/1792"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-32365"
imported = 2025-10-10T03:20:22.525Z
modified = 2025-10-09T13:51:48.690Z
published = 2025-04-05T22:15:19.010Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-32365"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-32365"
```

# Poppler before 25.04.0 allows crafted input files to trigger out-of-bounds reads in the JBIG2Bitmap:...

Poppler before 25.04.0 allows crafted input files to trigger out-of-bounds reads in the JBIG2Bitmap::combine function in JBIG2Stream.cc because of a misplaced isOk check.

