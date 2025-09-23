```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpg-w7c8qg"
modified = 2025-09-23T03:04:04.564Z
upstream = ["CVE-2022-2056"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-2056.json", "https://gitlab.com/libtiff/libtiff/-/issues/415", "https://gitlab.com/libtiff/libtiff/-/merge_requests/346", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4TSS7MJ7OO7JO5BNKCRYSFU7UAYOKLA2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OXUMJXVEAYFWRO3U3YHKSULHIVDOLEQS/", "https://security.netapp.com/advisory/ntap-20220826-0001/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-2056.json", "https://gitlab.com/libtiff/libtiff/-/issues/415", "https://gitlab.com/libtiff/libtiff/-/merge_requests/346", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4TSS7MJ7OO7JO5BNKCRYSFU7UAYOKLA2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OXUMJXVEAYFWRO3U3YHKSULHIVDOLEQS/", "https://security.netapp.com/advisory/ntap-20220826-0001/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.4.0+0, < 4.5.1+0"]

[database_specific.source]
id = "CVE-2022-2056"
modified = "2024-11-21T07:00:14.663Z"
published = "2022-06-30T16:15:08.287Z"
imported = "2025-09-23T03:04:04.564Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2056"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2056"
```

# Divide By Zero error in tiffcrop in libtiff 4.4.0 allows attackers to cause a denial-of-service via ...

Divide By Zero error in tiffcrop in libtiff 4.4.0 allows attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit f3a5e010.

