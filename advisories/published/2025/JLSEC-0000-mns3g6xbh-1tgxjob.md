```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3g6xbh-1tgxjob"
modified = 2025-10-17T20:30:39.149Z
upstream = ["CVE-2025-30258"]
references = ["https://dev.gnupg.org/T7527", "https://dev.gnupg.org/rG48978ccb4e20866472ef18436a32744350a65158", "https://lists.gnupg.org/pipermail/gnupg-announce/2025q1/000491.html"]

[[affected]]
pkg = "GnuPG_jll"
ranges = ["< 2.4.8+0"]

[[jlsec_sources]]
id = "CVE-2025-30258"
imported = 2025-10-17T20:30:39.149Z
modified = 2025-10-16T16:53:07.557Z
published = 2025-03-19T20:15:20.140Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-30258"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-30258"
```

# In GnuPG before 2.5.5, if a user chooses to import a certificate with certain crafted subkey data th...

In GnuPG before 2.5.5, if a user chooses to import a certificate with certain crafted subkey data that lacks a valid backsig or that has incorrect usage flags, the user loses the ability to verify signatures made from certain other signing keys, aka a "verification DoS."

