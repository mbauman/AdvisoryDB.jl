```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-53"
modified = 2025-09-26T19:46:16.213Z
published = 2025-09-23T22:07:20.390Z
upstream = ["CVE-2023-0466"]
references = ["http://www.openwall.com/lists/oss-security/2023/09/28/4", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0d16b7e99aafc0b4a6d729eec65a411a7e025f0a", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=51e8a84ce742db0f6c70510d0159dad8f7825908", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=73398dea26de9899fb4baa94098ad0a61f435c72", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=fc814a30fc4f0bc54fcea7d9a7462f5457aab061", "https://lists.debian.org/debian-lts-announce/2023/06/msg00011.html", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230414-0001/", "https://www.debian.org/security/2023/dsa-5417", "https://www.openssl.org/news/secadv/20230328.txt", "http://www.openwall.com/lists/oss-security/2023/09/28/4", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0d16b7e99aafc0b4a6d729eec65a411a7e025f0a", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=51e8a84ce742db0f6c70510d0159dad8f7825908", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=73398dea26de9899fb4baa94098ad0a61f435c72", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=fc814a30fc4f0bc54fcea7d9a7462f5457aab061", "https://lists.debian.org/debian-lts-announce/2023/06/msg00011.html", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230414-0001/", "https://www.debian.org/security/2023/dsa-5417", "https://www.openssl.org/news/secadv/20230328.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.21+0", ">= 3.0.8+0, < 3.0.9+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2023-0466"
imported = 2025-09-23T21:56:31.096Z
modified = 2025-02-19T18:15:22.177Z
published = 2023-03-28T15:15:06.880Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-0466"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-0466"
```

# The function X509*VERIFY*PARAM*add0*policy() is documented to implicitly enable the certificate poli...

The function X509*VERIFY*PARAM*add0*policy() is documented to implicitly enable the certificate policy check when doing certificate verification. However the implementation of the function does not enable the check which allows certificates with invalid or incorrect policies to pass the certificate verification.

As suddenly enabling the policy check could break existing deployments it was decided to keep the existing behavior of the X509*VERIFY*PARAM*add0*policy() function.

Instead the applications that require OpenSSL to perform certificate policy check need to use X509*VERIFY*PARAM*set1*policies() or explicitly enable the policy check by calling X509*VERIFY*PARAM*set*flags() with the X509*V*FLAG*POLICY*CHECK flag argument.

Certificate policy checks are disabled by default in OpenSSL and are not commonly used by applications.

