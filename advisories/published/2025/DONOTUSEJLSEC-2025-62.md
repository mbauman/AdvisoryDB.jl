```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-62"
modified = 2025-09-26T19:24:29.391Z
published = 2025-09-23T22:07:20.415Z
upstream = ["CVE-2024-0727"]
references = ["https://github.com/openssl/openssl/commit/09df4395b5071217b76dc7d3d2e630eb8c5a79c2", "https://github.com/openssl/openssl/commit/775acfdbd0c6af9ac855f34969cdab0c0c90844a", "https://github.com/openssl/openssl/commit/d135eeab8a5dbf72b3da5240bab9ddb7678dbd2c", "https://github.openssl.org/openssl/extended-releases/commit/03b3941d60c4bce58fab69a0c22377ab439bc0e8", "https://github.openssl.org/openssl/extended-releases/commit/aebaa5883e31122b404e450732dc833dc9dee539", "https://www.openssl.org/news/secadv/20240125.txt", "http://www.openwall.com/lists/oss-security/2024/03/11/1", "https://github.com/openssl/openssl/commit/09df4395b5071217b76dc7d3d2e630eb8c5a79c2", "https://github.com/openssl/openssl/commit/775acfdbd0c6af9ac855f34969cdab0c0c90844a", "https://github.com/openssl/openssl/commit/d135eeab8a5dbf72b3da5240bab9ddb7678dbd2c", "https://github.openssl.org/openssl/extended-releases/commit/03b3941d60c4bce58fab69a0c22377ab439bc0e8", "https://github.openssl.org/openssl/extended-releases/commit/aebaa5883e31122b404e450732dc833dc9dee539", "https://security.netapp.com/advisory/ntap-20240208-0006/", "https://www.openssl.org/news/secadv/20240125.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 3.0.13+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2024-0727"
imported = 2025-09-23T21:56:31.120Z
modified = 2025-05-29T16:15:31.960Z
published = 2024-01-26T09:15:07.637Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-0727"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-0727"
```

# Issue summary: Processing a maliciously formatted PKCS12 file may lead OpenSSL to crash leading to a...

Issue summary: Processing a maliciously formatted PKCS12 file may lead OpenSSL to crash leading to a potential Denial of Service attack

Impact summary: Applications loading files in the PKCS12 format from untrusted sources might terminate abruptly.

A file in PKCS12 format can contain certificates and keys and may come from an untrusted source. The PKCS12 specification allows certain fields to be NULL, but OpenSSL does not correctly check for this case. This can lead to a NULL pointer dereference that results in OpenSSL crashing. If an application processes PKCS12 files from an untrusted source using the OpenSSL APIs then that application will be vulnerable to this issue.

OpenSSL APIs that are vulnerable to this are: PKCS12*parse(), PKCS12*unpack*p7data(), PKCS12*unpack*p7encdata(), PKCS12*unpack*authsafes() and PKCS12*newpass().

We have also fixed a similar issue in SMIME*write*PKCS7(). However since this function is related to writing data we do not consider it security significant.

The FIPS modules in 3.2, 3.1 and 3.0 are not affected by this issue.

