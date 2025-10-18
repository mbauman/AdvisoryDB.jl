```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4i259t-1s0f4on"
modified = 2025-10-18T14:10:41.585Z
upstream = ["CVE-2025-8114"]
references = ["https://access.redhat.com/security/cve/CVE-2025-8114", "https://bugzilla.redhat.com/show_bug.cgi?id=2383220"]

[[affected]]
pkg = "libssh_jll"
ranges = ["< 0.11.3+0"]

[[jlsec_sources]]
id = "CVE-2025-8114"
imported = 2025-10-18T14:10:41.585Z
modified = 2025-08-14T00:45:36.510Z
published = 2025-07-24T15:15:27.117Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-8114"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-8114"
```

# A flaw was found in libssh, a library that implements the SSH protocol

A flaw was found in libssh, a library that implements the SSH protocol. When calculating the session ID during the key exchange (KEX) process, an allocation failure in cryptographic functions may lead to a NULL pointer dereference. This issue can cause the client or server to crash.

