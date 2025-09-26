```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-67"
modified = 2025-09-26T19:24:29.391Z
published = 2025-09-23T22:07:20.588Z
aliases = ["CVE-2023-6237"]
references = ["https://github.com/openssl/openssl/commit/0b0f7abfb37350794a4b8960fafc292cd5d1b84d", "https://github.com/openssl/openssl/commit/18c02492138d1eb8b6548cb26e7b625fb2414a2a", "https://github.com/openssl/openssl/commit/a830f551557d3d66a84bbb18a5b889c640c36294", "https://www.openssl.org/news/secadv/20240115.txt", "http://www.openwall.com/lists/oss-security/2024/03/11/1", "https://github.com/openssl/openssl/commit/0b0f7abfb37350794a4b8960fafc292cd5d1b84d", "https://github.com/openssl/openssl/commit/18c02492138d1eb8b6548cb26e7b625fb2414a2a", "https://github.com/openssl/openssl/commit/a830f551557d3d66a84bbb18a5b889c640c36294", "https://security.netapp.com/advisory/ntap-20240531-0007/", "https://www.openssl.org/news/secadv/20240115.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.0.8+0, < 3.0.13+0"]

[[jlsec_sources]]
id = "CVE-2023-6237"
imported = 2025-09-23T21:56:31.490Z
modified = 2024-11-21T08:43:25.997Z
published = 2024-04-25T07:15:45.270Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-6237"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-6237"
[[jlsec_sources]]
id = "EUVD-2023-58483"
imported = 2025-09-23T21:56:31.515Z
modified = 2024-11-01T14:28:51.000Z
published = 2024-04-25T06:27:26.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2023-58483"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2023-58483"
fields = ["affected"]
```

# Issue summary: Checking excessively long invalid RSA public keys may take

a long time.

Issue summary: Checking excessively long invalid RSA public keys may take a long time.

Impact summary: Applications that use the function EVP*PKEY*public_check() to check RSA public keys may experience long delays. Where the key that is being checked has been obtained from an untrusted source this may lead to a Denial of Service.

When function EVP*PKEY*public_check() is called on RSA public keys, a computation is done to confirm that the RSA modulus, n, is composite. For valid RSA keys, n is a product of two or more large primes and this computation completes quickly. However, if n is an overly large prime, then this computation would take a long time.

An application that calls EVP*PKEY*public_check() and supplies an RSA key obtained from an untrusted source could be vulnerable to a Denial of Service attack.

The function EVP*PKEY*public_check() is not called from other OpenSSL functions however it is called from the OpenSSL pkey command line application. For that reason that application is also vulnerable if used with the '-pubin' and '-check' options on untrusted data.

The OpenSSL SSL/TLS implementation is not affected by this issue.

The OpenSSL 3.0 and 3.1 FIPS providers are affected by this issue.

