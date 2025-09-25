```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-35"
modified = 2025-09-23T22:07:20.259Z
published = 2025-09-23T22:07:20.259Z
upstream = ["CVE-2021-23839"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-637483.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=30919ab80a478f2d81f2e9acdcca3fa4740cd547", "https://kb.pulsesecure.net/articles/Pulse_Security_Advisories/SA44846", "https://security.netapp.com/advisory/ntap-20210219-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.openssl.org/news/secadv/20210216.txt", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://cert-portal.siemens.com/productcert/pdf/ssa-637483.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=30919ab80a478f2d81f2e9acdcca3fa4740cd547", "https://kb.pulsesecure.net/articles/Pulse_Security_Advisories/SA44846", "https://security.netapp.com/advisory/ntap-20210219-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.openssl.org/news/secadv/20210216.txt", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html"]

[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.19.9+0"]

[[jlsec_sources]]
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-23839"
id = "CVE-2021-23839"
imported = 2025-09-23T21:56:31.019Z
modified = 2024-11-21T05:51:55.003Z
published = 2021-02-16T17:15:13.190Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-23839"
```

# OpenSSL 1.0.2 supports SSLv2

OpenSSL 1.0.2 supports SSLv2. If a client attempts to negotiate SSLv2 with a server that is configured to support both SSLv2 and more recent SSL and TLS versions then a check is made for a version rollback attack when unpadding an RSA signature. Clients that support SSL or TLS versions greater than SSLv2 are supposed to use a special form of padding. A server that supports greater than SSLv2 is supposed to reject connection attempts from a client where this special form of padding is present, because this indicates that a version rollback has occurred (i.e. both client and server support greater than SSLv2, and yet this is the version that is being requested). The implementation of this padding check inverted the logic so that the connection attempt is accepted if the padding is present, and rejected if it is absent. This means that such as server will accept a connection if a version rollback attack has occurred. Further the server will erroneously reject a connection if a normal SSLv2 connection attempt is made. Only OpenSSL 1.0.2 servers from version 1.0.2s to 1.0.2x are affected by this issue. In order to be vulnerable a 1.0.2 server must: 1) have configured SSLv2 support at compile time (this is off by default), 2) have configured SSLv2 support at runtime (this is off by default), 3) have configured SSLv2 ciphersuites (these are not in the default ciphersuite list) OpenSSL 1.1.1 does not have SSLv2 support and therefore is not vulnerable to this issue. The underlying error is in the implementation of the RSA*padding*check*SSLv23() function. This also affects the RSA*SSLV23*PADDING padding mode used by various other functions. Although 1.1.1 does not support SSLv2 the RSA*padding*check*SSLv23() function still exists, as does the RSA*SSLV23*PADDING padding mode. Applications that directly call that function or use that padding mode will encounter this issue. However since there is no support for the SSLv2 protocol in 1.1.1 this is considered a bug and not a security issue in that version. OpenSSL 1.0.2 is out of support and no longer receiving public updates. Premium support customers of OpenSSL 1.0.2 should upgrade to 1.0.2y. Other users should upgrade to 1.1.1j. Fixed in OpenSSL 1.0.2y (Affected 1.0.2s-1.0.2x).

