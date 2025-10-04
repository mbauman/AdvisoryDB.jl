```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkfe1ur-k74qim"
modified = 2025-10-04T13:00:34.659Z
upstream = ["CVE-2022-31624"]
references = ["https://github.com/MariaDB/server/commit/d627d00b13ab2f2c0954ea7b77202470cb102944", "https://jira.mariadb.org/browse/MDEV-26556?filter=-2", "https://security.netapp.com/advisory/ntap-20220707-0006/", "https://github.com/MariaDB/server/commit/d627d00b13ab2f2c0954ea7b77202470cb102944", "https://jira.mariadb.org/browse/MDEV-26556?filter=-2", "https://security.netapp.com/advisory/ntap-20220707-0006/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-31624"
imported = 2025-10-04T13:00:34.659Z
modified = 2024-11-21T07:04:52.720Z
published = 2022-05-25T21:15:08.700Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-31624"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-31624"
```

# MariaDB Server before 10.7 is vulnerable to Denial of Service

MariaDB Server before 10.7 is vulnerable to Denial of Service. While executing the plugin/server_audit/server_audit.c method log_statement_ex, the held lock lock_bigbuffer is not released correctly, which allows local users to trigger a denial of service due to the deadlock.

