```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kq0-vocmbp"
modified = 2025-09-23T03:04:04.584Z
upstream = ["CVE-2023-40745"]
references = ["https://access.redhat.com/errata/RHSA-2024:2289", "https://access.redhat.com/security/cve/CVE-2023-40745", "https://bugzilla.redhat.com/show_bug.cgi?id=2235265", "https://access.redhat.com/errata/RHSA-2024:2289", "https://access.redhat.com/security/cve/CVE-2023-40745", "https://bugzilla.redhat.com/show_bug.cgi?id=2235265", "https://security.netapp.com/advisory/ntap-20231110-0005/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.6.0+0"]

[database_specific.source]
id = "CVE-2023-40745"
modified = "2024-11-21T08:20:03.463Z"
published = "2023-10-05T19:15:11.260Z"
imported = "2025-09-23T03:04:04.584Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-40745"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-40745"
```

# LibTIFF is vulnerable to an integer overflow

LibTIFF is vulnerable to an integer overflow. This flaw allows remote attackers to cause a denial of service (application crash) or possibly execute an arbitrary code via a crafted tiff image, which triggers a heap-based buffer overflow.

