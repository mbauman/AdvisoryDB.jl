```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-37"
modified = 2025-09-25T16:53:33.000Z
published = 2025-09-23T22:07:20.265Z
upstream = ["CVE-2021-23840"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=6a51b9e1d0cf0bf8515f7201b68fb0a3482b3dc1", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=9b1129239f3ebb1d1c98ce9ed41d5c9476c47cb2", "https://kb.pulsesecure.net/articles/Pulse_Security_Advisories/SA44846", "https://kc.mcafee.com/corporate/index?page=content&id=SB10366", "https://lists.apache.org/thread.html/r58af02e294bd07f487e2c64ffc0a29b837db5600e33b6e698b9d696b%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.apache.org/thread.html/rf4c02775860db415b4955778a131c2795223f61cb8c6a450893651e4%40%3Cissues.bookkeeper.apache.org%3E", "https://security.gentoo.org/glsa/202103-03", "https://security.netapp.com/advisory/ntap-20210219-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.debian.org/security/2021/dsa-4855", "https://www.openssl.org/news/secadv/20210216.txt", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://www.tenable.com/security/tns-2021-03", "https://www.tenable.com/security/tns-2021-09", "https://www.tenable.com/security/tns-2021-10", "https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=6a51b9e1d0cf0bf8515f7201b68fb0a3482b3dc1", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=9b1129239f3ebb1d1c98ce9ed41d5c9476c47cb2", "https://kb.pulsesecure.net/articles/Pulse_Security_Advisories/SA44846", "https://kc.mcafee.com/corporate/index?page=content&id=SB10366", "https://lists.apache.org/thread.html/r58af02e294bd07f487e2c64ffc0a29b837db5600e33b6e698b9d696b%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.apache.org/thread.html/rf4c02775860db415b4955778a131c2795223f61cb8c6a450893651e4%40%3Cissues.bookkeeper.apache.org%3E", "https://security.gentoo.org/glsa/202103-03", "https://security.netapp.com/advisory/ntap-20210219-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.debian.org/security/2021/dsa-4855", "https://www.openssl.org/news/secadv/20210216.txt", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://www.tenable.com/security/tns-2021-03", "https://www.tenable.com/security/tns-2021-09", "https://www.tenable.com/security/tns-2021-10"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.10+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.19.9+0"]

[[jlsec_sources]]
id = "CVE-2021-23840"
imported = 2025-09-23T21:56:31.020Z
modified = 2024-11-21T05:51:55.210Z
published = 2021-02-16T17:15:13.300Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-23840"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-23840"
```

# Calls to EVP*CipherUpdate, EVP*EncryptUpdate and EVP_DecryptUpdate may overflow the output length ar...

Calls to EVP*CipherUpdate, EVP*EncryptUpdate and EVP_DecryptUpdate may overflow the output length argument in some cases where the input length is close to the maximum permissable length for an integer on the platform. In such cases the return value from the function call will be 1 (indicating success), but the output length value will be negative. This could cause applications to behave incorrectly or crash. OpenSSL versions 1.1.1i and below are affected by this issue. Users of these versions should upgrade to OpenSSL 1.1.1j. OpenSSL versions 1.0.2x and below are affected by this issue. However OpenSSL 1.0.2 is out of support and no longer receiving public updates. Premium support customers of OpenSSL 1.0.2 should upgrade to 1.0.2y. Other users should upgrade to 1.1.1j. Fixed in OpenSSL 1.1.1j (Affected 1.1.1-1.1.1i). Fixed in OpenSSL 1.0.2y (Affected 1.0.2-1.0.2x).

