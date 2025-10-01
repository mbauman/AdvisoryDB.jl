```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbtrwy-zr267i"
modified = 2025-10-01T16:09:45.106Z
upstream = ["CVE-2021-45450"]
references = ["https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v3.1.0", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IL66WKJGXY5AXMTFE7QDMGL3RIBD6PX5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TALJHOYAYSUJTLN6BYGLO4YJGNZUY74W/", "https://security.gentoo.org/glsa/202301-08", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v3.1.0", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IL66WKJGXY5AXMTFE7QDMGL3RIBD6PX5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TALJHOYAYSUJTLN6BYGLO4YJGNZUY74W/", "https://security.gentoo.org/glsa/202301-08"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = [">= 2.24.0+0, < 2.28.0+0"]

[[jlsec_sources]]
id = "CVE-2021-45450"
imported = 2025-10-01T16:09:45.106Z
modified = 2024-11-21T06:32:14.017Z
published = 2021-12-21T07:15:06.727Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-45450"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-45450"
```

# In Mbed TLS before 2.28.0 and 3.x before 3.1.0, psa_cipher_generate_iv and psa_cipher_encrypt allow ...

In Mbed TLS before 2.28.0 and 3.x before 3.1.0, psa_cipher_generate_iv and psa_cipher_encrypt allow policy bypass or oracle-based decryption when the output buffer is at memory locations accessible to an untrusted application.

