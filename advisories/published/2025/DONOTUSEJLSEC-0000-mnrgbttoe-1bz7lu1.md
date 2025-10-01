```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbttoe-1bz7lu1"
modified = 2025-10-01T16:09:47.390Z
upstream = ["CVE-2025-52496"]
references = ["https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-1.md", "https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-1.md"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-52496"
imported = 2025-10-01T16:09:47.390Z
modified = 2025-09-22T17:16:48.240Z
published = 2025-07-04T15:15:22.633Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-52496"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-52496"
```

# Mbed TLS before 3.6.4 has a race condition in AESNI detection if certain compiler optimizations occu...

Mbed TLS before 3.6.4 has a race condition in AESNI detection if certain compiler optimizations occur. An attacker may be able to extract an AES key from a multithreaded program, or perform a GCM forgery.

