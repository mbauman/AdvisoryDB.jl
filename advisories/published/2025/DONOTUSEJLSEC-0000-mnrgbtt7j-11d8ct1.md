```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbtt7j-11d8ct1"
modified = 2025-10-01T16:09:46.783Z
upstream = ["CVE-2024-28960"]
references = ["https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2024-03.md", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5YE3QRREGJC6K34JD4LZ5P3IALNX4QYY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6UZNBMKYEV2J5DI7R4BQGL472V7X3WJY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NCDU52ZDA7TX3HC5JCU6ZZIJQOPTNBK6/", "https://mbed-tls.readthedocs.io/en/latest/tech-updates/security-advisories/", "https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2024-03.md", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5YE3QRREGJC6K34JD4LZ5P3IALNX4QYY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6UZNBMKYEV2J5DI7R4BQGL472V7X3WJY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NCDU52ZDA7TX3HC5JCU6ZZIJQOPTNBK6/", "https://mbed-tls.readthedocs.io/en/latest/tech-updates/security-advisories/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-28960"
imported = 2025-10-01T16:09:46.783Z
modified = 2025-05-28T17:42:17.887Z
published = 2024-03-29T06:15:07.270Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-28960"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-28960"
```

# An issue was discovered in Mbed TLS 2.18.0 through 2.28.x before 2.28.8 and 3.x before 3.6.0, and Mb...

An issue was discovered in Mbed TLS 2.18.0 through 2.28.x before 2.28.8 and 3.x before 3.6.0, and Mbed Crypto. The PSA Crypto API mishandles shared memory.

