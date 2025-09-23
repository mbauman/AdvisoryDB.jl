```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpq-1uvuk7t"
modified = 2025-09-23T03:04:04.574Z
upstream = ["CVE-2023-0796"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2023/CVE-2023-0796.json", "https://gitlab.com/libtiff/libtiff/-/commit/afaabc3e50d4e5d80a94143f7e3c997e7e410f68", "https://gitlab.com/libtiff/libtiff/-/issues/499", "https://lists.debian.org/debian-lts-announce/2023/02/msg00026.html", "https://security.gentoo.org/glsa/202305-31", "https://security.netapp.com/advisory/ntap-20230316-0003/", "https://www.debian.org/security/2023/dsa-5361", "https://gitlab.com/gitlab-org/cves/-/blob/master/2023/CVE-2023-0796.json", "https://gitlab.com/libtiff/libtiff/-/commit/afaabc3e50d4e5d80a94143f7e3c997e7e410f68", "https://gitlab.com/libtiff/libtiff/-/issues/499", "https://lists.debian.org/debian-lts-announce/2023/02/msg00026.html", "https://security.gentoo.org/glsa/202305-31", "https://security.netapp.com/advisory/ntap-20230316-0003/", "https://www.debian.org/security/2023/dsa-5361"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[database_specific.source]
id = "CVE-2023-0796"
modified = "2025-03-21T19:15:41.423Z"
published = "2023-02-13T23:15:11.857Z"
imported = "2025-09-23T03:04:04.574Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-0796"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-0796"
```

# LibTIFF 4.4.0 has an out-of-bounds read in tiffcrop in tools/tiffcrop.c:3592, allowing attackers to ...

LibTIFF 4.4.0 has an out-of-bounds read in tiffcrop in tools/tiffcrop.c:3592, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit afaabc3e.

