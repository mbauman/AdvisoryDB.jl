```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt3chvr-1ran9jt"
modified = 2025-10-10T14:33:22.311Z
upstream = ["CVE-2020-8231"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://curl.haxx.se/docs/CVE-2020-8231.html", "https://hackerone.com/reports/948876", "https://lists.apache.org/thread.html/r58af02e294bd07f487e2c64ffc0a29b837db5600e33b6e698b9d696b%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.apache.org/thread.html/rf4c02775860db415b4955778a131c2795223f61cb8c6a450893651e4%40%3Cissues.bookkeeper.apache.org%3E", "https://security.gentoo.org/glsa/202012-14", "https://www.debian.org/security/2021/dsa-4881", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://curl.haxx.se/docs/CVE-2020-8231.html", "https://hackerone.com/reports/948876", "https://lists.apache.org/thread.html/r58af02e294bd07f487e2c64ffc0a29b837db5600e33b6e698b9d696b%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.apache.org/thread.html/rf4c02775860db415b4955778a131c2795223f61cb8c6a450893651e4%40%3Cissues.bookkeeper.apache.org%3E", "https://security.gentoo.org/glsa/202012-14", "https://www.debian.org/security/2021/dsa-4881", "https://www.oracle.com/security-alerts/cpuapr2022.html"]

[[affected]]
pkg = "LibCURL_jll"
ranges = ["< 7.81.0+0"]

[[jlsec_sources]]
id = "CVE-2020-8231"
imported = 2025-10-10T14:33:22.311Z
modified = 2024-11-21T05:38:33.127Z
published = 2020-12-14T20:15:13.590Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-8231"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-8231"
```

# Due to use of a dangling pointer, libcurl 7.29.0 through 7.71.1 can use the wrong connection when se...

Due to use of a dangling pointer, libcurl 7.29.0 through 7.71.1 can use the wrong connection when sending data.

