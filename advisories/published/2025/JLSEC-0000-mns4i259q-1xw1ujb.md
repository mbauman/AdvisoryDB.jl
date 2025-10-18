```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4i259q-1xw1ujb"
modified = 2025-10-18T14:10:41.582Z
upstream = ["CVE-2025-5372"]
references = ["https://access.redhat.com/security/cve/CVE-2025-5372", "https://bugzilla.redhat.com/show_bug.cgi?id=2369388"]

[[affected]]
pkg = "libssh_jll"
ranges = ["< 0.11.3+0"]

[[jlsec_sources]]
id = "CVE-2025-5372"
imported = 2025-10-18T14:10:41.582Z
modified = 2025-08-22T14:01:21.240Z
published = 2025-07-04T06:15:24.930Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-5372"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-5372"
```

# A flaw was found in libssh versions built with OpenSSL versions older than 3.0, specifically in the ...

A flaw was found in libssh versions built with OpenSSL versions older than 3.0, specifically in the ssh_kdf() function responsible for key derivation. Due to inconsistent interpretation of return values where OpenSSL uses 0 to indicate failure and libssh uses 0 for success—the function may mistakenly return a success status even when key derivation fails. This results in uninitialized cryptographic key buffers being used in subsequent communication, potentially compromising SSH sessions' confidentiality, integrity, and availability.

