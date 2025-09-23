```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpi-1f9pces"
modified = 2025-09-23T03:04:04.566Z
upstream = ["CVE-2022-34526"]
references = ["https://gitlab.com/libtiff/libtiff/-/issues/433", "https://gitlab.com/libtiff/libtiff/-/issues/486", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FC6LWPAEKYJ57LSHX4SBFMLRMLOZTHIJ/", "https://security.netapp.com/advisory/ntap-20220930-0002/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/libtiff/libtiff/-/issues/433", "https://gitlab.com/libtiff/libtiff/-/issues/486", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FC6LWPAEKYJ57LSHX4SBFMLRMLOZTHIJ/", "https://security.netapp.com/advisory/ntap-20220930-0002/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.4.0+0, < 4.5.1+0"]

[database_specific.source]
id = "CVE-2022-34526"
modified = "2024-11-21T07:09:42.100Z"
published = "2022-07-29T23:15:08.113Z"
imported = "2025-09-23T03:04:04.566Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-34526"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-34526"
```

# A stack overflow was discovered in the _TIFFVGetField function of Tiffsplit v4.4.0

A stack overflow was discovered in the _TIFFVGetField function of Tiffsplit v4.4.0. This vulnerability allows attackers to cause a Denial of Service (DoS) via a crafted TIFF file parsed by the "tiffsplit" or "tiffcrop" utilities.

