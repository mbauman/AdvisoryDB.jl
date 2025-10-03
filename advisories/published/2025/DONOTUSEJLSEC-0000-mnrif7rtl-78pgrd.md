```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrif7rtl-78pgrd"
modified = 2025-10-03T03:20:09.369Z
aliases = ["CVE-2025-9231"]
references = ["https://github.com/openssl/openssl/commit/567f64386e43683888212226824b6a179885a0fe", "https://github.com/openssl/openssl/commit/cba616c26ac8e7b37de5e77762e505ba5ca51698", "https://github.com/openssl/openssl/commit/eed5adc9f969d77c94f213767acbb41ff923b6f4", "https://github.com/openssl/openssl/commit/fc47a2ec078912b3e914fab5734535e76c4820c2", "https://openssl-library.org/news/secadv/20250930.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.5.0+0, < 3.5.4+0"]

[[jlsec_sources]]
id = "CVE-2025-9231"
imported = 2025-10-03T03:20:09.369Z
modified = 2025-10-02T19:12:17.160Z
published = 2025-09-30T14:15:41.190Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-9231"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-9231"
[[jlsec_sources]]
id = "EUVD-2025-31728"
imported = 2025-10-03T03:20:09.789Z
modified = 2025-09-30T21:31:16.000Z
published = 2025-09-30T15:30:30.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-31728"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-31728"
fields = ["affected"]
```

# Issue summary: A timing side-channel which could potentially allow remote recovery of the private ke...

Issue summary: A timing side-channel which could potentially allow remote
recovery of the private key exists in the SM2 algorithm implementation on 64 bit
ARM platforms.

Impact summary: A timing side-channel in SM2 signature computations on 64 bit
ARM platforms could allow recovering the private key by an attacker..

While remote key recovery over a network was not attempted by the reporter,
timing measurements revealed a timing signal which may allow such an attack.

OpenSSL does not directly support certificates with SM2 keys in TLS, and so
this CVE is not relevant in most TLS contexts.  However, given that it is
possible to add support for such certificates via a custom provider, coupled
with the fact that in such a custom provider context the private key may be
recoverable via remote timing measurements, we consider this to be a Moderate
severity issue.

The FIPS modules in 3.5, 3.4, 3.3, 3.2, 3.1 and 3.0 are not affected by this
issue, as SM2 is not an approved algorithm.

