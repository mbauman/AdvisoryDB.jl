```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kox-16vrot3"
modified = 2025-09-23T03:04:04.545Z
upstream = ["CVE-2020-35524"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1932044", "https://gitlab.com/libtiff/libtiff/-/merge_requests/159", "https://gitlab.com/rzkn/libtiff/-/commit/7be2e452ddcf6d7abca88f41d3761e6edab72b22", "https://lists.debian.org/debian-lts-announce/2021/06/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BMHBYFMX3D5VGR6Y3RXTTH3Q4NF4E6IG/", "https://security.gentoo.org/glsa/202104-06", "https://security.netapp.com/advisory/ntap-20210521-0009/", "https://www.debian.org/security/2021/dsa-4869", "https://bugzilla.redhat.com/show_bug.cgi?id=1932044", "https://gitlab.com/libtiff/libtiff/-/merge_requests/159", "https://gitlab.com/rzkn/libtiff/-/commit/7be2e452ddcf6d7abca88f41d3761e6edab72b22", "https://lists.debian.org/debian-lts-announce/2021/06/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BMHBYFMX3D5VGR6Y3RXTTH3Q4NF4E6IG/", "https://security.gentoo.org/glsa/202104-06", "https://security.netapp.com/advisory/ntap-20210521-0009/", "https://www.debian.org/security/2021/dsa-4869"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.3.0+0"]

[database_specific.source]
id = "CVE-2020-35524"
modified = "2024-11-21T05:27:29.840Z"
published = "2021-03-09T20:15:13.040Z"
imported = "2025-09-23T03:04:04.545Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-35524"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-35524"
```

# A heap-based buffer overflow flaw was found in libtiff in the handling of TIFF images in libtiff's T...

A heap-based buffer overflow flaw was found in libtiff in the handling of TIFF images in libtiff's TIFF2PDF tool. A specially crafted TIFF file can lead to arbitrary code execution. The highest threat from this vulnerability is to confidentiality, integrity, as well as system availability.

