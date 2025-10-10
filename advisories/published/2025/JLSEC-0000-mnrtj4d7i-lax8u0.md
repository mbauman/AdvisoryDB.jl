```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrtj4d7i-lax8u0"
modified = 2025-10-10T21:54:56.862Z
upstream = ["CVE-2024-45492"]
references = ["https://github.com/libexpat/libexpat/issues/889", "https://github.com/libexpat/libexpat/pull/892", "https://security.netapp.com/advisory/ntap-20241018-0005/"]

[[affected]]
pkg = "Expat_jll"
ranges = ["< 2.6.4+0"]

[[jlsec_sources]]
id = "CVE-2024-45492"
imported = 2025-10-10T21:54:56.862Z
modified = 2024-11-21T09:37:51.307Z
published = 2024-08-30T03:15:03.930Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-45492"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-45492"
```

# An issue was discovered in libexpat before 2.6.3

An issue was discovered in libexpat before 2.6.3. nextScaffoldPart in xmlparse.c can have an integer overflow for m_groupSize on 32-bit platforms (where UINT_MAX equals SIZE_MAX).

