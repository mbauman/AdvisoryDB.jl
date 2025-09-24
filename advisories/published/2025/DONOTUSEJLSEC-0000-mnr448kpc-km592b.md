```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpc-km592b"
modified = 2025-09-23T03:04:04.560Z
upstream = ["CVE-2022-0865"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0865.json", "https://gitlab.com/libtiff/libtiff/-/issues/385", "https://gitlab.com/libtiff/libtiff/-/merge_requests/306", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RNT2GFNRLOMKJ5KXM6JIHKBNBFDVZPD3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZQ4E654ZYUUUQNBKYQFXNK2CV3CPWTM2/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221228-0008/", "https://www.debian.org/security/2022/dsa-5108", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0865.json", "https://gitlab.com/libtiff/libtiff/-/issues/385", "https://gitlab.com/libtiff/libtiff/-/merge_requests/306", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RNT2GFNRLOMKJ5KXM6JIHKBNBFDVZPD3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZQ4E654ZYUUUQNBKYQFXNK2CV3CPWTM2/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221228-0008/", "https://www.debian.org/security/2022/dsa-5108"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.3.0+0, < 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-0865"
modified = "2024-11-21T06:39:33.490Z"
published = "2022-03-10T17:44:57.563Z"
imported = "2025-09-23T03:04:04.560Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0865"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0865"
```

# Reachable Assertion in tiffcp in libtiff 4.3.0 allows attackers to cause a denial-of-service via a c...

Reachable Assertion in tiffcp in libtiff 4.3.0 allows attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit 5e180045.

