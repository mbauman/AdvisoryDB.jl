```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns39g88k-1iev36w"
modified = 2025-10-17T17:21:55.892Z
upstream = ["CVE-2025-32415"]
references = ["https://gitlab.gnome.org/GNOME/libxml2/-/issues/890", "https://gitlab.gnome.org/GNOME/libxml2/-/issues/890"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.13.8+0", ">= 2.14.1+0, < 2.14.4+0"]

[[jlsec_sources]]
id = "CVE-2025-32415"
imported = 2025-10-17T17:21:55.892Z
modified = 2025-04-23T18:17:52.053Z
published = 2025-04-17T17:15:33.733Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-32415"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-32415"
```

# In libxml2 before 2.13.8 and 2.14.x before 2.14.2, xmlSchemaIDCFillNodeTables in xmlschemas.c has a ...

In libxml2 before 2.13.8 and 2.14.x before 2.14.2, xmlSchemaIDCFillNodeTables in xmlschemas.c has a heap-based buffer under-read. To exploit this, a crafted XML document must be validated against an XML schema with certain identity constraints, or a crafted XML schema must be used.

