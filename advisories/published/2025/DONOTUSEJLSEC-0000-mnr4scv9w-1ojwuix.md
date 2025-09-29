```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scv9w-1ojwuix"
modified = 2025-09-23T14:19:15.668Z
upstream = ["CVE-2020-36426"]
references = ["https://bugs.gentoo.org/740108", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://bugs.gentoo.org/740108", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[database_specific.source]
id = "CVE-2020-36426"
modified = 2024-11-21T05:29:28.957Z
published = 2021-07-19T17:15:11.367Z
imported = 2025-09-23T14:19:15.668Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36426"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36426"
```

# An issue was discovered in Arm Mbed TLS before 2.24.0

An issue was discovered in Arm Mbed TLS before 2.24.0. mbedtls*x509*crl*parse*der has a buffer over-read (of one byte).

