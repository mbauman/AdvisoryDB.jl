```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns39g6y6-viikm9"
modified = 2025-10-17T17:21:54.222Z
upstream = ["CVE-2021-3541"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1950515", "https://security.netapp.com/advisory/ntap-20210805-0007/", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1950515", "https://security.netapp.com/advisory/ntap-20210805-0007/", "https://www.oracle.com/security-alerts/cpujan2022.html"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.9.12+0"]

[[jlsec_sources]]
id = "CVE-2021-3541"
imported = 2025-10-17T17:21:54.222Z
modified = 2024-11-21T06:21:48.007Z
published = 2021-07-09T17:15:07.973Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3541"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3541"
```

# A flaw was found in libxml2

A flaw was found in libxml2. Exponential entity expansion attack its possible bypassing all existing protection mechanisms and leading to denial of service.

