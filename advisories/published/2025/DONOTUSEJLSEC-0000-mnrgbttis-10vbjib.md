```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbttis-10vbjib"
modified = 2025-10-01T16:09:47.188Z
upstream = ["CVE-2025-27809"]
references = ["https://github.com/Mbed-TLS/mbedtls/releases", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-03-1/", "https://github.com/Mbed-TLS/mbedtls/issues/466", "https://mastodon.social/@bagder/114219540623402700"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-27809"
imported = 2025-10-01T16:09:47.188Z
modified = 2025-07-17T15:57:21.527Z
published = 2025-03-25T06:15:41.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-27809"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-27809"
```

# Mbed TLS before 2.28.10 and 3.x before 3.6.3, on the client side, accepts servers that have trusted ...

Mbed TLS before 2.28.10 and 3.x before 3.6.3, on the client side, accepts servers that have trusted certificates for arbitrary hostnames unless the TLS client application calls mbedtls_ssl_set_hostname.

