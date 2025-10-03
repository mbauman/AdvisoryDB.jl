```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrioyfs3-n30xdu"
modified = 2025-10-03T07:52:50.019Z
upstream = ["CVE-2021-46669"]
references = ["https://jira.mariadb.org/browse/MDEV-25638", "https://lists.debian.org/debian-lts-announce/2022/09/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FRJCSPQHYPKTWXXZVDMY6JAHZJQ4TZ5X/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KHEOTQ63YWC3PGHGDFGS7AZIEXCGOPWH/", "https://mariadb.com/kb/en/security/", "https://security.netapp.com/advisory/ntap-20220221-0002/", "https://jira.mariadb.org/browse/MDEV-25638", "https://lists.debian.org/debian-lts-announce/2022/09/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FRJCSPQHYPKTWXXZVDMY6JAHZJQ4TZ5X/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KHEOTQ63YWC3PGHGDFGS7AZIEXCGOPWH/", "https://mariadb.com/kb/en/security/", "https://security.netapp.com/advisory/ntap-20220221-0002/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-46669"
imported = 2025-10-03T07:52:50.019Z
modified = 2024-11-21T06:34:34.323Z
published = 2022-02-01T02:15:07.173Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-46669"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-46669"
```

# MariaDB through 10.5.9 allows attackers to trigger a convert_const_to_int use-after-free when the BI...

MariaDB through 10.5.9 allows attackers to trigger a convert_const_to_int use-after-free when the BIGINT data type is used.

