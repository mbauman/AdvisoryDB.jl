```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaa6-upofq2"
modified = 2025-09-29T17:46:20.430Z
upstream = ["CVE-2022-1623"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-1623.json", "https://gitlab.com/libtiff/libtiff/-/commit/b4e79bfa0c7d2d08f6f1e7ec38143fc8cb11394a", "https://gitlab.com/libtiff/libtiff/-/issues/410", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/C7IWZTB4J2N4F5OR5QY4VHDSKWKZSWN3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UXAFOP6QQRNZD3HPZ6BMCEZZOM4YIZMK/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220616-0005/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-1623.json", "https://gitlab.com/libtiff/libtiff/-/commit/b4e79bfa0c7d2d08f6f1e7ec38143fc8cb11394a", "https://gitlab.com/libtiff/libtiff/-/issues/410", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/C7IWZTB4J2N4F5OR5QY4VHDSKWKZSWN3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UXAFOP6QQRNZD3HPZ6BMCEZZOM4YIZMK/", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20220616-0005/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.3.0+0, < 4.4.0+0"]

[[jlsec_sources]]
id = "CVE-2022-1623"
imported = 2025-09-29T17:46:20.430Z
modified = 2024-11-21T06:41:07.120Z
published = 2022-05-11T15:15:09.287Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1623"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1623"
```

# LibTIFF master branch has an out-of-bounds read in LZWDecode in libtiff/tif_lzw.c:624, allowing atta...

LibTIFF master branch has an out-of-bounds read in LZWDecode in libtiff/tif_lzw.c:624, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit b4e79bfa.

