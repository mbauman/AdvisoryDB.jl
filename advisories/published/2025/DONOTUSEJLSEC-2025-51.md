```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-51"
modified = 2025-10-06T13:10:23.999Z
published = 2025-09-23T22:07:20.364Z
upstream = ["CVE-2023-0464"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=2017771e2db3e2b96f89bbe8766c3209f6a99545", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=2dcd4f1e3115f38cefa43e3efbe9b801c27e642e", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=879f7080d7e141f415c79eaa3a8ac4a3dad0348b", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=959c59c7a0164117e7f8366466a32bb1f8d77ff1", "https://lists.debian.org/debian-lts-announce/2023/06/msg00011.html", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.couchbase.com/alerts/", "https://www.debian.org/security/2023/dsa-5417", "https://www.openssl.org/news/secadv/20230322.txt", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=2017771e2db3e2b96f89bbe8766c3209f6a99545", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=2dcd4f1e3115f38cefa43e3efbe9b801c27e642e", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=879f7080d7e141f415c79eaa3a8ac4a3dad0348b", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=959c59c7a0164117e7f8366466a32bb1f8d77ff1", "https://lists.debian.org/debian-lts-announce/2023/06/msg00011.html", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230406-0006/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.couchbase.com/alerts/", "https://www.debian.org/security/2023/dsa-5417", "https://www.openssl.org/news/secadv/20230322.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.21+0", ">= 3.0.8+0, < 3.0.9+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2023-0464"
imported = 2025-09-23T21:56:31.094Z
modified = 2025-05-05T16:15:26.103Z
published = 2023-03-22T17:15:13.130Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-0464"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-0464"
```

# A security vulnerability has been identified in all supported versions

A security vulnerability has been identified in all supported versions

of OpenSSL related to the verification of X.509 certificate chains that include policy constraints.  Attackers may be able to exploit this vulnerability by creating a malicious certificate chain that triggers exponential use of computational resources, leading to a denial-of-service (DoS) attack on affected systems.

Policy processing is disabled by default but can be enabled by passing the `-policy' argument to the command line utilities or by calling the`X509*VERIFY*PARAM*set1*policies()' function.

