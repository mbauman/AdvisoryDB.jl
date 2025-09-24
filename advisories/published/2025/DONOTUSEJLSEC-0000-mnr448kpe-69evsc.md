```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpe-69evsc"
modified = 2025-09-23T03:04:04.562Z
upstream = ["CVE-2022-0924"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0924.json", "https://gitlab.com/libtiff/libtiff/-/issues/278", "https://gitlab.com/libtiff/libtiff/-/merge_requests/311", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RNT2GFNRLOMKJ5KXM6JIHKBNBFDVZPD3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZQ4E654ZYUUUQNBKYQFXNK2CV3CPWTM2/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220506-0002/", "https://www.debian.org/security/2022/dsa-5108", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0924.json", "https://gitlab.com/libtiff/libtiff/-/issues/278", "https://gitlab.com/libtiff/libtiff/-/merge_requests/311", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RNT2GFNRLOMKJ5KXM6JIHKBNBFDVZPD3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZQ4E654ZYUUUQNBKYQFXNK2CV3CPWTM2/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220506-0002/", "https://www.debian.org/security/2022/dsa-5108"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.3.0+0, < 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-0924"
modified = "2024-11-21T06:39:40.760Z"
published = "2022-03-11T18:15:30.137Z"
imported = "2025-09-23T03:04:04.562Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0924"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0924"
```

# Out-of-bounds Read error in tiffcp in libtiff 4.3.0 allows attackers to cause a denial-of-service vi...

Out-of-bounds Read error in tiffcp in libtiff 4.3.0 allows attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit 408976c4.

