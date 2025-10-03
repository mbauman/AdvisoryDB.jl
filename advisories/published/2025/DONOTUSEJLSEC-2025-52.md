```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-52"
modified = 2025-10-03T10:34:06.764Z
published = 2025-09-23T22:07:20.387Z
upstream = ["CVE-2023-0465"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=10325176f3d3e98c6e2b3bf5ab1e3b334de6947a", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=1dd43e0709fece299b15208f36cc7c76209ba0bb", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=b013765abfa80036dc779dd0e50602c57bb3bf95", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=facfb1ab745646e97a1920977ae4a9965ea61d5c", "https://lists.debian.org/debian-lts-announce/2023/06/msg00011.html", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230414-0001/", "https://www.debian.org/security/2023/dsa-5417", "https://www.openssl.org/news/secadv/20230328.txt", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=10325176f3d3e98c6e2b3bf5ab1e3b334de6947a", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=1dd43e0709fece299b15208f36cc7c76209ba0bb", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=b013765abfa80036dc779dd0e50602c57bb3bf95", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=facfb1ab745646e97a1920977ae4a9965ea61d5c", "https://lists.debian.org/debian-lts-announce/2023/06/msg00011.html", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230414-0001/", "https://www.debian.org/security/2023/dsa-5417", "https://www.openssl.org/news/secadv/20230328.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.21+0", ">= 3.0.8+0, < 3.0.9+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2023-0465"
imported = 2025-09-23T21:56:31.095Z
modified = 2025-02-18T21:15:13.877Z
published = 2023-03-28T15:15:06.820Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-0465"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-0465"
```

# Applications that use a non-default option when verifying certificates may be vulnerable to an attac...

Applications that use a non-default option when verifying certificates may be vulnerable to an attack from a malicious CA to circumvent certain checks.

Invalid certificate policies in leaf certificates are silently ignored by OpenSSL and other certificate policy checks are skipped for that certificate. A malicious CA could use this to deliberately assert invalid certificate policies in order to circumvent policy checking on the certificate altogether.

Policy processing is disabled by default but can be enabled by passing the `-policy' argument to the command line utilities or by calling the`X509*VERIFY*PARAM*set1*policies()' function.

