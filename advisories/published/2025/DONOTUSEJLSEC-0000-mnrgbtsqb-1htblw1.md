```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbtsqb-1htblw1"
modified = 2025-10-01T16:09:46.163Z
upstream = ["CVE-2023-52353"]
references = ["https://github.com/Mbed-TLS/mbedtls/issues/8654", "https://github.com/Mbed-TLS/mbedtls/issues/8654"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-52353"
imported = 2025-10-01T16:09:46.163Z
modified = 2025-05-30T15:15:27.850Z
published = 2024-01-21T23:15:44.220Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-52353"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-52353"
```

# An issue was discovered in Mbed TLS through 3.5.1

An issue was discovered in Mbed TLS through 3.5.1. In mbedtls_ssl_session_reset, the maximum negotiable TLS version is mishandled. For example, if the last connection negotiated TLS 1.2, then 1.2 becomes the new maximum.

