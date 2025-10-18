```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns2ficw2-16s7sge"
modified = 2025-10-17T03:23:46.754Z
upstream = ["CVE-2025-24928"]
references = ["https://gitlab.gnome.org/GNOME/libxml2/-/issues/847", "https://issues.oss-fuzz.com/issues/392687022", "https://security.netapp.com/advisory/ntap-20250321-0006/"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.13.6+1"]

[[jlsec_sources]]
id = "CVE-2025-24928"
imported = 2025-10-17T03:23:46.754Z
modified = 2025-10-16T19:34:33.453Z
published = 2025-02-18T23:15:10.250Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-24928"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-24928"
```

# libxml2 before 2.12.10 and 2.13.x before 2.13.6 has a stack-based buffer overflow in xmlSnprintfElem...

libxml2 before 2.12.10 and 2.13.x before 2.13.6 has a stack-based buffer overflow in xmlSnprintfElements in valid.c. To exploit this, DTD validation must occur for an untrusted document or untrusted DTD. NOTE: this is similar to CVE-2017-9047.

