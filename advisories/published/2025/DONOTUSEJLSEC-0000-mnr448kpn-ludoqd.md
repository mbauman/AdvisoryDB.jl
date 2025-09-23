```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpn-ludoqd"
modified = 2025-09-23T03:04:04.571Z
upstream = ["CVE-2022-3598"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3598.json", "https://gitlab.com/libtiff/libtiff/-/commit/cfbb883bf6ea7bedcb04177cc4e52d304522fdff", "https://gitlab.com/libtiff/libtiff/-/issues/435", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3598.json", "https://gitlab.com/libtiff/libtiff/-/commit/cfbb883bf6ea7bedcb04177cc4e52d304522fdff", "https://gitlab.com/libtiff/libtiff/-/issues/435", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2022-3598"
modified = "2025-05-07T21:15:56.747Z"
published = "2022-10-21T16:15:11.030Z"
imported = "2025-09-23T03:04:04.571Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3598"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3598"
```

# LibTIFF 4.4.0 has an out-of-bounds write in extractContigSamplesShifted24bits in tools/tiffcrop.c:36...

LibTIFF 4.4.0 has an out-of-bounds write in extractContigSamplesShifted24bits in tools/tiffcrop.c:3604, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit cfbb883b.

