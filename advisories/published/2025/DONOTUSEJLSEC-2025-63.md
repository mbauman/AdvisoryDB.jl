```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-63"
modified = 2000-09-26T18:39:59Z
published = 2025-09-23T22:07:20.418Z
upstream = ["CVE-2024-6119"]
references = ["https://github.com/openssl/openssl/commit/05f360d9e849a1b277db628f1f13083a7f8dd04f", "https://github.com/openssl/openssl/commit/06d1dc3fa96a2ba5a3e22735a033012aadc9f0d6", "https://github.com/openssl/openssl/commit/621f3729831b05ee828a3203eddb621d014ff2b2", "https://github.com/openssl/openssl/commit/7dfcee2cd2a63b2c64b9b4b0850be64cb695b0a0", "https://openssl-library.org/news/secadv/20240903.txt", "http://www.openwall.com/lists/oss-security/2024/09/03/4", "https://lists.freebsd.org/archives/freebsd-security/2024-September/000303.html", "https://security.netapp.com/advisory/ntap-20240912-0001/"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.0.8+0, < 3.0.15+0"]

[[jlsec_sources]]
id = "CVE-2024-6119"
imported = 2025-09-23T21:56:31.121Z
modified = 2025-06-03T10:51:54.117Z
published = 2024-09-03T16:15:07.177Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-6119"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-6119"
```

# Issue summary: Applications performing certificate name checks (e.g., TLS clients checking server ce...

Issue summary: Applications performing certificate name checks (e.g., TLS clients checking server certificates) may attempt to read an invalid memory address resulting in abnormal termination of the application process.

Impact summary: Abnormal termination of an application can a cause a denial of service.

Applications performing certificate name checks (e.g., TLS clients checking server certificates) may attempt to read an invalid memory address when comparing the expected name with an `otherName` subject alternative name of an X.509 certificate. This may result in an exception that terminates the application program.

Note that basic certificate chain validation (signatures, dates, ...) is not affected, the denial of service can occur only when the application also specifies an expected DNS name, Email address or IP address.

TLS servers rarely solicit client certificates, and even when they do, they generally don't perform a name check against a reference identifier (expected identity), but rather extract the presented identity after checking the certificate chain.  So TLS servers are generally not affected and the severity of the issue is Moderate.

The FIPS modules in 3.3, 3.2, 3.1 and 3.0 are not affected by this issue.

