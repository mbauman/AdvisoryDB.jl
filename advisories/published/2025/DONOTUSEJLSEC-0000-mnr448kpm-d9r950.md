```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpm-d9r950"
modified = 2025-09-23T03:04:04.570Z
upstream = ["CVE-2022-3570"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3570.json", "https://gitlab.com/libtiff/libtiff/-/commit/bd94a9b383d8755a27b5a1bc27660b8ad10b094c", "https://gitlab.com/libtiff/libtiff/-/issues/381", "https://gitlab.com/libtiff/libtiff/-/issues/386", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230203-0002/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3570.json", "https://gitlab.com/libtiff/libtiff/-/commit/bd94a9b383d8755a27b5a1bc27660b8ad10b094c", "https://gitlab.com/libtiff/libtiff/-/issues/381", "https://gitlab.com/libtiff/libtiff/-/issues/386", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230203-0002/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2022-3570"
modified = "2025-05-07T20:15:21.710Z"
published = "2022-10-21T16:15:10.913Z"
imported = "2025-09-23T03:04:04.570Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3570"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3570"
```

# Multiple heap buffer overflows in tiffcrop.c utility in libtiff library Version 4.4.0 allows attacke...

Multiple heap buffer overflows in tiffcrop.c utility in libtiff library Version 4.4.0 allows attacker to trigger unsafe or out of bounds memory access via crafted TIFF image file which could result into application crash, potential information disclosure or any other context-dependent impact

