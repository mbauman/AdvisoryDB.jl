```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkea9o-c1474e"
modified = 2025-09-29T17:46:20.412Z
upstream = ["CVE-2020-35521"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1932034", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BMHBYFMX3D5VGR6Y3RXTTH3Q4NF4E6IG/", "https://security.gentoo.org/glsa/202104-06", "https://security.netapp.com/advisory/ntap-20210521-0009/", "https://bugzilla.redhat.com/show_bug.cgi?id=1932034", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BMHBYFMX3D5VGR6Y3RXTTH3Q4NF4E6IG/", "https://security.gentoo.org/glsa/202104-06", "https://security.netapp.com/advisory/ntap-20210521-0009/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.3.0+0"]

[[jlsec_sources]]
id = "CVE-2020-35521"
imported = 2025-09-29T17:46:20.412Z
modified = 2024-11-21T05:27:29.287Z
published = 2021-03-09T20:15:12.773Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-35521"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-35521"
```

# A flaw was found in libtiff

A flaw was found in libtiff. Due to a memory allocation failure in tif_read.c, a crafted TIFF file can lead to an abort, resulting in denial of service.

