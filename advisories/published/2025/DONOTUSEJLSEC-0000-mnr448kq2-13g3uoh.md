```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kq2-13g3uoh"
modified = 2025-09-23T03:04:04.586Z
upstream = ["CVE-2023-52355"]
references = ["https://access.redhat.com/security/cve/CVE-2023-52355", "https://bugzilla.redhat.com/show_bug.cgi?id=2251326", "https://gitlab.com/libtiff/libtiff/-/issues/621", "https://access.redhat.com/security/cve/CVE-2023-52355", "https://bugzilla.redhat.com/show_bug.cgi?id=2251326", "https://gitlab.com/libtiff/libtiff/-/issues/621"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.6.0+0"]

[database_specific.source]
id = "CVE-2023-52355"
modified = "2024-11-21T08:39:38.020Z"
published = "2024-01-25T20:15:38.353Z"
imported = "2025-09-23T03:04:04.586Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-52355"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-52355"
```

# An out-of-memory flaw was found in libtiff that could be triggered by passing a crafted tiff file to...

An out-of-memory flaw was found in libtiff that could be triggered by passing a crafted tiff file to the TIFFRasterScanlineSize64() API. This flaw allows a remote attacker to cause a denial of service via a crafted input with a size smaller than 379 KB.

