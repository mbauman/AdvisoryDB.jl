```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaap-1wb7mfg"
modified = 2025-09-29T17:46:20.449Z
upstream = ["CVE-2022-40090"]
references = ["https://gitlab.com/libtiff/libtiff/-/issues/455", "https://gitlab.com/libtiff/libtiff/-/merge_requests/386", "https://gitlab.com/libtiff/libtiff/-/issues/455", "https://gitlab.com/libtiff/libtiff/-/merge_requests/386"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[[jlsec_sources]]
id = "CVE-2022-40090"
imported = 2025-09-29T17:46:20.449Z
modified = 2024-11-21T07:20:50.103Z
published = 2023-08-22T19:16:23.943Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-40090"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-40090"
```

# An issue was discovered in function TIFFReadDirectory libtiff before 4.4.0 allows attackers to cause...

An issue was discovered in function TIFFReadDirectory libtiff before 4.4.0 allows attackers to cause a denial of service via crafted TIFF file.

