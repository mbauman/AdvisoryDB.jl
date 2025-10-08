```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrpkjgqz-19jzaj2"
modified = 2025-10-08T03:23:36.203Z
upstream = ["CVE-2021-34334"]
references = ["https://github.com/Exiv2/exiv2/pull/1766", "https://github.com/Exiv2/exiv2/security/advisories/GHSA-hqjh-hpv8-8r9p", "https://lists.debian.org/debian-lts-announce/2023/01/msg00004.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FMDT4PJB7P43WSOM3TRQIY3J33BAFVVE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UYGDELIFFJWKUU7SO3QATCIXCZJERGAC/", "https://security.gentoo.org/glsa/202312-06", "https://github.com/Exiv2/exiv2/pull/1766", "https://github.com/Exiv2/exiv2/security/advisories/GHSA-hqjh-hpv8-8r9p", "https://lists.debian.org/debian-lts-announce/2023/01/msg00004.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FMDT4PJB7P43WSOM3TRQIY3J33BAFVVE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UYGDELIFFJWKUU7SO3QATCIXCZJERGAC/", "https://security.gentoo.org/glsa/202312-06"]

[[affected]]
pkg = "Exiv2_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-34334"
imported = 2025-10-08T03:23:36.203Z
modified = 2024-11-21T06:10:11.343Z
published = 2021-08-09T18:15:07.513Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-34334"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-34334"
```

# Exiv2 is a command-line utility and C++ library for reading, writing, deleting, and modifying the me...

Exiv2 is a command-line utility and C++ library for reading, writing, deleting, and modifying the metadata of image files. An infinite loop is triggered when Exiv2 is used to read the metadata of a crafted image file. An attacker could potentially exploit the vulnerability to cause a denial of service, if they can trick the victim into running Exiv2 on a crafted image file. The bug is fixed in version v0.27.5.

