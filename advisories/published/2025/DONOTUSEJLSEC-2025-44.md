```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-44"
modified = 2025-09-29T02:51:33.558Z
published = 2025-09-23T22:07:20.283Z
upstream = ["CVE-2022-1292"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-953464.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=1ad73b4d27bd8c1b369a3cd453681d3a4f1bb9b2", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=548d3f280a6e737673f5b61fce24bb100108dfeb", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=e5fd1728ef4c7a5bf7c7a7163ca60370460a6e23", "https://lists.debian.org/debian-lts-announce/2022/05/msg00019.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VX4KWHPMKYJL6ZLW4M5IU7E5UV5ZWJQU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZNU5M7BXMML26G3GPYKFGQYPQDRSNKDD/", "https://psirt.global.sonicwall.com/vuln-detail/SNWLID-2022-0011", "https://security.gentoo.org/glsa/202210-02", "https://security.netapp.com/advisory/ntap-20220602-0009/", "https://security.netapp.com/advisory/ntap-20220729-0004/", "https://www.debian.org/security/2022/dsa-5139", "https://www.openssl.org/news/secadv/20220503.txt", "https://www.oracle.com/security-alerts/cpujul2022.html", "https://cert-portal.siemens.com/productcert/pdf/ssa-953464.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=1ad73b4d27bd8c1b369a3cd453681d3a4f1bb9b2", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=548d3f280a6e737673f5b61fce24bb100108dfeb", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=e5fd1728ef4c7a5bf7c7a7163ca60370460a6e23", "https://gitlab.com/fraf0/cve-2022-1292-re_score-analysis", "https://lists.debian.org/debian-lts-announce/2022/05/msg00019.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VX4KWHPMKYJL6ZLW4M5IU7E5UV5ZWJQU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZNU5M7BXMML26G3GPYKFGQYPQDRSNKDD/", "https://psirt.global.sonicwall.com/vuln-detail/SNWLID-2022-0011", "https://security.gentoo.org/glsa/202210-02", "https://security.netapp.com/advisory/ntap-20220602-0009/", "https://security.netapp.com/advisory/ntap-20220729-0004/", "https://www.debian.org/security/2022/dsa-5139", "https://www.openssl.org/news/secadv/20220503.txt", "https://www.oracle.com/security-alerts/cpujul2022.html"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.16+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.21.4+0"]

[[jlsec_sources]]
id = "CVE-2022-1292"
imported = 2025-09-23T21:56:31.081Z
modified = 2025-08-13T14:15:28.717Z
published = 2022-05-03T16:15:18.823Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1292"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1292"
```

# The c_rehash script does not properly sanitise shell metacharacters to prevent command injection

The c*rehash script does not properly sanitise shell metacharacters to prevent command injection. This script is distributed by some operating systems in a manner where it is automatically executed. On such operating systems, an attacker could execute arbitrary commands with the privileges of the script. Use of the c*rehash script is considered obsolete and should be replaced by the OpenSSL rehash command line tool. Fixed in OpenSSL 3.0.3 (Affected 3.0.0,3.0.1,3.0.2). Fixed in OpenSSL 1.1.1o (Affected 1.1.1-1.1.1n). Fixed in OpenSSL 1.0.2ze (Affected 1.0.2-1.0.2zd).

