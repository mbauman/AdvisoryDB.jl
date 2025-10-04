```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkfe1lw-19s80eu"
modified = 2025-10-04T13:00:34.340Z
upstream = ["CVE-2022-31622"]
references = ["https://github.com/MariaDB/server/commit/e1eb39a446c30b8459c39fd7f2ee1c55a36e97d2", "https://jira.mariadb.org/browse/MDEV-26561", "https://jira.mariadb.org/browse/MDEV-26561?filter=-2", "https://jira.mariadb.org/browse/MDEV-26574", "https://security.netapp.com/advisory/ntap-20220707-0006/", "https://github.com/MariaDB/server/commit/e1eb39a446c30b8459c39fd7f2ee1c55a36e97d2", "https://jira.mariadb.org/browse/MDEV-26561", "https://jira.mariadb.org/browse/MDEV-26561?filter=-2", "https://jira.mariadb.org/browse/MDEV-26574", "https://security.netapp.com/advisory/ntap-20220707-0006/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-31622"
imported = 2025-10-04T13:00:34.340Z
modified = 2024-11-21T07:04:52.393Z
published = 2022-05-25T21:15:08.617Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-31622"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-31622"
```

# MariaDB Server before 10.7 is vulnerable to Denial of Service

MariaDB Server before 10.7 is vulnerable to Denial of Service. In extra/mariabackup/ds_compress.cc, when an error occurs (pthread_create returns a nonzero value) while executing the method create_worker_threads, the held lock is not released correctly, which allows local users to trigger a denial of service due to the deadlock. Note: The vendor argues this is just an improper locking bug and not a vulnerability with adverse effects.

