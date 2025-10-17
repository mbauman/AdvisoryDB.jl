```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns39g88h-zs4bka"
modified = 2025-10-17T17:21:55.889Z
upstream = ["CVE-2025-27113"]
references = ["https://gitlab.gnome.org/GNOME/libxml2/-/issues/861", "https://security.netapp.com/advisory/ntap-20250306-0004/"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.13.6+1"]

[[jlsec_sources]]
id = "CVE-2025-27113"
imported = 2025-10-17T17:21:55.889Z
modified = 2025-03-07T01:15:12.823Z
published = 2025-02-18T23:15:10.960Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-27113"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-27113"
```

# libxml2 before 2.12.10 and 2.13.x before 2.13.6 has a NULL pointer dereference in xmlPatMatch in pat...

libxml2 before 2.12.10 and 2.13.x before 2.13.6 has a NULL pointer dereference in xmlPatMatch in pattern.c.

