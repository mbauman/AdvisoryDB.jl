```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scw73-k703f3"
modified = 2025-09-23T14:19:16.863Z
upstream = ["CVE-2024-23775"]
references = ["https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GP5UU7Z6LJNBLBT4SC5WWS2HDNMTFZH5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IIBPEYSVRK4IFLBSYJAWKH33YBNH5HR2/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GP5UU7Z6LJNBLBT4SC5WWS2HDNMTFZH5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IIBPEYSVRK4IFLBSYJAWKH33YBNH5HR2/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-2/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2024-23775"
modified = 2025-05-29T15:15:30.993Z
published = 2024-01-31T08:15:42.267Z
imported = 2025-09-23T14:19:16.863Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-23775"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-23775"
```

# Integer Overflow vulnerability in Mbed TLS 2.x before 2.28.7 and 3.x before 3.5.2, allows attackers ...

Integer Overflow vulnerability in Mbed TLS 2.x before 2.28.7 and 3.x before 3.5.2, allows attackers to cause a denial of service (DoS) via mbedtls*x509*set_extension().

