```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns2ficvz-1e5clpi"
modified = 2025-10-17T03:23:46.751Z
upstream = ["CVE-2024-56171"]
references = ["https://gitlab.gnome.org/GNOME/libxml2/-/issues/828", "https://security.netapp.com/advisory/ntap-20250328-0010/"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.13.6+1"]

[[jlsec_sources]]
id = "CVE-2024-56171"
imported = 2025-10-17T03:23:46.734Z
modified = 2025-10-16T19:39:26.400Z
published = 2025-02-18T22:15:12.797Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-56171"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-56171"
```

# libxml2 before 2.12.10 and 2.13.x before 2.13.6 has a use-after-free in xmlSchemaIDCFillNodeTables a...

libxml2 before 2.12.10 and 2.13.x before 2.13.6 has a use-after-free in xmlSchemaIDCFillNodeTables and xmlSchemaBubbleIDCNodeTables in xmlschemas.c. To exploit this, a crafted XML document must be validated against an XML schema with certain identity constraints, or a crafted XML schema must be used.

