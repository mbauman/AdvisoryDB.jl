```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-32"
modified = 2025-09-26T13:32:05.000Z
published = 2025-09-23T22:07:20.251Z
upstream = ["CVE-2019-1551"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00030.html", "http://packetstormsecurity.com/files/155754/Slackware-Security-Advisory-openssl-Updates.html", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=419102400a2811582a7a3d4a4e317d72e5ce0a8f", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=f1c5eea8a817075d31e43f5876993c6710238c98", "https://lists.debian.org/debian-lts-announce/2022/03/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DDHOAATPWJCXRNFMJ2SASDBBNU5RJONY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EXDDAOWSAIEFQNBHWYE6PPYFV4QXGMCD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XVEP3LAK4JSPRXFO4QF4GG2IVXADV3SO/", "https://seclists.org/bugtraq/2019/Dec/39", "https://seclists.org/bugtraq/2019/Dec/46", "https://security.gentoo.org/glsa/202004-10", "https://security.netapp.com/advisory/ntap-20191210-0001/", "https://usn.ubuntu.com/4376-1/", "https://usn.ubuntu.com/4504-1/", "https://www.debian.org/security/2019/dsa-4594", "https://www.debian.org/security/2021/dsa-4855", "https://www.openssl.org/news/secadv/20191206.txt", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpujan2021.html", "https://www.oracle.com/security-alerts/cpujul2020.html", "https://www.tenable.com/security/tns-2019-09", "https://www.tenable.com/security/tns-2020-03", "https://www.tenable.com/security/tns-2020-11", "https://www.tenable.com/security/tns-2021-10", "http://lists.opensuse.org/opensuse-security-announce/2020-01/msg00030.html", "http://packetstormsecurity.com/files/155754/Slackware-Security-Advisory-openssl-Updates.html", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=419102400a2811582a7a3d4a4e317d72e5ce0a8f", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=f1c5eea8a817075d31e43f5876993c6710238c98", "https://lists.debian.org/debian-lts-announce/2022/03/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DDHOAATPWJCXRNFMJ2SASDBBNU5RJONY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EXDDAOWSAIEFQNBHWYE6PPYFV4QXGMCD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XVEP3LAK4JSPRXFO4QF4GG2IVXADV3SO/", "https://seclists.org/bugtraq/2019/Dec/39", "https://seclists.org/bugtraq/2019/Dec/46", "https://security.gentoo.org/glsa/202004-10", "https://security.netapp.com/advisory/ntap-20191210-0001/", "https://usn.ubuntu.com/4376-1/", "https://usn.ubuntu.com/4504-1/", "https://www.debian.org/security/2019/dsa-4594", "https://www.debian.org/security/2021/dsa-4855", "https://www.openssl.org/news/secadv/20191206.txt", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpujan2021.html", "https://www.oracle.com/security-alerts/cpujul2020.html", "https://www.tenable.com/security/tns-2019-09", "https://www.tenable.com/security/tns-2020-03", "https://www.tenable.com/security/tns-2020-11", "https://www.tenable.com/security/tns-2021-10"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.1+2"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.19.9+0"]

[[jlsec_sources]]
id = "CVE-2019-1551"
imported = 2025-09-23T21:56:30.609Z
modified = 2024-11-21T04:36:48.500Z
published = 2019-12-06T18:15:12.840Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-1551"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-1551"
```

# There is an overflow bug in the x64_64 Montgomery squaring procedure used in exponentiation with 512...

There is an overflow bug in the x64*64 Montgomery squaring procedure used in exponentiation with 512-bit moduli. No EC algorithms are affected. Analysis suggests that attacks against 2-prime RSA1024, 3-prime RSA1536, and DSA1024 as a result of this defect would be very difficult to perform and are not believed likely. Attacks against DH512 are considered just feasible. However, for an attack the target would have to re-use the DH512 private key, which is not recommended anyway. Also applications directly using the low level API BN*mod*exp may be affected if they use BN*FLG_CONSTTIME. Fixed in OpenSSL 1.1.1e (Affected 1.1.1-1.1.1d). Fixed in OpenSSL 1.0.2u (Affected 1.0.2-1.0.2t).

