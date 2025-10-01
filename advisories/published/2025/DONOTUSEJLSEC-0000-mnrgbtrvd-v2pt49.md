```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbtrvd-v2pt49"
modified = 2025-10-01T16:09:45.049Z
upstream = ["CVE-2020-36422"]
references = ["https://bugs.gentoo.org/730752", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.7", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.23.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://bugs.gentoo.org/730752", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.7", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.23.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[[jlsec_sources]]
id = "CVE-2020-36422"
imported = 2025-10-01T16:09:45.049Z
modified = 2024-11-21T05:29:28.237Z
published = 2021-07-19T17:15:11.177Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36422"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36422"
```

# An issue was discovered in Arm Mbed TLS before 2.23.0

An issue was discovered in Arm Mbed TLS before 2.23.0. A side channel allows recovery of an ECC private key, related to mbedtls_ecp_check_pub_priv, mbedtls_pk_parse_key, mbedtls_pk_parse_keyfile, mbedtls_ecp_mul, and mbedtls_ecp_mul_restartable.

