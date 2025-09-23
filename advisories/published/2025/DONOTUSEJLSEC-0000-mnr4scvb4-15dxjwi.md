```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scvb4-15dxjwi"
modified = 2025-09-23T14:19:15.712Z
upstream = ["CVE-2021-45451"]
references = ["https://github.com/ARMmbed/mbedtls/releases/tag/v3.1.0", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IL66WKJGXY5AXMTFE7QDMGL3RIBD6PX5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TALJHOYAYSUJTLN6BYGLO4YJGNZUY74W/", "https://github.com/ARMmbed/mbedtls/releases/tag/v3.1.0", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IL66WKJGXY5AXMTFE7QDMGL3RIBD6PX5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TALJHOYAYSUJTLN6BYGLO4YJGNZUY74W/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2021-45451"
modified = 2024-11-21T06:32:14.177Z
published = 2021-12-21T07:15:06.860Z
imported = 2025-09-23T14:19:15.712Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-45451"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-45451"
```

# In Mbed TLS before 3.1.0, psa*aead*generate_nonce allows policy bypass or oracle-based decryption wh...

In Mbed TLS before 3.1.0, psa*aead*generate_nonce allows policy bypass or oracle-based decryption when the output buffer is at memory locations accessible to an untrusted application.

