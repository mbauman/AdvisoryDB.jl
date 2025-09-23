```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr4scw38-olv6gb"
modified = 2025-09-23T14:19:16.724Z
upstream = ["CVE-2024-23170"]
references = ["https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GP5UU7Z6LJNBLBT4SC5WWS2HDNMTFZH5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IIBPEYSVRK4IFLBSYJAWKH33YBNH5HR2/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-1/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GP5UU7Z6LJNBLBT4SC5WWS2HDNMTFZH5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IIBPEYSVRK4IFLBSYJAWKH33YBNH5HR2/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-1/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2024-23170"
modified = 2025-06-20T20:15:30.660Z
published = 2024-01-31T08:15:42.220Z
imported = 2025-09-23T14:19:16.724Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-23170"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-23170"
```

# An issue was discovered in Mbed TLS 2.x before 2.28.7 and 3.x before 3.5.2

An issue was discovered in Mbed TLS 2.x before 2.28.7 and 3.x before 3.5.2. There was a timing side channel in RSA private operations. This side channel could be sufficient for a local attacker to recover the plaintext. It requires the attacker to send a large number of messages for decryption, as described in "Everlasting ROBOT: the Marvin Attack" by Hubert Kario.

