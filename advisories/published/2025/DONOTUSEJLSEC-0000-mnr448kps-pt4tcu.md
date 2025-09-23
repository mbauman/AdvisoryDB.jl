```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kps-pt4tcu"
modified = 2025-09-23T03:04:04.576Z
upstream = ["CVE-2023-0802"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2023/CVE-2023-0802.json", "https://gitlab.com/libtiff/libtiff/-/commit/33aee1275d9d1384791d2206776eb8152d397f00", "https://gitlab.com/libtiff/libtiff/-/issues/500", "https://lists.debian.org/debian-lts-announce/2023/02/msg00026.html", "https://security.gentoo.org/glsa/202305-31", "https://security.netapp.com/advisory/ntap-20230316-0002/", "https://www.debian.org/security/2023/dsa-5361", "https://gitlab.com/gitlab-org/cves/-/blob/master/2023/CVE-2023-0802.json", "https://gitlab.com/libtiff/libtiff/-/commit/33aee1275d9d1384791d2206776eb8152d397f00", "https://gitlab.com/libtiff/libtiff/-/issues/500", "https://lists.debian.org/debian-lts-announce/2023/02/msg00026.html", "https://security.gentoo.org/glsa/202305-31", "https://security.netapp.com/advisory/ntap-20230316-0002/", "https://www.debian.org/security/2023/dsa-5361"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2023-0802"
modified = "2025-03-21T19:15:42.267Z"
published = "2023-02-13T23:15:12.467Z"
imported = "2025-09-23T03:04:04.576Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-0802"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-0802"
```

# LibTIFF 4.4.0 has an out-of-bounds write in tiffcrop in tools/tiffcrop.c:3724, allowing attackers to...

LibTIFF 4.4.0 has an out-of-bounds write in tiffcrop in tools/tiffcrop.c:3724, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit 33aee127.

