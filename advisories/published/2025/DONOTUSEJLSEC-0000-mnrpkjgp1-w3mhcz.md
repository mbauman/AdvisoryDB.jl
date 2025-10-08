```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrpkjgp1-w3mhcz"
modified = 2025-10-08T03:23:36.133Z
upstream = ["CVE-2021-37623"]
references = ["https://github.com/Exiv2/exiv2/pull/1790", "https://github.com/Exiv2/exiv2/security/advisories/GHSA-mvc4-g5pv-4qqq", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FMDT4PJB7P43WSOM3TRQIY3J33BAFVVE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UYGDELIFFJWKUU7SO3QATCIXCZJERGAC/", "https://security.gentoo.org/glsa/202312-06", "https://github.com/Exiv2/exiv2/pull/1790", "https://github.com/Exiv2/exiv2/security/advisories/GHSA-mvc4-g5pv-4qqq", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FMDT4PJB7P43WSOM3TRQIY3J33BAFVVE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UYGDELIFFJWKUU7SO3QATCIXCZJERGAC/", "https://security.gentoo.org/glsa/202312-06"]

[[affected]]
pkg = "Exiv2_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-37623"
imported = 2025-10-08T03:23:36.133Z
modified = 2024-11-21T06:15:32.637Z
published = 2021-08-09T18:15:07.687Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-37623"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-37623"
```

# Exiv2 is a command-line utility and C++ library for reading, writing, deleting, and modifying the me...

Exiv2 is a command-line utility and C++ library for reading, writing, deleting, and modifying the metadata of image files. An infinite loop was found in Exiv2 versions v0.27.4 and earlier. The infinite loop is triggered when Exiv2 is used to modify the metadata of a crafted image file. An attacker could potentially exploit the vulnerability to cause a denial of service, if they can trick the victim into running Exiv2 on a crafted image file. Note that this bug is only triggered when deleting the IPTC data, which is a less frequently used Exiv2 operation that requires an extra command line option (`-d I rm`). The bug is fixed in version v0.27.5.

