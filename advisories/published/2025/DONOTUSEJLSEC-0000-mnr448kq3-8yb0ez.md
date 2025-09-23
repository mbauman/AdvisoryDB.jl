```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kq3-8yb0ez"
modified = 2025-09-23T03:04:04.587Z
upstream = ["CVE-2024-7006"]
references = ["https://access.redhat.com/errata/RHSA-2024:6360", "https://access.redhat.com/errata/RHSA-2024:8833", "https://access.redhat.com/errata/RHSA-2024:8914", "https://access.redhat.com/security/cve/CVE-2024-7006", "https://bugzilla.redhat.com/show_bug.cgi?id=2302996", "https://security.netapp.com/advisory/ntap-20240920-0001/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.7.0+0"]

[database_specific.source]
id = "CVE-2024-7006"
modified = "2024-11-21T09:50:44.560Z"
published = "2024-08-12T13:38:40.577Z"
imported = "2025-09-23T03:04:04.587Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-7006"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-7006"
```

# A null pointer dereference flaw was found in Libtiff via `tif_dirinfo.c`

A null pointer dereference flaw was found in Libtiff via `tif_dirinfo.c`. This issue may allow an attacker to trigger memory allocation failures through certain means, such as restricting the heap space size or injecting faults, causing a segmentation fault. This can cause an application crash, eventually leading to a denial of service.

