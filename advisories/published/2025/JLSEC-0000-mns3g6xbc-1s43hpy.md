```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3g6xbc-1s43hpy"
modified = 2025-10-17T20:30:39.144Z
upstream = ["CVE-2022-34903"]
references = ["http://www.openwall.com/lists/oss-security/2022/07/02/1", "https://bugs.debian.org/1014157", "https://dev.gnupg.org/T6027", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FRLWJQ76A4UKHI3Q36BKSJKS4LFLQO33/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NPTAR76EIZY7NQFENSOZO7U473257OVZ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VN63GBTMRWO36Y7BKA2WQHROAKCXKCBL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VU64FUVG2PRZBSHFOQRSP7KDVEIZ23OS/", "https://security.netapp.com/advisory/ntap-20220826-0005/", "https://www.debian.org/security/2022/dsa-5174", "https://www.openwall.com/lists/oss-security/2022/06/30/1", "http://www.openwall.com/lists/oss-security/2022/07/02/1", "https://bugs.debian.org/1014157", "https://dev.gnupg.org/T6027", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FRLWJQ76A4UKHI3Q36BKSJKS4LFLQO33/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NPTAR76EIZY7NQFENSOZO7U473257OVZ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VN63GBTMRWO36Y7BKA2WQHROAKCXKCBL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VU64FUVG2PRZBSHFOQRSP7KDVEIZ23OS/", "https://security.netapp.com/advisory/ntap-20220826-0005/", "https://www.debian.org/security/2022/dsa-5174", "https://www.openwall.com/lists/oss-security/2022/06/30/1"]

[[affected]]
pkg = "GnuPG_jll"
ranges = ["< 2.4.7+0"]

[[jlsec_sources]]
id = "CVE-2022-34903"
imported = 2025-10-17T20:30:39.144Z
modified = 2024-11-21T07:10:24.240Z
published = 2022-07-01T22:15:08.120Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-34903"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-34903"
```

# GnuPG through 2.3.6, in unusual situations where an attacker possesses any secret-key information fr...

GnuPG through 2.3.6, in unusual situations where an attacker possesses any secret-key information from a victim's keyring and other constraints (e.g., use of GPGME) are met, allows signature forgery via injection into the status line.

