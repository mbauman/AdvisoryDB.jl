```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3413v8-6uzkb"
modified = 2025-10-17T14:50:12.308Z
upstream = ["CVE-2025-43903"]
references = ["https://gitlab.freedesktop.org/poppler/poppler/-/commit/f1b9c830f145a0042e853d6462b2f9ca4016c669"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-43903"
imported = 2025-10-17T14:50:12.308Z
modified = 2025-10-06T16:37:14.947Z
published = 2025-04-18T21:15:44.673Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-43903"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-43903"
```

# NSSCryptoSignBackend.cc in Poppler before 25.04.0 does not verify the adbe.pkcs7.sha1 signatures on ...

NSSCryptoSignBackend.cc in Poppler before 25.04.0 does not verify the adbe.pkcs7.sha1 signatures on documents, resulting in potential signature forgeries.

