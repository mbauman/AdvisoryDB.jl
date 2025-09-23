```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpd-1p99oiz"
modified = 2025-09-23T03:04:04.561Z
upstream = ["CVE-2022-0908"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0908.json", "https://gitlab.com/libtiff/libtiff/-/commit/a95b799f65064e4ba2e2dfc206808f86faf93e85", "https://gitlab.com/libtiff/libtiff/-/issues/383", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RNT2GFNRLOMKJ5KXM6JIHKBNBFDVZPD3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZQ4E654ZYUUUQNBKYQFXNK2CV3CPWTM2/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220506-0002/", "https://www.debian.org/security/2022/dsa-5108", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0908.json", "https://gitlab.com/libtiff/libtiff/-/commit/a95b799f65064e4ba2e2dfc206808f86faf93e85", "https://gitlab.com/libtiff/libtiff/-/issues/383", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RNT2GFNRLOMKJ5KXM6JIHKBNBFDVZPD3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZQ4E654ZYUUUQNBKYQFXNK2CV3CPWTM2/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220506-0002/", "https://www.debian.org/security/2022/dsa-5108"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-0908"
modified = "2024-11-21T06:39:38.823Z"
published = "2022-03-11T18:15:27.077Z"
imported = "2025-09-23T03:04:04.561Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0908"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0908"
```

# Null source pointer passed as an argument to memcpy() function within TIFFFetchNormalTag () in tif_d...

Null source pointer passed as an argument to memcpy() function within TIFFFetchNormalTag () in tif_dirread.c in libtiff versions up to 4.3.0 could lead to Denial of Service via crafted TIFF file.

