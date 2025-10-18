```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3uogyo-tt6fqm"
modified = 2025-10-18T03:16:12.384Z
upstream = ["CVE-2025-5318"]
references = ["https://access.redhat.com/errata/RHSA-2025:18231", "https://access.redhat.com/errata/RHSA-2025:18275", "https://access.redhat.com/security/cve/CVE-2025-5318", "https://bugzilla.redhat.com/show_bug.cgi?id=2369131", "https://www.libssh.org/security/advisories/CVE-2025-5318.txt"]

[[affected]]
pkg = "libssh_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-5318"
imported = 2025-10-18T03:16:12.363Z
modified = 2025-10-17T03:15:35.317Z
published = 2025-06-24T14:15:30.523Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-5318"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-5318"
```

# A flaw was found in the libssh library in versions less than 0.11.2

A flaw was found in the libssh library in versions less than 0.11.2. An out-of-bounds read can be triggered in the sftp_handle function due to an incorrect comparison check that permits the function to access memory beyond the valid handle list and to return an invalid pointer, which is used in further processing. This vulnerability allows an authenticated remote attacker to potentially read unintended memory regions, exposing sensitive information or affect service behavior.

