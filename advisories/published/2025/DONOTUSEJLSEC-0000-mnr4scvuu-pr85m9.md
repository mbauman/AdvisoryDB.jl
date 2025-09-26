```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scvuu-pr85m9"
modified = 2025-09-23T14:19:16.422Z
upstream = ["CVE-2022-35409"]
references = ["https://github.com/Mbed-TLS/mbedtls/releases", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/advisories/mbedtls-security-advisory-2022-07.html", "https://github.com/Mbed-TLS/mbedtls/releases", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/advisories/mbedtls-security-advisory-2022-07.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.28.2+0"]

[database_specific.source]
id = "CVE-2022-35409"
modified = 2024-11-21T07:11:07.183Z
published = 2022-07-15T14:15:09.840Z
imported = 2025-09-23T14:19:16.422Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-35409"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-35409"
```

# An issue was discovered in Mbed TLS before 2.28.1 and 3.x before 3.2.0

An issue was discovered in Mbed TLS before 2.28.1 and 3.x before 3.2.0. In some configurations, an unauthenticated attacker can send an invalid ClientHello message to a DTLS server that causes a heap-based buffer over-read of up to 255 bytes. This can cause a server crash or possibly information disclosure based on error responses. Affected configurations have MBEDTLS*SSL*DTLS*CLIENT*PORT*REUSE enabled and MBEDTLS*SSL*IN*CONTENT*LEN less than a threshold that depends on the configuration: 258 bytes if using mbedtls*ssl*cookie*check, and possibly up to 571 bytes with a custom cookie check function.

