```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbtrvg-1alw3z2"
modified = 2025-10-01T16:09:45.052Z
upstream = ["CVE-2020-36424"]
references = ["https://bugs.gentoo.org/740108", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-09-2", "https://bugs.gentoo.org/740108", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-09-2"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[[jlsec_sources]]
id = "CVE-2020-36424"
imported = 2025-10-01T16:09:45.052Z
modified = 2024-11-21T05:29:28.577Z
published = 2021-07-19T17:15:11.277Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36424"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36424"
```

# An issue was discovered in Arm Mbed TLS before 2.24.0

An issue was discovered in Arm Mbed TLS before 2.24.0. An attacker can recover a private key (for RSA or static Diffie-Hellman) via a side-channel attack against generation of base blinding/unblinding values.

