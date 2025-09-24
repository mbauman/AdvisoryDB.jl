```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpf-1wjnkc"
modified = 2025-09-23T03:04:04.563Z
upstream = ["CVE-2022-1210"]
references = ["https://gitlab.com/libtiff/libtiff/-/issues/402", "https://gitlab.com/libtiff/libtiff/uploads/c3da94e53cf1e1e8e6d4d3780dc8c42f/example.tiff", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220513-0005/", "https://vuldb.com/?id.196363", "https://gitlab.com/libtiff/libtiff/-/issues/402", "https://gitlab.com/libtiff/libtiff/uploads/c3da94e53cf1e1e8e6d4d3780dc8c42f/example.tiff", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220513-0005/", "https://vuldb.com/?id.196363"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.3.0+0, < 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-1210"
modified = "2024-11-21T06:40:15.740Z"
published = "2022-04-03T09:15:09.033Z"
imported = "2025-09-23T03:04:04.563Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1210"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1210"
```

# A vulnerability classified as problematic was found in LibTIFF 4.3.0

A vulnerability classified as problematic was found in LibTIFF 4.3.0. Affected by this vulnerability is the TIFF File Handler of tiff2ps. Opening a malicious file leads to a denial of service. The attack can be launched remotely but requires user interaction. The exploit has been disclosed to the public and may be used.

