```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbtrwu-141f1jh"
modified = 2025-10-01T16:09:45.102Z
upstream = ["CVE-2020-36478"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-756638.pdf", "https://github.com/ARMmbed/mbedtls/issues/3629", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.9", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.25.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.18", "https://lists.debian.org/debian-lts-announce/2021/11/msg00021.html", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://cert-portal.siemens.com/productcert/pdf/ssa-756638.pdf", "https://github.com/ARMmbed/mbedtls/issues/3629", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.9", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.25.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.18", "https://lists.debian.org/debian-lts-announce/2021/11/msg00021.html", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.25.0+0"]

[[jlsec_sources]]
id = "CVE-2020-36478"
imported = 2025-10-01T16:09:45.102Z
modified = 2024-11-21T05:29:38.247Z
published = 2021-08-23T02:15:07.097Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36478"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36478"
```

# An issue was discovered in Mbed TLS before 2.25.0 (and before 2.16.9 LTS and before 2.7.18 LTS)

An issue was discovered in Mbed TLS before 2.25.0 (and before 2.16.9 LTS and before 2.7.18 LTS). A NULL algorithm parameters entry looks identical to an array of REAL (size zero) and thus the certificate is considered valid. However, if the parameters do not match in any way, then the certificate should be considered invalid.

