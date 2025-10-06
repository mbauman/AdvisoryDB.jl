```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-47"
modified = 2025-10-03T10:34:06.761Z
published = 2025-09-23T22:07:20.290Z
upstream = ["CVE-2022-4304"]
references = ["https://security.gentoo.org/glsa/202402-08", "https://www.openssl.org/news/secadv/20230207.txt", "https://security.gentoo.org/glsa/202402-08", "https://www.openssl.org/news/secadv/20230207.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.20+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2022-4304"
imported = 2025-09-23T21:56:31.088Z
modified = 2025-03-20T21:15:14.890Z
published = 2023-02-08T20:15:23.887Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-4304"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-4304"
```

# A timing based side channel exists in the OpenSSL RSA Decryption implementation which could be suffi...

A timing based side channel exists in the OpenSSL RSA Decryption implementation which could be sufficient to recover a plaintext across a network in a Bleichenbacher style attack. To achieve a successful decryption an attacker would have to be able to send a very large number of trial messages for decryption. The vulnerability affects all RSA padding modes: PKCS#1 v1.5, RSA-OEAP and RSASVE.

For example, in a TLS connection, RSA is commonly used by a client to send an encrypted pre-master secret to the server. An attacker that had observed a genuine connection between a client and a server could use this flaw to send trial messages to the server and record the time taken to process them. After a sufficiently large number of messages the attacker could recover the pre-master secret used for the original connection and thus be able to decrypt the application data sent over that connection.

