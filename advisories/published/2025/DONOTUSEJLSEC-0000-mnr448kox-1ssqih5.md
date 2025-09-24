```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kox-1ssqih5"
modified = 2025-09-23T03:04:04.545Z
upstream = ["CVE-2020-35522"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1932037", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BMHBYFMX3D5VGR6Y3RXTTH3Q4NF4E6IG/", "https://security.gentoo.org/glsa/202104-06", "https://security.netapp.com/advisory/ntap-20210521-0009/", "https://bugzilla.redhat.com/show_bug.cgi?id=1932037", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BMHBYFMX3D5VGR6Y3RXTTH3Q4NF4E6IG/", "https://security.gentoo.org/glsa/202104-06", "https://security.netapp.com/advisory/ntap-20210521-0009/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.3.0+0"]

[database_specific.source]
id = "CVE-2020-35522"
modified = "2024-11-21T05:27:29.483Z"
published = "2021-03-09T20:15:12.867Z"
imported = "2025-09-23T03:04:04.545Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-35522"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-35522"
```

# In LibTIFF, there is a memory malloc failure in tif_pixarlog.c

In LibTIFF, there is a memory malloc failure in tif_pixarlog.c. A crafted TIFF document can lead to an abort, resulting in a remote denial of service attack.

