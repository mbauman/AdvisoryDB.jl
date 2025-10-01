```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrgbtrv6-13qcc29"
modified = 2025-10-01T16:09:45.042Z
upstream = ["CVE-2020-10941"]
references = ["https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5JPE2HFBDJF3UBT6Q4VWLKNKCVCMX25J/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/WD6OSOLLAR2AVPJAMGUKWRXN6477IHHV/", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-02", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5JPE2HFBDJF3UBT6Q4VWLKNKCVCMX25J/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/WD6OSOLLAR2AVPJAMGUKWRXN6477IHHV/", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-02"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.6+0"]

[[jlsec_sources]]
id = "CVE-2020-10941"
imported = 2025-10-01T16:09:45.042Z
modified = 2024-11-21T04:56:25.167Z
published = 2020-03-24T20:15:14.867Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-10941"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-10941"
```

# Arm Mbed TLS before 2.16.5 allows attackers to obtain sensitive information (an RSA private key) by ...

Arm Mbed TLS before 2.16.5 allows attackers to obtain sensitive information (an RSA private key) by measuring cache usage during an import.

