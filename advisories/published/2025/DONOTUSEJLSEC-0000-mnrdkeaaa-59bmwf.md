```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaaa-59bmwf"
modified = 2025-09-29T17:46:20.434Z
upstream = ["CVE-2022-2953"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-2953.json", "https://gitlab.com/libtiff/libtiff/-/commit/48d6ece8389b01129e7d357f0985c8f938ce3da3", "https://gitlab.com/libtiff/libtiff/-/issues/414", "https://security.netapp.com/advisory/ntap-20221014-0008/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-2953.json", "https://gitlab.com/libtiff/libtiff/-/commit/48d6ece8389b01129e7d357f0985c8f938ce3da3", "https://gitlab.com/libtiff/libtiff/-/issues/414", "https://security.netapp.com/advisory/ntap-20221014-0008/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2022-2953"
imported = 2025-09-29T17:46:20.434Z
modified = 2024-11-21T07:01:58.930Z
published = 2022-08-29T15:15:10.730Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2953"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2953"
```

# LibTIFF 4.4.0 has an out-of-bounds read in extractImageSection in tools/tiffcrop.c:6905, allowing at...

LibTIFF 4.4.0 has an out-of-bounds read in extractImageSection in tools/tiffcrop.c:6905, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit 48d6ece8.

