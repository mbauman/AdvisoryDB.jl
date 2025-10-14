```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrtj4d7d-jb441"
modified = 2025-10-10T21:54:56.857Z
upstream = ["CVE-2022-40674"]
references = ["https://github.com/libexpat/libexpat/pull/629", "https://github.com/libexpat/libexpat/pull/640", "https://lists.debian.org/debian-lts-announce/2022/09/msg00029.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GSVZN3IJ6OCPSJL7AEX3ZHSHAHFOGESK/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/J2IGJNHFV53PYST7VQV3T4NHVYAMXA36/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LQB6FJAM5YQ35SF5B2MN25Y2FX56EOEZ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/WE2ZKEPGFCZ7R6DRVH3K6RBJPT42ZBEG/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XCGBVQQ47URGJAZWHCISHDWF6QBTV2LE/", "https://security.gentoo.org/glsa/202209-24", "https://security.gentoo.org/glsa/202211-06", "https://security.netapp.com/advisory/ntap-20221028-0008/", "https://www.debian.org/security/2022/dsa-5236", "https://github.com/libexpat/libexpat/pull/629", "https://github.com/libexpat/libexpat/pull/640", "https://lists.debian.org/debian-lts-announce/2022/09/msg00029.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GSVZN3IJ6OCPSJL7AEX3ZHSHAHFOGESK/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/J2IGJNHFV53PYST7VQV3T4NHVYAMXA36/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LQB6FJAM5YQ35SF5B2MN25Y2FX56EOEZ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/WE2ZKEPGFCZ7R6DRVH3K6RBJPT42ZBEG/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XCGBVQQ47URGJAZWHCISHDWF6QBTV2LE/", "https://security.gentoo.org/glsa/202209-24", "https://security.gentoo.org/glsa/202211-06", "https://security.netapp.com/advisory/ntap-20221028-0008/", "https://www.debian.org/security/2022/dsa-5236"]

[[affected]]
pkg = "Expat_jll"
ranges = ["< 2.5.0+0"]

[[jlsec_sources]]
id = "CVE-2022-40674"
imported = 2025-10-10T21:54:56.857Z
modified = 2025-05-30T20:15:30.970Z
published = 2022-09-14T11:15:54.020Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-40674"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-40674"
```

# libexpat before 2.4.9 has a use-after-free in the doContent function in xmlparse.c.

libexpat before 2.4.9 has a use-after-free in the doContent function in xmlparse.c.

