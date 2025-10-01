```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbtsk4-66gb6"
modified = 2025-10-01T16:09:45.940Z
upstream = ["CVE-2021-36647"]
references = ["https://github.com/ARMmbed/mbedtls/releases/", "https://kouzili.com/Load-Step.pdf", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-07-1", "https://github.com/ARMmbed/mbedtls/releases/", "https://kouzili.com/Load-Step.pdf", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-07-1"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.27.0+0", ">= 2.28.0+0"]

[[jlsec_sources]]
id = "CVE-2021-36647"
imported = 2025-10-01T16:09:45.940Z
modified = 2025-04-08T21:15:44.210Z
published = 2023-01-17T21:15:10.880Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-36647"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-36647"
```

# Use of a Broken or Risky Cryptographic Algorithm in the function mbedtls_mpi_exp_mod() in lignum.c i...

Use of a Broken or Risky Cryptographic Algorithm in the function mbedtls_mpi_exp_mod() in lignum.c in Mbed TLS Mbed TLS all versions before 3.0.0, 2.27.0 or 2.16.11 allows attackers with access to precise enough timing and memory access information (typically an untrusted operating system attacking a secure enclave such as SGX or the TrustZone secure world) to recover the private keys used in RSA.

