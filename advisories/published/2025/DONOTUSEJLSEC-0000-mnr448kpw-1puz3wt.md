```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpw-1puz3wt"
modified = 2025-09-23T03:04:04.580Z
upstream = ["CVE-2023-3316"]
references = ["https://gitlab.com/libtiff/libtiff/-/issues/515", "https://gitlab.com/libtiff/libtiff/-/merge_requests/468", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://research.jfrog.com/vulnerabilities/libtiff-nullderef-dos-xray-522144/", "https://gitlab.com/libtiff/libtiff/-/issues/515", "https://gitlab.com/libtiff/libtiff/-/merge_requests/468", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://research.jfrog.com/vulnerabilities/libtiff-nullderef-dos-xray-522144/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2023-3316"
modified = "2025-02-13T17:16:55.980Z"
published = "2023-06-19T12:15:09.520Z"
imported = "2025-09-23T03:04:04.580Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-3316"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-3316"
```

# A NULL pointer dereference in TIFFClose() is caused by a failure to open an output file (non-existen...

A NULL pointer dereference in TIFFClose() is caused by a failure to open an output file (non-existent path or a path that requires permissions like /dev/null) while specifying zones.

