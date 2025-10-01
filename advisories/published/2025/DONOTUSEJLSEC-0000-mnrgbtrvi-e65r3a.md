```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbtrvi-e65r3a"
modified = 2025-10-01T16:09:45.054Z
upstream = ["CVE-2020-36425"]
references = ["https://bugs.gentoo.org/740108", "https://github.com/ARMmbed/mbedtls/issues/3340", "https://github.com/ARMmbed/mbedtls/pull/3433", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://bugs.gentoo.org/740108", "https://github.com/ARMmbed/mbedtls/issues/3340", "https://github.com/ARMmbed/mbedtls/pull/3433", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[[jlsec_sources]]
id = "CVE-2020-36425"
imported = 2025-10-01T16:09:45.054Z
modified = 2024-11-21T05:29:28.770Z
published = 2021-07-19T17:15:11.327Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36425"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36425"
```

# An issue was discovered in Arm Mbed TLS before 2.24.0

An issue was discovered in Arm Mbed TLS before 2.24.0. It incorrectly uses a revocationDate check when deciding whether to honor certificate revocation via a CRL. In some situations, an attacker can exploit this by changing the local clock.

