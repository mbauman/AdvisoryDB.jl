```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrioyesb-1bekrhs"
modified = 2025-10-03T07:52:48.731Z
upstream = ["CVE-2017-15945"]
references = ["https://bugs.gentoo.org/630822", "https://security.gentoo.org/glsa/201711-04", "https://bugs.gentoo.org/630822", "https://security.gentoo.org/glsa/201711-04"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2017-15945"
imported = 2025-10-03T07:52:48.731Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-10-27T21:29:00.310Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-15945"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-15945"
```

# The installation scripts in the Gentoo dev-db/mysql, dev-db/mariadb, dev-db/percona-server, dev-db/m...

The installation scripts in the Gentoo dev-db/mysql, dev-db/mariadb, dev-db/percona-server, dev-db/mysql-cluster, and dev-db/mariadb-galera packages before 2017-09-29 have chown calls for user-writable directory trees, which allows local users to gain privileges by leveraging access to the mysql account for creation of a link.

