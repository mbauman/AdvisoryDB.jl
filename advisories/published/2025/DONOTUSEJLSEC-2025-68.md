```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-68"
modified = 2025-09-29T02:51:33.558Z
published = 2025-09-23T22:07:20.591Z
aliases = ["CVE-2024-4603"]
references = ["https://github.com/openssl/openssl/commit/3559e868e58005d15c6013a0c1fd832e51c73397", "https://github.com/openssl/openssl/commit/53ea06486d296b890d565fb971b2764fcd826e7e", "https://github.com/openssl/openssl/commit/9c39b3858091c152f52513c066ff2c5a47969f0d", "https://github.com/openssl/openssl/commit/da343d0605c826ef197aceedc67e8e04f065f740", "https://www.openssl.org/news/secadv/20240516.txt", "http://www.openwall.com/lists/oss-security/2024/05/16/2", "https://github.com/openssl/openssl/commit/3559e868e58005d15c6013a0c1fd832e51c73397", "https://github.com/openssl/openssl/commit/53ea06486d296b890d565fb971b2764fcd826e7e", "https://github.com/openssl/openssl/commit/9c39b3858091c152f52513c066ff2c5a47969f0d", "https://github.com/openssl/openssl/commit/da343d0605c826ef197aceedc67e8e04f065f740", "https://security.netapp.com/advisory/ntap-20240621-0001/", "https://www.openssl.org/news/secadv/20240516.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.0.8+0, < 3.0.14+0"]

[[jlsec_sources]]
id = "CVE-2024-4603"
imported = 2025-09-23T21:56:31.539Z
modified = 2024-11-21T09:43:11.753Z
published = 2024-05-16T16:15:10.643Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-4603"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-4603"
[[jlsec_sources]]
id = "EUVD-2024-44212"
imported = 2025-09-23T21:56:31.540Z
modified = 2024-10-14T14:56:01.000Z
published = 2024-05-16T15:21:20.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2024-44212"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2024-44212"
fields = ["affected"]
```

# Issue summary: Checking excessively long DSA keys or parameters may be very

slow.

Issue summary: Checking excessively long DSA keys or parameters may be very slow.

Impact summary: Applications that use the functions EVP*PKEY*param*check() or EVP*PKEY*public*check() to check a DSA public key or DSA parameters may experience long delays. Where the key or parameters that are being checked have been obtained from an untrusted source this may lead to a Denial of Service.

The functions EVP*PKEY*param*check() or EVP*PKEY*public*check() perform various checks on DSA parameters. Some of those computations take a long time if the modulus (`p` parameter) is too large.

Trying to use a very large modulus is slow and OpenSSL will not allow using public keys with a modulus which is over 10,000 bits in length for signature verification. However the key and parameter check functions do not limit the modulus size when performing the checks.

An application that calls EVP*PKEY*param*check() or EVP*PKEY*public*check() and supplies a key or parameters obtained from an untrusted source could be vulnerable to a Denial of Service attack.

These functions are not called by OpenSSL itself on untrusted DSA keys so only applications that directly call these functions may be vulnerable.

Also vulnerable are the OpenSSL pkey and pkeyparam command line applications when using the `-check` option.

The OpenSSL SSL/TLS implementation is not affected by this issue.

The OpenSSL 3.0 and 3.1 FIPS providers are affected by this issue.

