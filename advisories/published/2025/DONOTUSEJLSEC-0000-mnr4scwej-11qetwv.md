```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scwej-11qetwv"
modified = 2025-09-23T14:19:17.131Z
upstream = ["CVE-2024-45157"]
references = ["https://github.com/Mbed-TLS/mbedtls/releases/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-08-1/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = [">= 2.26.0+0"]

[database_specific.source]
id = "CVE-2024-45157"
modified = 2025-03-14T17:15:47.320Z
published = 2024-09-05T19:15:12.960Z
imported = 2025-09-23T14:19:17.131Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-45157"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-45157"
```

# An issue was discovered in Mbed TLS before 2.28.9 and 3.x before 3.6.1, in which the user-selected a...

An issue was discovered in Mbed TLS before 2.28.9 and 3.x before 3.6.1, in which the user-selected algorithm is not used. Unlike previously documented, enabling MBEDTLS*PSA*HMAC*DRBG*MD*TYPE does not cause the PSA subsystem to use HMAC*DRBG: it uses HMAC*DRBG only when MBEDTLS*PSA*CRYPTO*EXTERNAL*RNG and MBEDTLS*CTR*DRBG*C are disabled.

