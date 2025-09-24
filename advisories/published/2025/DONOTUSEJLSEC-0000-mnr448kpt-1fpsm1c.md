```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpt-1fpsm1c"
modified = 2025-09-23T03:04:04.577Z
upstream = ["CVE-2022-4645"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-4645.json", "https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246", "https://gitlab.com/libtiff/libtiff/-/issues/277", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/2ZTFA6GGOKFPIQNHDBMXYUR4XUXUJESE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BA6GRCAQ7NR2OK5N44UQRGUJBIYKWJJH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OLM763GGZVVOAXIQXG6YGTYJ5VFYNECQ/", "https://security.netapp.com/advisory/ntap-20230331-0001/", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-4645.json", "https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246", "https://gitlab.com/libtiff/libtiff/-/issues/277", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/2ZTFA6GGOKFPIQNHDBMXYUR4XUXUJESE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BA6GRCAQ7NR2OK5N44UQRGUJBIYKWJJH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OLM763GGZVVOAXIQXG6YGTYJ5VFYNECQ/", "https://security.netapp.com/advisory/ntap-20230331-0001/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2022-4645"
modified = "2025-04-04T21:15:42.243Z"
published = "2023-03-03T16:15:09.777Z"
imported = "2025-09-23T03:04:04.577Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-4645"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-4645"
```

# LibTIFF 4.4.0 has an out-of-bounds read in tiffcp in tools/tiffcp.c:948, allowing attackers to cause...

LibTIFF 4.4.0 has an out-of-bounds read in tiffcp in tools/tiffcp.c:948, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit e8131125.

