```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaaa-10gtkhu"
modified = 2025-09-29T17:46:20.434Z
upstream = ["CVE-2022-1354"]
references = ["https://access.redhat.com/security/cve/CVE-2022-1354", "https://bugzilla.redhat.com/show_bug.cgi?id=2074404", "https://gitlab.com/libtiff/libtiff/-/commit/87f580f39011109b3bb5f6eca13fac543a542798", "https://gitlab.com/libtiff/libtiff/-/issues/319", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221014-0007/", "https://www.debian.org/security/2023/dsa-5333", "https://access.redhat.com/security/cve/CVE-2022-1354", "https://bugzilla.redhat.com/show_bug.cgi?id=2074404", "https://gitlab.com/libtiff/libtiff/-/commit/87f580f39011109b3bb5f6eca13fac543a542798", "https://gitlab.com/libtiff/libtiff/-/issues/319", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221014-0007/", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[[jlsec_sources]]
id = "CVE-2022-1354"
imported = 2025-09-29T17:46:20.434Z
modified = 2024-11-21T06:40:33.447Z
published = 2022-08-31T16:15:09.520Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1354"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1354"
```

# A heap buffer overflow flaw was found in Libtiffs' tiffinfo.c in TIFFReadRawDataStriped() function

A heap buffer overflow flaw was found in Libtiffs' tiffinfo.c in TIFFReadRawDataStriped() function. This flaw allows an attacker to pass a crafted TIFF file to the tiffinfo tool, triggering a heap buffer overflow issue and causing a crash that leads to a denial of service.

