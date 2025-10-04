```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkeshyc-xh3dy7"
modified = 2025-10-04T12:43:49.092Z
upstream = ["CVE-2021-46666"]
references = ["https://jira.mariadb.org/browse/MDEV-25635", "https://mariadb.com/kb/en/security/", "https://security.netapp.com/advisory/ntap-20220221-0002/", "https://jira.mariadb.org/browse/MDEV-25635", "https://mariadb.com/kb/en/security/", "https://security.netapp.com/advisory/ntap-20220221-0002/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-46666"
imported = 2025-10-04T12:43:49.092Z
modified = 2024-11-21T06:34:33.757Z
published = 2022-02-01T02:15:07.027Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-46666"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-46666"
```

# MariaDB before 10.6.2 allows an application crash because of mishandling of a pushdown from a HAVING...

MariaDB before 10.6.2 allows an application crash because of mishandling of a pushdown from a HAVING clause to a WHERE clause.

