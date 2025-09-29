```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scwwy-zxa3oa"
modified = 2025-09-23T14:19:17.794Z
upstream = ["CVE-2025-47917"]
references = ["https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-7.md", "https://mbed-tls.readthedocs.io/en/latest/tech-updates/security-advisories/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2025-47917"
modified = 2025-08-07T01:18:26.983Z
published = 2025-07-20T19:15:23.847Z
imported = 2025-09-23T14:19:17.794Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-47917"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-47917"
```

# Mbed TLS before 3.6.4 allows a use-after-free in certain situations of applications that are develop...

Mbed TLS before 3.6.4 allows a use-after-free in certain situations of applications that are developed in accordance with the documentation. The function mbedtls*x509*string*to*names() takes a head argument that is documented as an output argument. The documentation does not suggest that the function will free that pointer; however, the function does call mbedtls*asn1*free*named*data*list() on that argument, which performs a deep free(). As a result, application code that uses this function (relying only on documented behavior) is likely to still hold pointers to the memory blocks that were freed, resulting in a high risk of use-after-free or double-free. In particular, the two sample programs x509/cert*write and x509/cert_req are affected (use-after-free if the san string contains more than one DN).

