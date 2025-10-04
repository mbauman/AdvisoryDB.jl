```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkfe20n-wmata7"
modified = 2025-10-04T13:00:34.871Z
upstream = ["CVE-2023-5157"]
references = ["https://access.redhat.com/errata/RHSA-2023:5259", "https://access.redhat.com/errata/RHSA-2023:5683", "https://access.redhat.com/errata/RHSA-2023:5684", "https://access.redhat.com/errata/RHSA-2023:6821", "https://access.redhat.com/errata/RHSA-2023:6822", "https://access.redhat.com/errata/RHSA-2023:6883", "https://access.redhat.com/errata/RHSA-2023:7633", "https://access.redhat.com/security/cve/CVE-2023-5157", "https://bugzilla.redhat.com/show_bug.cgi?id=2240246", "https://access.redhat.com/errata/RHSA-2023:5683", "https://access.redhat.com/errata/RHSA-2023:5684", "https://access.redhat.com/errata/RHSA-2023:6821", "https://access.redhat.com/errata/RHSA-2023:6822", "https://access.redhat.com/errata/RHSA-2023:6883", "https://access.redhat.com/errata/RHSA-2023:7633", "https://access.redhat.com/security/cve/CVE-2023-5157", "https://bugzilla.redhat.com/show_bug.cgi?id=2240246"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-5157"
imported = 2025-10-04T13:00:34.871Z
modified = 2025-10-01T15:15:41.800Z
published = 2023-09-27T15:19:41.807Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-5157"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-5157"
```

# A vulnerability was found in MariaDB

A vulnerability was found in MariaDB. An OpenVAS port scan on ports 3306 and 4567 allows a malicious remote client to cause a denial of service.

