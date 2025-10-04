```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkesj0t-1l350p7"
modified = 2025-10-04T12:43:50.477Z
upstream = ["CVE-2022-27385"]
references = ["https://jira.mariadb.org/browse/MDEV-26415", "https://security.netapp.com/advisory/ntap-20220526-0008/", "https://jira.mariadb.org/browse/MDEV-26415", "https://security.netapp.com/advisory/ntap-20220526-0008/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-27385"
imported = 2025-10-04T12:43:50.477Z
modified = 2024-11-21T06:55:40.497Z
published = 2022-04-12T20:15:08.837Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-27385"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-27385"
```

# An issue in the component Used_tables_and_const_cache::used_tables_and_const_cache_join of MariaDB S...

An issue in the component Used_tables_and_const_cache::used_tables_and_const_cache_join of MariaDB Server v10.7 and below was discovered to allow attackers to cause a Denial of Service (DoS) via specially crafted SQL statements.

