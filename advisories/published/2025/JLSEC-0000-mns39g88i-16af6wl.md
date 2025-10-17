```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns39g88i-16af6wl"
modified = 2025-10-17T17:21:55.890Z
upstream = ["CVE-2025-32414"]
references = ["https://gitlab.gnome.org/GNOME/libxml2/-/issues/889", "https://gitlab.gnome.org/GNOME/libxml2/-/issues/889"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.13.8+0", ">= 2.14.1+0, < 2.14.4+0"]

[[jlsec_sources]]
id = "CVE-2025-32414"
imported = 2025-10-17T17:21:55.890Z
modified = 2025-04-23T19:09:35.517Z
published = 2025-04-08T03:15:15.940Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-32414"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-32414"
```

# In libxml2 before 2.13.8 and 2.14.x before 2.14.2, out-of-bounds memory access can occur in the Pyth...

In libxml2 before 2.13.8 and 2.14.x before 2.14.2, out-of-bounds memory access can occur in the Python API (Python bindings) because of an incorrect return value. This occurs in xmlPythonFileRead and xmlPythonFileReadRaw because of a difference between bytes and characters.

