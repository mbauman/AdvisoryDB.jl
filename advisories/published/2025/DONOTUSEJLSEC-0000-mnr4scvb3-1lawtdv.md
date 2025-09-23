```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scvb3-1lawtdv"
modified = 2025-09-23T14:19:15.711Z
upstream = ["CVE-2021-44732"]
references = ["https://bugs.gentoo.org/829660", "https://github.com/ARMmbed/mbedtls/releases", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v3.1.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-12", "https://bugs.gentoo.org/829660", "https://github.com/ARMmbed/mbedtls/releases", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v3.1.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-12"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.28.0+0"]

[database_specific.source]
id = "CVE-2021-44732"
modified = 2024-11-21T06:31:28.383Z
published = 2021-12-20T08:15:06.620Z
imported = 2025-09-23T14:19:15.711Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-44732"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-44732"
```

# Mbed TLS before 3.0.1 has a double free in certain out-of-memory conditions, as demonstrated by an m...

Mbed TLS before 3.0.1 has a double free in certain out-of-memory conditions, as demonstrated by an mbedtls*ssl*set_session() failure.

