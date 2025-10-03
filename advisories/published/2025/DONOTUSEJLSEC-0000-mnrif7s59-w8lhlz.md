```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrif7s59-w8lhlz"
modified = 2025-10-03T03:20:09.789Z
aliases = ["CVE-2025-9232"]
references = ["https://github.com/openssl/openssl/commit/2b4ec20e47959170422922eaff25346d362dcb35", "https://github.com/openssl/openssl/commit/654dc11d23468a74fc8ea4672b702dd3feb7be4b", "https://github.com/openssl/openssl/commit/7cf21a30513c9e43c4bc3836c237cf086e194af3", "https://github.com/openssl/openssl/commit/89e790ac431125a4849992858490bed6b225eadf", "https://github.com/openssl/openssl/commit/bbf38c034cdabd0a13330abcc4855c866f53d2e0", "https://openssl-library.org/news/secadv/20250930.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.0.16+0, < 3.5.4+0"]

[[jlsec_sources]]
id = "CVE-2025-9232"
imported = 2025-10-03T03:20:09.789Z
modified = 2025-10-02T19:12:17.160Z
published = 2025-09-30T14:15:41.313Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-9232"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-9232"
[[jlsec_sources]]
id = "EUVD-2025-31727"
imported = 2025-10-03T03:20:09.981Z
modified = 2025-09-30T21:31:16.000Z
published = 2025-09-30T15:30:30.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-31727"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-31727"
fields = ["affected"]
```

# Issue summary: An application using the OpenSSL HTTP client API functions may trigger an out-of-boun...

Issue summary: An application using the OpenSSL HTTP client API functions may
trigger an out-of-bounds read if the 'no_proxy' environment variable is set and
the host portion of the authority component of the HTTP URL is an IPv6 address.

Impact summary: An out-of-bounds read can trigger a crash which leads to
Denial of Service for an application.

The OpenSSL HTTP client API functions can be used directly by applications
but they are also used by the OCSP client functions and CMP (Certificate
Management Protocol) client implementation in OpenSSL. However the URLs used
by these implementations are unlikely to be controlled by an attacker.

In this vulnerable code the out of bounds read can only trigger a crash.
Furthermore the vulnerability requires an attacker-controlled URL to be
passed from an application to the OpenSSL function and the user has to have
a 'no_proxy' environment variable set. For the aforementioned reasons the
issue was assessed as Low severity.

The vulnerable code was introduced in the following patch releases:
3.0.16, 3.1.8, 3.2.4, 3.3.3, 3.4.0 and 3.5.0.

The FIPS modules in 3.5, 3.4, 3.3, 3.2, 3.1 and 3.0 are not affected by this
issue, as the HTTP client implementation is outside the OpenSSL FIPS module
boundary.

