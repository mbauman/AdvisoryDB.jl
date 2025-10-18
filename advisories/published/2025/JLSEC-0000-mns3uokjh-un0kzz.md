```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3uokjh-un0kzz"
modified = 2025-10-18T03:16:17.021Z
upstream = ["CVE-2025-54349"]
references = ["https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf", "https://github.com/esnet/iperf/releases/tag/3.19.1"]

[[affected]]
pkg = "iperf_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-54349"
imported = 2025-10-18T03:16:17.021Z
modified = 2025-10-17T19:46:28.300Z
published = 2025-08-03T02:15:35.597Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-54349"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-54349"
```

# In iperf before 3.19.1, iperf_auth.c has an off-by-one error and resultant heap-based buffer overflo...

In iperf before 3.19.1, iperf_auth.c has an off-by-one error and resultant heap-based buffer overflow.

