```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrtj4d79-1vnfr3f"
modified = 2025-10-10T21:54:56.853Z
upstream = ["CVE-2022-25235"]
references = ["http://www.openwall.com/lists/oss-security/2022/02/19/1", "https://cert-portal.siemens.com/productcert/pdf/ssa-484086.pdf", "https://github.com/libexpat/libexpat/pull/562", "https://lists.debian.org/debian-lts-announce/2022/03/msg00007.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3UFRBA3UQVIQKXTBUQXDWQOVWNBKLERU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/Y27XO3JMKAOMQZVPS3B4MJGEAHCZF5OM/", "https://security.gentoo.org/glsa/202209-24", "https://security.netapp.com/advisory/ntap-20220303-0008/", "https://www.debian.org/security/2022/dsa-5085", "https://www.oracle.com/security-alerts/cpuapr2022.html", "http://www.openwall.com/lists/oss-security/2022/02/19/1", "https://cert-portal.siemens.com/productcert/pdf/ssa-484086.pdf", "https://github.com/libexpat/libexpat/pull/562", "https://lists.debian.org/debian-lts-announce/2022/03/msg00007.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3UFRBA3UQVIQKXTBUQXDWQOVWNBKLERU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/Y27XO3JMKAOMQZVPS3B4MJGEAHCZF5OM/", "https://security.gentoo.org/glsa/202209-24", "https://security.netapp.com/advisory/ntap-20220303-0008/", "https://www.debian.org/security/2022/dsa-5085", "https://www.oracle.com/security-alerts/cpuapr2022.html"]

[[affected]]
pkg = "Expat_jll"
ranges = ["< 2.4.8+0"]

[[jlsec_sources]]
id = "CVE-2022-25235"
imported = 2025-10-10T21:54:56.853Z
modified = 2025-05-05T17:18:00.623Z
published = 2022-02-16T01:15:07.607Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-25235"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-25235"
```

# xmltok_impl.c in Expat (aka libexpat) before 2.4.5 lacks certain validation of encoding, such as che...

xmltok_impl.c in Expat (aka libexpat) before 2.4.5 lacks certain validation of encoding, such as checks for whether a UTF-8 character is valid in a certain context.

