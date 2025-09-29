```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scvuv-1ongalf"
modified = 2025-09-23T14:19:16.423Z
upstream = ["CVE-2022-46392"]
references = ["https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.2", "https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.3.0", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4BR7ZCVKLPGCOEEALUHZMFHXQHR6S4QL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6XMKJ5IMJEPXYAHHU56Z4P2FSYIEAESB/", "https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.2", "https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.3.0", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4BR7ZCVKLPGCOEEALUHZMFHXQHR6S4QL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6XMKJ5IMJEPXYAHHU56Z4P2FSYIEAESB/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.28.2+0"]

[database_specific.source]
id = "CVE-2022-46392"
modified = 2025-04-21T15:15:55.880Z
published = 2022-12-15T23:15:10.513Z
imported = 2025-09-23T14:19:16.423Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-46392"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-46392"
```

# An issue was discovered in Mbed TLS before 2.28.2 and 3.x before 3.3.0

An issue was discovered in Mbed TLS before 2.28.2 and 3.x before 3.3.0. An adversary with access to precise enough information about memory accesses (typically, an untrusted operating system attacking a secure enclave) can recover an RSA private key after observing the victim performing a single private-key operation, if the window size (MBEDTLS*MPI*WINDOW_SIZE) used for the exponentiation is 3 or smaller.

