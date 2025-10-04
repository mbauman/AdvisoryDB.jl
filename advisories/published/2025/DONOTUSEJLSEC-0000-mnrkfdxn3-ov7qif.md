```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkfdxn3-ov7qif"
modified = 2025-10-04T13:00:29.199Z
upstream = ["CVE-2014-0001"]
references = ["http://bazaar.launchpad.net/~maria-captains/maria/5.5/revision/2502.565.64", "http://osvdb.org/102713", "http://rhn.redhat.com/errata/RHSA-2014-0164.html", "http://rhn.redhat.com/errata/RHSA-2014-0173.html", "http://rhn.redhat.com/errata/RHSA-2014-0186.html", "http://rhn.redhat.com/errata/RHSA-2014-0189.html", "http://secunia.com/advisories/52161", "http://security.gentoo.org/glsa/glsa-201409-04.xml", "http://www.mandriva.com/security/advisories?name=MDVSA-2014:029", "http://www.osvdb.org/102714", "http://www.securityfocus.com/bid/65298", "http://www.securitytracker.com/id/1029708", "https://bugzilla.redhat.com/show_bug.cgi?id=1054592", "https://exchange.xforce.ibmcloud.com/vulnerabilities/90901", "https://mariadb.com/kb/en/mariadb-5535-changelog/", "http://bazaar.launchpad.net/~maria-captains/maria/5.5/revision/2502.565.64", "http://osvdb.org/102713", "http://rhn.redhat.com/errata/RHSA-2014-0164.html", "http://rhn.redhat.com/errata/RHSA-2014-0173.html", "http://rhn.redhat.com/errata/RHSA-2014-0186.html", "http://rhn.redhat.com/errata/RHSA-2014-0189.html", "http://secunia.com/advisories/52161", "http://security.gentoo.org/glsa/glsa-201409-04.xml", "http://www.mandriva.com/security/advisories?name=MDVSA-2014:029", "http://www.osvdb.org/102714", "http://www.securityfocus.com/bid/65298", "http://www.securitytracker.com/id/1029708", "https://bugzilla.redhat.com/show_bug.cgi?id=1054592", "https://exchange.xforce.ibmcloud.com/vulnerabilities/90901", "https://mariadb.com/kb/en/mariadb-5535-changelog/"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2014-0001"
imported = 2025-10-04T13:00:29.199Z
modified = 2025-04-11T00:51:21.963Z
published = 2014-01-31T23:55:04.503Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-0001"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-0001"
```

# Buffer overflow in client/mysql.cc in Oracle MySQL and MariaDB before 5.5.35 allows remote database ...

Buffer overflow in client/mysql.cc in Oracle MySQL and MariaDB before 5.5.35 allows remote database servers to cause a denial of service (crash) and possibly execute arbitrary code via a long server version string.

