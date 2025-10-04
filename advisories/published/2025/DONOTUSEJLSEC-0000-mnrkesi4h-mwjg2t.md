```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkesi4h-mwjg2t"
modified = 2025-10-04T12:43:49.313Z
upstream = ["CVE-2021-46667"]
references = ["https://jira.mariadb.org/browse/MDEV-26350", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DKJRBYJAQCOPHSED43A3HUPNKQLDTFGD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EZFZVMJL5UDTOZMARLXQIMG3BTG6UNYW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NJ4KDAGF3H4D4BDTHRAM6ZEAJJWWMRUO/", "https://mariadb.com/kb/en/security/", "https://security.netapp.com/advisory/ntap-20220221-0002/", "https://jira.mariadb.org/browse/MDEV-26350", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DKJRBYJAQCOPHSED43A3HUPNKQLDTFGD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EZFZVMJL5UDTOZMARLXQIMG3BTG6UNYW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NJ4KDAGF3H4D4BDTHRAM6ZEAJJWWMRUO/", "https://mariadb.com/kb/en/security/", "https://security.netapp.com/advisory/ntap-20220221-0002/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-46667"
imported = 2025-10-04T12:43:49.313Z
modified = 2024-11-21T06:34:33.900Z
published = 2022-02-01T02:15:07.077Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-46667"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-46667"
```

# MariaDB before 10.6.5 has a sql_lex.cc integer overflow, leading to an application crash.

MariaDB before 10.6.5 has a sql_lex.cc integer overflow, leading to an application crash.

