```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpz-9c8j3r"
modified = 2025-09-23T03:04:04.583Z
upstream = ["CVE-2023-3576"]
references = ["https://access.redhat.com/errata/RHSA-2023:6575", "https://access.redhat.com/security/cve/CVE-2023-3576", "https://bugzilla.redhat.com/show_bug.cgi?id=2219340", "https://access.redhat.com/errata/RHSA-2023:6575", "https://access.redhat.com/security/cve/CVE-2023-3576", "https://bugzilla.redhat.com/show_bug.cgi?id=2219340", "https://lists.debian.org/debian-lts-announce/2024/03/msg00011.html"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2023-3576"
modified = "2024-11-21T08:17:35.157Z"
published = "2023-10-04T19:15:10.340Z"
imported = "2025-09-23T03:04:04.583Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-3576"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-3576"
```

# A memory leak flaw was found in Libtiff's tiffcrop utility

A memory leak flaw was found in Libtiff's tiffcrop utility. This issue occurs when tiffcrop operates on a TIFF image file, allowing an attacker to pass a crafted TIFF image file to tiffcrop utility, which causes this memory leak issue, resulting an application crash, eventually leading to a denial of service.

