```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scv9t-c05941"
modified = 2025-09-23T14:19:15.665Z
upstream = ["CVE-2020-36421"]
references = ["https://bugs.gentoo.org/730752", "https://github.com/ARMmbed/mbedtls/issues/3394", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.7", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.23.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://bugs.gentoo.org/730752", "https://github.com/ARMmbed/mbedtls/issues/3394", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.7", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.23.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[database_specific.source]
id = "CVE-2020-36421"
modified = 2024-11-21T05:29:28.020Z
published = 2021-07-19T17:15:11.133Z
imported = 2025-09-23T14:19:15.665Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36421"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36421"
```

# An issue was discovered in Arm Mbed TLS before 2.23.0

An issue was discovered in Arm Mbed TLS before 2.23.0. Because of a side channel in modular exponentiation, an RSA private key used in a secure enclave could be disclosed.

