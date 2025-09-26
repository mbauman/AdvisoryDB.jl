```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-46"
modified = 2025-09-26T19:24:29.391Z
published = 2025-09-23T22:07:20.288Z
upstream = ["CVE-2022-2097"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-332410.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=919925673d6c9cfed3c1085497f5dfbbed5fc431", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=a98f339ddd7e8f487d6e0088d4a9a42324885a93", "https://lists.debian.org/debian-lts-announce/2023/02/msg00019.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/R6CK57NBQFTPUMXAPJURCGXUYT76NQAK/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V6567JERRHHJW2GNGJGKDRNHR7SNPZK7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VCMNWKERPBKOEBNL7CLTTX3ZZCZLH7XA/", "https://security.gentoo.org/glsa/202210-02", "https://security.netapp.com/advisory/ntap-20220715-0011/", "https://security.netapp.com/advisory/ntap-20230420-0008/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.debian.org/security/2023/dsa-5343", "https://www.openssl.org/news/secadv/20220705.txt", "https://cert-portal.siemens.com/productcert/pdf/ssa-332410.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=919925673d6c9cfed3c1085497f5dfbbed5fc431", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=a98f339ddd7e8f487d6e0088d4a9a42324885a93", "https://lists.debian.org/debian-lts-announce/2023/02/msg00019.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/R6CK57NBQFTPUMXAPJURCGXUYT76NQAK/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V6567JERRHHJW2GNGJGKDRNHR7SNPZK7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VCMNWKERPBKOEBNL7CLTTX3ZZCZLH7XA/", "https://security.gentoo.org/glsa/202210-02", "https://security.netapp.com/advisory/ntap-20220715-0011/", "https://security.netapp.com/advisory/ntap-20230420-0008/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.debian.org/security/2023/dsa-5343", "https://www.openssl.org/news/secadv/20220705.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.17+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = [">= 1.19.9+0, < 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2022-2097"
imported = 2025-09-23T21:56:31.085Z
modified = 2024-11-21T07:00:18.757Z
published = 2022-07-05T11:15:08.340Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2097"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2097"
```

# AES OCB mode for 32-bit x86 platforms using the AES-NI assembly optimised implementation will not en...

AES OCB mode for 32-bit x86 platforms using the AES-NI assembly optimised implementation will not encrypt the entirety of the data under some circumstances. This could reveal sixteen bytes of data that was preexisting in the memory that wasn't written. In the special case of "in place" encryption, sixteen bytes of the plaintext would be revealed. Since OpenSSL does not support OCB based cipher suites for TLS and DTLS, they are both unaffected. Fixed in OpenSSL 3.0.5 (Affected 3.0.0-3.0.4). Fixed in OpenSSL 1.1.1q (Affected 1.1.1-1.1.1p).

