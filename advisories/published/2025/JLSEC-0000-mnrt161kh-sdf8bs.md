```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt161kh-sdf8bs"
modified = 2025-10-10T13:32:22.001Z
upstream = ["CVE-2022-42010"]
references = ["https://gitlab.freedesktop.org/dbus/dbus/-/issues/418", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/E4CO7N226I3X5FNBR2MACCH6TS764VJP/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ND74SKN56BCYL3QLEAAB6E64UUBRA5UG/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SQCSLMCK2XGX23R2DKW2MSAICQAK6MT2/", "https://security.gentoo.org/glsa/202305-08", "https://www.openwall.com/lists/oss-security/2022/10/06/1", "https://gitlab.freedesktop.org/dbus/dbus/-/issues/418", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/E4CO7N226I3X5FNBR2MACCH6TS764VJP/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ND74SKN56BCYL3QLEAAB6E64UUBRA5UG/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SQCSLMCK2XGX23R2DKW2MSAICQAK6MT2/", "https://security.gentoo.org/glsa/202305-08", "https://www.openwall.com/lists/oss-security/2022/10/06/1"]

[[affected]]
pkg = "Dbus_jll"
ranges = ["< 1.14.10+0"]

[[jlsec_sources]]
id = "CVE-2022-42010"
imported = 2025-10-10T13:32:22.001Z
modified = 2025-06-09T15:15:27.810Z
published = 2022-10-10T00:15:09.510Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-42010"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-42010"
```

# An issue was discovered in D-Bus before 1.12.24, 1.13.x and 1.14.x before 1.14.4, and 1.15.x before ...

An issue was discovered in D-Bus before 1.12.24, 1.13.x and 1.14.x before 1.14.4, and 1.15.x before 1.15.2. An authenticated attacker can cause dbus-daemon and other programs that use libdbus to crash when receiving a message with certain invalid type signatures.

