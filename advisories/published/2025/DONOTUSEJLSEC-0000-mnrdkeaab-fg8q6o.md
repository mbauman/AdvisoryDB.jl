```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaab-fg8q6o"
modified = 2025-09-29T17:46:20.435Z
upstream = ["CVE-2022-1355"]
references = ["https://access.redhat.com/security/cve/CVE-2022-1355", "https://bugzilla.redhat.com/show_bug.cgi?id=2074415", "https://gitlab.com/libtiff/libtiff/-/issues/400", "https://gitlab.com/libtiff/libtiff/-/merge_requests/323", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221014-0007/", "https://www.debian.org/security/2023/dsa-5333", "https://access.redhat.com/security/cve/CVE-2022-1355", "https://bugzilla.redhat.com/show_bug.cgi?id=2074415", "https://gitlab.com/libtiff/libtiff/-/issues/400", "https://gitlab.com/libtiff/libtiff/-/merge_requests/323", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221014-0007/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[[jlsec_sources]]
id = "CVE-2022-1355"
imported = 2025-09-29T17:46:20.435Z
modified = 2024-11-21T06:40:33.603Z
published = 2022-08-31T16:15:09.577Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1355"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1355"
```

# A stack buffer overflow flaw was found in Libtiffs' tiffcp.c in main() function

A stack buffer overflow flaw was found in Libtiffs' tiffcp.c in main() function. This flaw allows an attacker to pass a crafted TIFF file to the tiffcp tool, triggering a stack buffer overflow issue, possibly corrupting the memory, and causing a crash that leads to a denial of service.

