```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrtj4d7i-15uqhxj"
modified = 2025-10-10T21:54:56.862Z
upstream = ["CVE-2024-45491"]
references = ["https://github.com/libexpat/libexpat/issues/888", "https://github.com/libexpat/libexpat/pull/891", "https://security.netapp.com/advisory/ntap-20241018-0003/"]

[[affected]]
pkg = "Expat_jll"
ranges = ["< 2.6.4+0"]

[[jlsec_sources]]
id = "CVE-2024-45491"
imported = 2025-10-10T21:54:56.862Z
modified = 2024-11-21T09:37:51.080Z
published = 2024-08-30T03:15:03.850Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-45491"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-45491"
```

# An issue was discovered in libexpat before 2.6.3

An issue was discovered in libexpat before 2.6.3. dtdCopy in xmlparse.c can have an integer overflow for nDefaultAtts on 32-bit platforms (where UINT_MAX equals SIZE_MAX).

