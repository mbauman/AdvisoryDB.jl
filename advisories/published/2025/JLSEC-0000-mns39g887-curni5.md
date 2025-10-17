```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns39g887-curni5"
modified = 2025-10-17T17:21:55.879Z
upstream = ["CVE-2023-28484"]
references = ["https://gitlab.gnome.org/GNOME/libxml2/-/issues/491", "https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.10.4", "https://lists.debian.org/debian-lts-announce/2023/04/msg00031.html", "https://security.netapp.com/advisory/ntap-20230601-0006/", "https://security.netapp.com/advisory/ntap-20240201-0005/", "https://gitlab.gnome.org/GNOME/libxml2/-/issues/491", "https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.10.4", "https://lists.debian.org/debian-lts-announce/2023/04/msg00031.html", "https://security.netapp.com/advisory/ntap-20230601-0006/", "https://security.netapp.com/advisory/ntap-20240201-0005/"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.10.4+0", ">= 2.11.5+0, < 2.12.0+0"]

[[jlsec_sources]]
id = "CVE-2023-28484"
imported = 2025-10-17T17:21:55.879Z
modified = 2025-05-30T20:15:31.550Z
published = 2023-04-24T21:15:09.180Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-28484"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-28484"
```

# In libxml2 before 2.10.4, parsing of certain invalid XSD schemas can lead to a NULL pointer derefere...

In libxml2 before 2.10.4, parsing of certain invalid XSD schemas can lead to a NULL pointer dereference and subsequently a segfault. This occurs in xmlSchemaFixupComplexType in xmlschemas.c.

