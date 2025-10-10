```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrtj4d78-dj38g3"
modified = 2025-10-10T21:54:56.852Z
upstream = ["CVE-2022-23990"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-484086.pdf", "https://github.com/libexpat/libexpat/pull/551", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/34NXVL2RZC2YZRV74ZQ3RNFB7WCEUP7D/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/R7FF2UH7MPXKTADYSJUAHI2Y5UHBSHUH/", "https://security.gentoo.org/glsa/202209-24", "https://www.debian.org/security/2022/dsa-5073", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.tenable.com/security/tns-2022-05", "https://cert-portal.siemens.com/productcert/pdf/ssa-484086.pdf", "https://github.com/libexpat/libexpat/pull/551", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/34NXVL2RZC2YZRV74ZQ3RNFB7WCEUP7D/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/R7FF2UH7MPXKTADYSJUAHI2Y5UHBSHUH/", "https://security.gentoo.org/glsa/202209-24", "https://www.debian.org/security/2022/dsa-5073", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.tenable.com/security/tns-2022-05"]

[[affected]]
pkg = "Expat_jll"
ranges = ["< 2.4.4+0"]

[[jlsec_sources]]
id = "CVE-2022-23990"
imported = 2025-10-10T21:54:56.852Z
modified = 2025-05-05T17:17:59.050Z
published = 2022-01-26T19:15:08.517Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-23990"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-23990"
```

# Expat (aka libexpat) before 2.4.4 has an integer overflow in the doProlog function.

Expat (aka libexpat) before 2.4.4 has an integer overflow in the doProlog function.

