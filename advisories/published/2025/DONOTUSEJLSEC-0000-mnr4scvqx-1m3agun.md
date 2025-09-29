```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scvqx-1m3agun"
modified = 2025-09-23T14:19:16.281Z
upstream = ["CVE-2021-43666"]
references = ["https://github.com/ARMmbed/mbedtls/issues/5136", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://github.com/ARMmbed/mbedtls/issues/5136", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2021-43666"
modified = 2024-11-21T06:29:34.620Z
published = 2022-03-24T18:15:08.333Z
imported = 2025-09-23T14:19:16.281Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-43666"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-43666"
```

# A Denial of Service vulnerability exists in mbed TLS 3.0.0 and earlier in the mbedtls*pkcs12*derivat...

A Denial of Service vulnerability exists in mbed TLS 3.0.0 and earlier in the mbedtls*pkcs12*derivation function when an input password's length is 0.

