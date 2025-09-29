```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scv9o-3dinm2"
modified = 2025-09-23T14:19:15.660Z
upstream = ["CVE-2019-16910"]
references = ["https://github.com/ARMmbed/mbedtls/commit/298a43a77ec0ed2c19a8c924ddd8571ef3e65dfd", "https://github.com/ARMmbed/mbedtls/commit/33f66ba6fd234114aa37f0209dac031bb2870a9b", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/CGSKQSGR5SOBRBXDSSPTCDSBB5K3GMPF/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/CSFFOROD6IVLADZHNJC2LPDV7FQRP7XB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PEHHH2DOBXB25CAU3Q6E66X723VAYTB5/", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2019-10", "https://github.com/ARMmbed/mbedtls/commit/298a43a77ec0ed2c19a8c924ddd8571ef3e65dfd", "https://github.com/ARMmbed/mbedtls/commit/33f66ba6fd234114aa37f0209dac031bb2870a9b", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/CGSKQSGR5SOBRBXDSSPTCDSBB5K3GMPF/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/CSFFOROD6IVLADZHNJC2LPDV7FQRP7XB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PEHHH2DOBXB25CAU3Q6E66X723VAYTB5/", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2019-10"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.6+0"]

[database_specific.source]
id = "CVE-2019-16910"
modified = 2024-11-21T04:31:19.680Z
published = 2019-09-26T13:15:10.790Z
imported = 2025-09-23T14:19:15.660Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-16910"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-16910"
```

# Arm Mbed TLS before 2.19.0 and Arm Mbed Crypto before 2.0.0, when deterministic ECDSA is enabled, us...

Arm Mbed TLS before 2.19.0 and Arm Mbed Crypto before 2.0.0, when deterministic ECDSA is enabled, use an RNG with insufficient entropy for blinding, which might allow an attacker to recover a private key via side-channel attacks if a victim signs the same message many times. (For Mbed TLS, the fix is also available in versions 2.7.12 and 2.16.3.)

