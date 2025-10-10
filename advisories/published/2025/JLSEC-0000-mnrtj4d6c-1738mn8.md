```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrtj4d6c-1738mn8"
modified = 2025-10-10T21:54:56.820Z
upstream = ["CVE-2021-46143"]
references = ["http://www.openwall.com/lists/oss-security/2022/01/17/3", "https://cert-portal.siemens.com/productcert/pdf/ssa-484086.pdf", "https://github.com/libexpat/libexpat/issues/532", "https://github.com/libexpat/libexpat/pull/538", "https://security.gentoo.org/glsa/202209-24", "https://security.netapp.com/advisory/ntap-20220121-0006/", "https://www.debian.org/security/2022/dsa-5073", "https://www.tenable.com/security/tns-2022-05", "http://www.openwall.com/lists/oss-security/2022/01/17/3", "https://cert-portal.siemens.com/productcert/pdf/ssa-484086.pdf", "https://github.com/libexpat/libexpat/issues/532", "https://github.com/libexpat/libexpat/pull/538", "https://security.gentoo.org/glsa/202209-24", "https://security.netapp.com/advisory/ntap-20220121-0006/", "https://www.debian.org/security/2022/dsa-5073", "https://www.tenable.com/security/tns-2022-05"]

[[affected]]
pkg = "Expat_jll"
ranges = ["< 2.4.4+0"]

[[jlsec_sources]]
id = "CVE-2021-46143"
imported = 2025-10-10T21:54:56.820Z
modified = 2025-05-05T17:17:28.820Z
published = 2022-01-06T04:15:07.017Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-46143"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-46143"
```

# In doProlog in xmlparse.c in Expat (aka libexpat) before 2.4.3, an integer overflow exists for m_gro...

In doProlog in xmlparse.c in Expat (aka libexpat) before 2.4.3, an integer overflow exists for m_groupSize.

