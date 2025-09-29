```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scwpn-es6cn"
modified = 2025-09-23T14:19:17.531Z
upstream = ["CVE-2025-52497"]
references = ["https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-2.md"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2025-52497"
modified = 2025-07-17T16:00:42.443Z
published = 2025-07-04T15:15:22.787Z
imported = 2025-09-23T14:19:17.531Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-52497"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-52497"
```

# Mbed TLS before 3.6.4 has a PEM parsing one-byte heap-based buffer underflow, in mbedtls*pem*read_bu...

Mbed TLS before 3.6.4 has a PEM parsing one-byte heap-based buffer underflow, in mbedtls*pem*read*buffer and two mbedtls*pk_parse functions, via untrusted PEM input.

