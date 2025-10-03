```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrioygiq-1ygabmh"
modified = 2025-10-03T07:52:50.978Z
upstream = ["CVE-2022-27449"]
references = ["https://jira.mariadb.org/browse/MDEV-28089", "https://lists.debian.org/debian-lts-announce/2022/09/msg00023.html", "https://security.netapp.com/advisory/ntap-20220526-0006/", "https://jira.mariadb.org/browse/MDEV-28089", "https://lists.debian.org/debian-lts-announce/2022/09/msg00023.html", "https://security.netapp.com/advisory/ntap-20220526-0006/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-27449"
imported = 2025-10-03T07:52:50.978Z
modified = 2024-11-21T06:55:45.413Z
published = 2022-04-14T13:15:11.990Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-27449"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-27449"
```

# MariaDB Server v10.9 and below was discovered to contain a segmentation fault via the component sql/...

MariaDB Server v10.9 and below was discovered to contain a segmentation fault via the component sql/item_func.cc:148.

