```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3uokp2-1kjp2aw"
modified = 2025-10-18T03:16:17.222Z
upstream = ["CVE-2025-54350"]
references = ["https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a", "https://github.com/esnet/iperf/releases/tag/3.19.1"]

[[affected]]
pkg = "iperf_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-54350"
imported = 2025-10-18T03:16:17.222Z
modified = 2025-10-17T19:59:44.643Z
published = 2025-08-03T02:15:37.193Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-54350"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-54350"
```

# In iperf before 3.19.1, iperf_auth.c has a Base64Decode assertion failure and application exit upon ...

In iperf before 3.19.1, iperf_auth.c has a Base64Decode assertion failure and application exit upon a malformed authentication attempt.

