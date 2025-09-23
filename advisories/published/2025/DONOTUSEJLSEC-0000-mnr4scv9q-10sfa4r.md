```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scv9q-10sfa4r"
modified = 2025-09-23T14:19:15.662Z
upstream = ["CVE-2019-18222"]
references = ["https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/A3GWQNONS7GRORXZJ7MOJFUEJ2ZJ4OUW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NGDACU65MYZXXVPQP2EBHUJGOR4RWLVY/", "https://tls.mbed.org/tech-updates/security-advisories", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2019-12", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/A3GWQNONS7GRORXZJ7MOJFUEJ2ZJ4OUW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NGDACU65MYZXXVPQP2EBHUJGOR4RWLVY/", "https://tls.mbed.org/tech-updates/security-advisories", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2019-12"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.6+0"]

[database_specific.source]
id = "CVE-2019-18222"
modified = 2024-11-21T04:32:52.030Z
published = 2020-01-23T17:15:11.893Z
imported = 2025-09-23T14:19:15.662Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-18222"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-18222"
```

# The ECDSA signature implementation in ecdsa.c in Arm Mbed Crypto 2.1 and Mbed TLS through 2.19.1 doe...

The ECDSA signature implementation in ecdsa.c in Arm Mbed Crypto 2.1 and Mbed TLS through 2.19.1 does not reduce the blinded scalar before computing the inverse, which allows a local attacker to recover the private key via side-channel attacks.

