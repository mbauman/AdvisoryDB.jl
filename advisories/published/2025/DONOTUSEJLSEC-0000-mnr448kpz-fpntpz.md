```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpz-fpntpz"
modified = 2025-09-23T03:04:04.583Z
upstream = ["CVE-2022-40090"]
references = ["https://gitlab.com/libtiff/libtiff/-/issues/455", "https://gitlab.com/libtiff/libtiff/-/merge_requests/386", "https://gitlab.com/libtiff/libtiff/-/issues/455", "https://gitlab.com/libtiff/libtiff/-/merge_requests/386"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-40090"
modified = "2024-11-21T07:20:50.103Z"
published = "2023-08-22T19:16:23.943Z"
imported = "2025-09-23T03:04:04.583Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-40090"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-40090"
```

# An issue was discovered in function TIFFReadDirectory libtiff before 4.4.0 allows attackers to cause...

An issue was discovered in function TIFFReadDirectory libtiff before 4.4.0 allows attackers to cause a denial of service via crafted TIFF file.

