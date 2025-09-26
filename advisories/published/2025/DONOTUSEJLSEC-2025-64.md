```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-64"
modified = 2025-09-26T17:16:58.363Z
published = 2025-09-23T22:07:20.579Z
aliases = ["CVE-2025-4575"]
references = ["https://github.com/openssl/openssl/commit/e96d22446e633d117e6c9904cb15b4693e956eaa", "https://openssl-library.org/news/secadv/20250522.txt", "http://www.openwall.com/lists/oss-security/2025/05/22/1"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.5.0+0, < 3.5.1+0"]

[[jlsec_sources]]
id = "CVE-2025-4575"
imported = 2025-09-23T21:56:31.344Z
modified = 2025-05-23T15:55:02.040Z
published = 2025-05-22T14:16:07.630Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-4575"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-4575"
[[jlsec_sources]]
id = "EUVD-2025-16129"
imported = 2025-09-23T21:56:31.345Z
modified = 2025-05-22T18:31:15.000Z
published = 2025-05-22T15:34:50.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-16129"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-16129"
fields = ["affected"]
```

# Issue summary: Use of -addreject option with the openssl x509 application adds a trusted use instead...

Issue summary: Use of -addreject option with the openssl x509 application adds a trusted use instead of a rejected use for a certificate.

Impact summary: If a user intends to make a trusted certificate rejected for a particular use it will be instead marked as trusted for that use.

A copy & paste error during minor refactoring of the code introduced this issue in the OpenSSL 3.5 version. If, for example, a trusted CA certificate should be trusted only for the purpose of authenticating TLS servers but not for CMS signature verification and the CMS signature verification is intended to be marked as rejected with the -addreject option, the resulting CA certificate will be trusted for CMS signature verification purpose instead.

Only users which use the trusted certificate format who use the openssl x509 command line application to add rejected uses are affected by this issue. The issues affecting only the command line application are considered to be Low severity.

The FIPS modules in 3.5, 3.4, 3.3, 3.2, 3.1 and 3.0 are not affected by this issue.

OpenSSL 3.4, 3.3, 3.2, 3.1, 3.0, 1.1.1 and 1.0.2 are also not affected by this issue.

