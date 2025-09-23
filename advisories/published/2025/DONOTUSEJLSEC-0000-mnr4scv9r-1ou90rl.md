```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scv9r-1ou90rl"
modified = 2025-09-23T14:19:15.663Z
upstream = ["CVE-2020-10932"]
references = ["https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FCWN5HIF4CJ2LZTOMEBJ7Q4IMMV7ZU2V/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZNOS2IIBH5WNJXZUV546PY7666DE7Y3L/", "https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.6-and-2.7.15-released", "https://tls.mbed.org/tech-updates/security-advisories", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-04", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FCWN5HIF4CJ2LZTOMEBJ7Q4IMMV7ZU2V/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZNOS2IIBH5WNJXZUV546PY7666DE7Y3L/", "https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.6-and-2.7.15-released", "https://tls.mbed.org/tech-updates/security-advisories", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-04"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.6+0"]

[database_specific.source]
id = "CVE-2020-10932"
modified = 2024-11-21T04:56:23.837Z
published = 2020-04-15T14:15:20.123Z
imported = 2025-09-23T14:19:15.663Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-10932"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-10932"
```

# An issue was discovered in Arm Mbed TLS before 2.16.6 and 2.7.x before 2.7.15

An issue was discovered in Arm Mbed TLS before 2.16.6 and 2.7.x before 2.7.15. An attacker that can get precise enough side-channel measurements can recover the long-term ECDSA private key by (1) reconstructing the projective coordinate of the result of scalar multiplication by exploiting side channels in the conversion to affine coordinates; (2) using an attack described by Naccache, Smart, and Stern in 2003 to recover a few bits of the ephemeral scalar from those projective coordinates via several measurements; and (3) using a lattice attack to get from there to the long-term ECDSA private key used for the signatures. Typically an attacker would have sufficient access when attacking an SGX enclave and controlling the untrusted OS.

