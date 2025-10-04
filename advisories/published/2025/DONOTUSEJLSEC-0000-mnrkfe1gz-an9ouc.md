```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkfe1gz-an9ouc"
modified = 2025-10-04T13:00:34.163Z
upstream = ["CVE-2022-31621"]
references = ["https://github.com/MariaDB/server/commit/b1351c15946349f9daa7e5297fb2ac6f3139e4a8", "https://jira.mariadb.org/browse/MDEV-26561", "https://jira.mariadb.org/browse/MDEV-26574", "https://jira.mariadb.org/browse/MDEV-26574?filter=-2", "https://security.netapp.com/advisory/ntap-20220707-0006/", "https://github.com/MariaDB/server/commit/b1351c15946349f9daa7e5297fb2ac6f3139e4a8", "https://jira.mariadb.org/browse/MDEV-26561", "https://jira.mariadb.org/browse/MDEV-26574", "https://jira.mariadb.org/browse/MDEV-26574?filter=-2", "https://security.netapp.com/advisory/ntap-20220707-0006/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-31621"
imported = 2025-10-04T13:00:34.163Z
modified = 2024-11-21T07:04:52.150Z
published = 2022-05-25T21:15:08.573Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-31621"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-31621"
```

# MariaDB Server before 10.7 is vulnerable to Denial of Service

MariaDB Server before 10.7 is vulnerable to Denial of Service. In extra/mariabackup/ds_xbstream.cc, when an error occurs (stream_ctxt->dest_file == NULL) while executing the method xbstream_open, the held lock is not released correctly, which allows local users to trigger a denial of service due to the deadlock. Note: The vendor argues this is just an improper locking bug and not a vulnerability with adverse effects.

