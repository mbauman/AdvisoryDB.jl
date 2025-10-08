```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrpkjgps-1mo4lqf"
modified = 2025-10-08T03:23:36.160Z
upstream = ["CVE-2021-37619"]
references = ["https://github.com/Exiv2/exiv2/pull/1752", "https://github.com/Exiv2/exiv2/security/advisories/GHSA-mxw9-qx4c-6m8v", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FMDT4PJB7P43WSOM3TRQIY3J33BAFVVE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UYGDELIFFJWKUU7SO3QATCIXCZJERGAC/", "https://security.gentoo.org/glsa/202312-06", "https://github.com/Exiv2/exiv2/pull/1752", "https://github.com/Exiv2/exiv2/security/advisories/GHSA-mxw9-qx4c-6m8v", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FMDT4PJB7P43WSOM3TRQIY3J33BAFVVE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UYGDELIFFJWKUU7SO3QATCIXCZJERGAC/", "https://security.gentoo.org/glsa/202312-06"]

[[affected]]
pkg = "Exiv2_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-37619"
imported = 2025-10-08T03:23:36.160Z
modified = 2024-11-21T06:15:32.060Z
published = 2021-08-09T19:15:07.940Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-37619"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-37619"
```

# Exiv2 is a command-line utility and C++ library for reading, writing, deleting, and modifying the me...

Exiv2 is a command-line utility and C++ library for reading, writing, deleting, and modifying the metadata of image files. An out-of-bounds read was found in Exiv2 versions v0.27.4 and earlier. The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file. An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2, if they can trick the victim into running Exiv2 on a crafted image file. Note that this bug is only triggered when writing the metadata, which is a less frequently used Exiv2 operation than reading the metadata. For example, to trigger the bug in the Exiv2 command-line application, you need to add an extra command-line argument such as insert. The bug is fixed in version v0.27.5.

