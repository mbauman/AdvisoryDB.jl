```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrioygym-p0ddib"
modified = 2025-10-03T07:52:51.550Z
upstream = ["CVE-2022-31623"]
references = ["https://github.com/MariaDB/server/commit/7c30bc38a588b22b01f11130cfe99e7f36accf94", "https://github.com/MariaDB/server/pull/1938", "https://jira.mariadb.org/browse/MDEV-26561", "https://jira.mariadb.org/browse/MDEV-26574", "https://security.netapp.com/advisory/ntap-20220707-0006/", "https://github.com/MariaDB/server/commit/7c30bc38a588b22b01f11130cfe99e7f36accf94", "https://github.com/MariaDB/server/pull/1938", "https://jira.mariadb.org/browse/MDEV-26561", "https://jira.mariadb.org/browse/MDEV-26574", "https://security.netapp.com/advisory/ntap-20220707-0006/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-31623"
imported = 2025-10-03T07:52:51.550Z
modified = 2024-11-21T07:04:52.553Z
published = 2022-05-25T21:15:08.657Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-31623"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-31623"
```

# MariaDB Server before 10.7 is vulnerable to Denial of Service

MariaDB Server before 10.7 is vulnerable to Denial of Service. In extra/mariabackup/ds_compress.cc, when an error occurs (i.e., going to the err label) while executing the method create_worker_threads, the held lock thd->ctrl_mutex is not released correctly, which allows local users to trigger a denial of service due to the deadlock. Note: The vendor argues this is just an improper locking bug and not a vulnerability with adverse effects.

