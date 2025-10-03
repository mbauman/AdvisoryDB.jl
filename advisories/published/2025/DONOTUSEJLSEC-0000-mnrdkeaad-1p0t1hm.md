```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaad-1p0t1hm"
modified = 2025-09-29T17:46:20.437Z
upstream = ["CVE-2022-3599"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3599.json", "https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246", "https://gitlab.com/libtiff/libtiff/-/issues/398", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/", "https://www.debian.org/security/2023/dsa-5333", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-3599.json", "https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246", "https://gitlab.com/libtiff/libtiff/-/issues/398", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.netapp.com/advisory/ntap-20230110-0001/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2022-3599"
imported = 2025-09-29T17:46:20.437Z
modified = 2025-05-07T21:15:56.903Z
published = 2022-10-21T16:15:11.087Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3599"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3599"
```

# LibTIFF 4.4.0 has an out-of-bounds read in writeSingleSection in tools/tiffcrop.c:7345, allowing att...

LibTIFF 4.4.0 has an out-of-bounds read in writeSingleSection in tools/tiffcrop.c:7345, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit e8131125.

