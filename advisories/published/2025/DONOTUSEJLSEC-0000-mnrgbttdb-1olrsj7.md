```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbttdb-1olrsj7"
modified = 2025-10-01T16:09:46.991Z
upstream = ["CVE-2024-45157"]
references = ["https://github.com/Mbed-TLS/mbedtls/releases/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-08-1/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = [">= 2.26.0+0"]

[[jlsec_sources]]
id = "CVE-2024-45157"
imported = 2025-10-01T16:09:46.991Z
modified = 2025-03-14T17:15:47.320Z
published = 2024-09-05T19:15:12.960Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-45157"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-45157"
```

# An issue was discovered in Mbed TLS before 2.28.9 and 3.x before 3.6.1, in which the user-selected a...

An issue was discovered in Mbed TLS before 2.28.9 and 3.x before 3.6.1, in which the user-selected algorithm is not used. Unlike previously documented, enabling MBEDTLS_PSA_HMAC_DRBG_MD_TYPE does not cause the PSA subsystem to use HMAC_DRBG: it uses HMAC_DRBG only when MBEDTLS_PSA_CRYPTO_EXTERNAL_RNG and MBEDTLS_CTR_DRBG_C are disabled.

