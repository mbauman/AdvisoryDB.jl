```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scvb1-1g6zyae"
modified = 2025-09-23T14:19:15.709Z
upstream = ["CVE-2020-36477"]
references = ["https://github.com/ARMmbed/mbedtls/issues/3498", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://security.gentoo.org/glsa/202301-08", "https://github.com/ARMmbed/mbedtls/issues/3498", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://security.gentoo.org/glsa/202301-08"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.24.0+0"]

[database_specific.source]
id = "CVE-2020-36477"
modified = 2024-11-21T05:29:38.067Z
published = 2021-08-23T02:15:07.043Z
imported = 2025-09-23T14:19:15.709Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36477"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36477"
```

# An issue was discovered in Mbed TLS before 2.24.0

An issue was discovered in Mbed TLS before 2.24.0. The verification of X.509 certificates when matching the expected common name (the cn argument of mbedtls*x509*crt_verify) with the actual certificate name is mishandled: when the subjecAltName extension is present, the expected name is compared to any name in that extension regardless of its type. This means that an attacker could impersonate a 4-byte or 16-byte domain by getting a certificate for the corresponding IPv4 or IPv6 address (this would require the attacker to control that IP address, though).

