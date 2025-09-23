```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpd-5l9t3g"
modified = 2025-09-23T03:04:04.561Z
upstream = ["CVE-2022-0891"]
references = ["https://gitlab.com/freedesktop-sdk/mirrors/gitlab/libtiff/libtiff/-/commit/232282fd8f9c21eefe8d2d2b96cdbbb172fe7b7c", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0891.json", "https://gitlab.com/libtiff/libtiff/-/issues/380", "https://gitlab.com/libtiff/libtiff/-/issues/382", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RNT2GFNRLOMKJ5KXM6JIHKBNBFDVZPD3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZQ4E654ZYUUUQNBKYQFXNK2CV3CPWTM2/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221228-0008/", "https://www.debian.org/security/2022/dsa-5108", "https://gitlab.com/freedesktop-sdk/mirrors/gitlab/libtiff/libtiff/-/commit/232282fd8f9c21eefe8d2d2b96cdbbb172fe7b7c", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0891.json", "https://gitlab.com/libtiff/libtiff/-/issues/380", "https://gitlab.com/libtiff/libtiff/-/issues/382", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RNT2GFNRLOMKJ5KXM6JIHKBNBFDVZPD3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZQ4E654ZYUUUQNBKYQFXNK2CV3CPWTM2/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221228-0008/", "https://www.debian.org/security/2022/dsa-5108"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-0891"
modified = "2024-11-21T06:39:36.610Z"
published = "2022-03-10T17:44:58.207Z"
imported = "2025-09-23T03:04:04.561Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0891"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0891"
```

# A heap buffer overflow in ExtractImageSection function in tiffcrop.c in libtiff library Version 4.3....

A heap buffer overflow in ExtractImageSection function in tiffcrop.c in libtiff library Version 4.3.0 allows attacker to trigger unsafe or out of bounds memory access via crafted TIFF image file which could result into application crash, potential information disclosure or any other context-dependent impact

