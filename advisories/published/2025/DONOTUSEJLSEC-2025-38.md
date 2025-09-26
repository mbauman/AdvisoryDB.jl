```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-38"
modified = 2025-09-26T17:16:58.363Z
published = 2025-09-23T22:07:20.268Z
upstream = ["CVE-2021-23841"]
references = ["http://seclists.org/fulldisclosure/2021/May/67", "http://seclists.org/fulldisclosure/2021/May/68", "http://seclists.org/fulldisclosure/2021/May/70", "https://cert-portal.siemens.com/productcert/pdf/ssa-637483.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=122a19ab48091c657f7cb1fb3af9fc07bd557bbf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=8252ee4d90f3f2004d3d0aeeed003ad49c9a7807", "https://kb.pulsesecure.net/articles/Pulse_Security_Advisories/SA44846", "https://security.gentoo.org/glsa/202103-03", "https://security.netapp.com/advisory/ntap-20210219-0009/", "https://security.netapp.com/advisory/ntap-20210513-0002/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://support.apple.com/kb/HT212528", "https://support.apple.com/kb/HT212529", "https://support.apple.com/kb/HT212534", "https://www.debian.org/security/2021/dsa-4855", "https://www.openssl.org/news/secadv/20210216.txt", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://www.tenable.com/security/tns-2021-03", "https://www.tenable.com/security/tns-2021-09", "http://seclists.org/fulldisclosure/2021/May/67", "http://seclists.org/fulldisclosure/2021/May/68", "http://seclists.org/fulldisclosure/2021/May/70", "https://cert-portal.siemens.com/productcert/pdf/ssa-637483.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=122a19ab48091c657f7cb1fb3af9fc07bd557bbf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=8252ee4d90f3f2004d3d0aeeed003ad49c9a7807", "https://kb.pulsesecure.net/articles/Pulse_Security_Advisories/SA44846", "https://security.gentoo.org/glsa/202103-03", "https://security.netapp.com/advisory/ntap-20210219-0009/", "https://security.netapp.com/advisory/ntap-20210513-0002/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://support.apple.com/kb/HT212528", "https://support.apple.com/kb/HT212529", "https://support.apple.com/kb/HT212534", "https://www.debian.org/security/2021/dsa-4855", "https://www.openssl.org/news/secadv/20210216.txt", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://www.tenable.com/security/tns-2021-03", "https://www.tenable.com/security/tns-2021-09"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.10+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.19.9+0"]

[[jlsec_sources]]
id = "CVE-2021-23841"
imported = 2025-09-23T21:56:31.021Z
modified = 2024-11-21T05:51:55.460Z
published = 2021-02-16T17:15:13.377Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-23841"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-23841"
```

# The OpenSSL public API function X509*issuer*and*serial*hash() attempts to create a unique hash value...

The OpenSSL public API function X509*issuer*and*serial*hash() attempts to create a unique hash value based on the issuer and serial number data contained within an X509 certificate. However it fails to correctly handle any errors that may occur while parsing the issuer field (which might occur if the issuer field is maliciously constructed). This may subsequently result in a NULL pointer deref and a crash leading to a potential denial of service attack. The function X509*issuer*and*serial*hash() is never directly called by OpenSSL itself so applications are only vulnerable if they use this function directly and they use it on certificates that may have been obtained from untrusted sources. OpenSSL versions 1.1.1i and below are affected by this issue. Users of these versions should upgrade to OpenSSL 1.1.1j. OpenSSL versions 1.0.2x and below are affected by this issue. However OpenSSL 1.0.2 is out of support and no longer receiving public updates. Premium support customers of OpenSSL 1.0.2 should upgrade to 1.0.2y. Other users should upgrade to 1.1.1j. Fixed in OpenSSL 1.1.1j (Affected 1.1.1-1.1.1i). Fixed in OpenSSL 1.0.2y (Affected 1.0.2-1.0.2x).

