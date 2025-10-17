```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3413ny-8uecmm"
modified = 2025-10-17T14:50:12.046Z
upstream = ["CVE-2025-32364"]
references = ["https://gitlab.freedesktop.org/poppler/poppler/-/commit/d87bc726c7cc98f8c26b60ece5f20236e9de1bc3", "https://gitlab.freedesktop.org/poppler/poppler/-/issues/1574"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-32364"
imported = 2025-10-17T14:50:12.046Z
modified = 2025-10-09T14:00:04.740Z
published = 2025-04-05T22:15:18.337Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-32364"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-32364"
```

# A floating-point exception in the PSStack::roll function of Poppler before 25.04.0 can cause an appl...

A floating-point exception in the PSStack::roll function of Poppler before 25.04.0 can cause an application to crash when handling malformed inputs associated with INT_MIN.

