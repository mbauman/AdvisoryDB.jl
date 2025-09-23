```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scv9t-1c9vkk0"
modified = 2025-09-23T14:19:15.665Z
upstream = ["CVE-2020-36422"]
references = ["https://bugs.gentoo.org/730752", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.7", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.23.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://bugs.gentoo.org/730752", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.7", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.23.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[database_specific.source]
id = "CVE-2020-36422"
modified = 2024-11-21T05:29:28.237Z
published = 2021-07-19T17:15:11.177Z
imported = 2025-09-23T14:19:15.665Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36422"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36422"
```

# An issue was discovered in Arm Mbed TLS before 2.23.0

An issue was discovered in Arm Mbed TLS before 2.23.0. A side channel allows recovery of an ECC private key, related to mbedtls*ecp*check*pub*priv, mbedtls*pk*parse*key, mbedtls*pk*parse*keyfile, mbedtls*ecp*mul, and mbedtls*ecp*mul_restartable.

