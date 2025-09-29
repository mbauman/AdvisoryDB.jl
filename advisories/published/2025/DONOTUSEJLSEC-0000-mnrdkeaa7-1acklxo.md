```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaa7-1acklxo"
modified = 2025-09-29T17:46:20.431Z
upstream = ["CVE-2022-2057"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-2057.json", "https://gitlab.com/libtiff/libtiff/-/issues/427", "https://gitlab.com/libtiff/libtiff/-/merge_requests/346", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4TSS7MJ7OO7JO5BNKCRYSFU7UAYOKLA2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OXUMJXVEAYFWRO3U3YHKSULHIVDOLEQS/", "https://security.netapp.com/advisory/ntap-20220826-0001/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-2057.json", "https://gitlab.com/libtiff/libtiff/-/issues/427", "https://gitlab.com/libtiff/libtiff/-/merge_requests/346", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4TSS7MJ7OO7JO5BNKCRYSFU7UAYOKLA2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OXUMJXVEAYFWRO3U3YHKSULHIVDOLEQS/", "https://security.netapp.com/advisory/ntap-20220826-0001/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.4.0+0, < 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2022-2057"
imported = 2025-09-29T17:46:20.431Z
modified = 2024-11-21T07:00:14.820Z
published = 2022-06-30T16:15:08.357Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2057"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2057"
```

# Divide By Zero error in tiffcrop in libtiff 4.4.0 allows attackers to cause a denial-of-service via ...

Divide By Zero error in tiffcrop in libtiff 4.4.0 allows attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit f3a5e010.

