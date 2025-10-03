```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaa2-1um0xqr"
modified = 2025-09-29T17:46:20.426Z
upstream = ["CVE-2022-0562"]
references = ["https://gitlab.com/gitlab-org/build/omnibus-mirror/libtiff/-/commit/561599c99f987dc32ae110370cfdd7df7975586b", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0562.json", "https://gitlab.com/libtiff/libtiff/-/issues/362", "https://lists.debian.org/debian-lts-announce/2022/03/msg00001.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DZEHZ35XVO2VBZ4HHCMM6J6TQIDSBQOM/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220318-0001/", "https://www.debian.org/security/2022/dsa-5108", "https://gitlab.com/gitlab-org/build/omnibus-mirror/libtiff/-/commit/561599c99f987dc32ae110370cfdd7df7975586b", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-0562.json", "https://gitlab.com/libtiff/libtiff/-/issues/362", "https://lists.debian.org/debian-lts-announce/2022/03/msg00001.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DZEHZ35XVO2VBZ4HHCMM6J6TQIDSBQOM/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220318-0001/", "https://www.debian.org/security/2022/dsa-5108"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[[jlsec_sources]]
id = "CVE-2022-0562"
imported = 2025-09-29T17:46:20.426Z
modified = 2024-11-21T06:38:55.367Z
published = 2022-02-11T18:15:11.083Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0562"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0562"
```

# Null source pointer passed as an argument to memcpy() function within TIFFReadDirectory() in tif_dir...

Null source pointer passed as an argument to memcpy() function within TIFFReadDirectory() in tif_dirread.c in libtiff versions from 4.0 to 4.3.0 could lead to Denial of Service via crafted TIFF file. For users that compile libtiff from sources, a fix is available with commit 561599c.

