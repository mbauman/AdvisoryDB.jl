```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scwta-7ejjvo"
modified = 2025-09-23T14:19:17.662Z
upstream = ["CVE-2025-48965"]
references = ["https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-6.md", "https://mbed-tls.readthedocs.io/en/latest/tech-updates/security-advisories/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2025-48965"
modified = 2025-08-07T01:14:49.980Z
published = 2025-07-20T18:15:22.950Z
imported = 2025-09-23T14:19:17.662Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-48965"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-48965"
```

# Mbed TLS before 3.6.4 has a NULL pointer dereference because mbedtls*asn1*store*named*data can trigg...

Mbed TLS before 3.6.4 has a NULL pointer dereference because mbedtls*asn1*store*named*data can trigger conflicting data with val.p of NULL but val.len greater than zero.

