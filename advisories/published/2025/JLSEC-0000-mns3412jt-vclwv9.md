```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3412jt-vclwv9"
modified = 2025-10-17T14:50:10.601Z
upstream = ["CVE-2024-6239"]
references = ["https://access.redhat.com/errata/RHSA-2024:5305", "https://access.redhat.com/errata/RHSA-2024:9167", "https://access.redhat.com/security/cve/CVE-2024-6239", "https://bugzilla.redhat.com/show_bug.cgi?id=2293594", "https://access.redhat.com/security/cve/CVE-2024-6239", "https://bugzilla.redhat.com/show_bug.cgi?id=2293594"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["< 24.6.0+0"]

[[jlsec_sources]]
id = "CVE-2024-6239"
imported = 2025-10-17T14:50:10.601Z
modified = 2024-11-21T09:49:15.570Z
published = 2024-06-21T14:15:14.007Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-6239"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-6239"
```

# A flaw was found in the Poppler's Pdfinfo utility

A flaw was found in the Poppler's Pdfinfo utility. This issue occurs when using -dests parameter with pdfinfo utility. By using certain malformed input files, an attacker could cause the utility to crash, leading to a denial of service.

