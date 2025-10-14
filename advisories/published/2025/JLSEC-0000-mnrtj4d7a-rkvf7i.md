```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrtj4d7a-rkvf7i"
modified = 2025-10-10T21:54:56.854Z
upstream = ["CVE-2022-25313"]
references = ["http://www.openwall.com/lists/oss-security/2022/02/19/1", "https://cert-portal.siemens.com/productcert/pdf/ssa-484086.pdf", "https://github.com/libexpat/libexpat/pull/558", "https://lists.debian.org/debian-lts-announce/2022/03/msg00007.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3UFRBA3UQVIQKXTBUQXDWQOVWNBKLERU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/Y27XO3JMKAOMQZVPS3B4MJGEAHCZF5OM/", "https://security.gentoo.org/glsa/202209-24", "https://security.netapp.com/advisory/ntap-20220303-0008/", "https://www.debian.org/security/2022/dsa-5085", "https://www.oracle.com/security-alerts/cpuapr2022.html", "http://www.openwall.com/lists/oss-security/2022/02/19/1", "https://cert-portal.siemens.com/productcert/pdf/ssa-484086.pdf", "https://github.com/libexpat/libexpat/pull/558", "https://lists.debian.org/debian-lts-announce/2022/03/msg00007.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3UFRBA3UQVIQKXTBUQXDWQOVWNBKLERU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/Y27XO3JMKAOMQZVPS3B4MJGEAHCZF5OM/", "https://security.gentoo.org/glsa/202209-24", "https://security.netapp.com/advisory/ntap-20220303-0008/", "https://www.debian.org/security/2022/dsa-5085", "https://www.oracle.com/security-alerts/cpuapr2022.html"]

[[affected]]
pkg = "Expat_jll"
ranges = ["< 2.4.8+0"]

[[jlsec_sources]]
id = "CVE-2022-25313"
imported = 2025-10-10T21:54:56.854Z
modified = 2025-05-30T20:15:26.880Z
published = 2022-02-18T05:15:08.130Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-25313"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-25313"
```

# In Expat (aka libexpat) before 2.4.5, an attacker can trigger stack exhaustion in build_model via a ...

In Expat (aka libexpat) before 2.4.5, an attacker can trigger stack exhaustion in build_model via a large nesting depth in the DTD element.

