```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-56"
modified = 2025-09-26T13:32:05.000Z
published = 2025-09-23T22:07:20.398Z
upstream = ["CVE-2023-2975"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=00e2f5eea29994d19293ec4e8c8775ba73678598", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=6a83f0c958811f07e0d11dfc6b5a6a98edfd5bdc", "https://www.openssl.org/news/secadv/20230714.txt", "http://www.openwall.com/lists/oss-security/2023/07/15/1", "http://www.openwall.com/lists/oss-security/2023/07/19/5", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=00e2f5eea29994d19293ec4e8c8775ba73678598", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=6a83f0c958811f07e0d11dfc6b5a6a98edfd5bdc", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230725-0004/", "https://www.openssl.org/news/secadv/20230714.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.0.8+0, < 3.0.10+0"]

[[jlsec_sources]]
id = "CVE-2023-2975"
imported = 2025-09-23T21:56:31.099Z
modified = 2025-04-23T17:16:32.467Z
published = 2023-07-14T12:15:09.023Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-2975"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-2975"
```

# Issue summary: The AES-SIV cipher implementation contains a bug that causes it to ignore empty assoc...

Issue summary: The AES-SIV cipher implementation contains a bug that causes it to ignore empty associated data entries which are unauthenticated as a consequence.

Impact summary: Applications that use the AES-SIV algorithm and want to authenticate empty data entries as associated data can be misled by removing, adding or reordering such empty entries as these are ignored by the OpenSSL implementation. We are currently unaware of any such applications.

The AES-SIV algorithm allows for authentication of multiple associated data entries along with the encryption. To authenticate empty data the application has to call EVP*EncryptUpdate() (or EVP*CipherUpdate()) with NULL pointer as the output buffer and 0 as the input buffer length. The AES-SIV implementation in OpenSSL just returns success for such a call instead of performing the associated data authentication operation. The empty data thus will not be authenticated.

As this issue does not affect non-empty associated data authentication and we expect it to be rare for an application to use empty associated data entries this is qualified as Low severity issue.

