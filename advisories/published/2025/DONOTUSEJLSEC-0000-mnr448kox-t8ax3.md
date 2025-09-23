```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kox-t8ax3"
modified = 2025-09-23T03:04:04.545Z
upstream = ["CVE-2020-35523"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1932040", "https://gitlab.com/libtiff/libtiff/-/commit/c8d613ef497058fe653c467fc84c70a62a4a71b2", "https://gitlab.com/libtiff/libtiff/-/merge_requests/160", "https://lists.debian.org/debian-lts-announce/2021/06/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BMHBYFMX3D5VGR6Y3RXTTH3Q4NF4E6IG/", "https://security.gentoo.org/glsa/202104-06", "https://security.netapp.com/advisory/ntap-20210521-0009/", "https://www.debian.org/security/2021/dsa-4869", "https://bugzilla.redhat.com/show_bug.cgi?id=1932040", "https://gitlab.com/libtiff/libtiff/-/commit/c8d613ef497058fe653c467fc84c70a62a4a71b2", "https://gitlab.com/libtiff/libtiff/-/merge_requests/160", "https://lists.debian.org/debian-lts-announce/2021/06/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BMHBYFMX3D5VGR6Y3RXTTH3Q4NF4E6IG/", "https://security.gentoo.org/glsa/202104-06", "https://security.netapp.com/advisory/ntap-20210521-0009/", "https://www.debian.org/security/2021/dsa-4869"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.3.0+0"]

[database_specific.source]
id = "CVE-2020-35523"
modified = "2024-11-21T05:27:29.650Z"
published = "2021-03-09T20:15:12.963Z"
imported = "2025-09-23T03:04:04.545Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-35523"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-35523"
```

# An integer overflow flaw was found in libtiff that exists in the tif_getimage.c file

An integer overflow flaw was found in libtiff that exists in the tif_getimage.c file. This flaw allows an attacker to inject and execute arbitrary code when a user opens a crafted TIFF file. The highest threat from this vulnerability is to confidentiality, integrity, as well as system availability.

