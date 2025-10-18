```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns4i259r-12ln1su"
modified = 2025-10-18T14:10:41.583Z
upstream = ["CVE-2025-5351"]
references = ["https://access.redhat.com/security/cve/CVE-2025-5351", "https://bugzilla.redhat.com/show_bug.cgi?id=2369367"]

[[affected]]
pkg = "libssh_jll"
ranges = ["< 0.11.3+0"]

[[jlsec_sources]]
id = "CVE-2025-5351"
imported = 2025-10-18T14:10:41.583Z
modified = 2025-08-22T13:50:58.653Z
published = 2025-07-04T09:15:37.100Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-5351"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-5351"
```

# A flaw was found in the key export functionality of libssh

A flaw was found in the key export functionality of libssh. The issue occurs in the internal function responsible for converting cryptographic keys into serialized formats. During error handling, a memory structure is freed but not cleared, leading to a potential double free issue if an additional failure occurs later in the function. This condition may result in heap corruption or application instability in low-memory scenarios, posing a risk to system reliability where key export operations are performed.

