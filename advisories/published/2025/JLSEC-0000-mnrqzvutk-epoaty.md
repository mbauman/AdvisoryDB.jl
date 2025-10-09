```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrqzvutk-epoaty"
modified = 2025-10-09T03:20:54.728Z
aliases = ["CVE-2025-61985"]
references = ["https://marc.info/?l=openssh-unix-dev&m=175974522032149&w=2", "https://www.openssh.com/releasenotes.html#10.1p1", "https://www.openwall.com/lists/oss-security/2025/10/06/1"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 10.1.1+0"]

[[jlsec_sources]]
id = "CVE-2025-61985"
imported = 2025-10-09T03:20:54.728Z
modified = 2025-10-08T19:38:32.610Z
published = 2025-10-06T19:15:36.357Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-61985"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-61985"
[[jlsec_sources]]
id = "EUVD-2025-32134"
imported = 2025-10-09T03:20:54.892Z
modified = 2025-10-06T18:34:24.000Z
published = 2025-10-06T00:00:00.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-32134"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-32134"
fields = ["affected"]
```

# ssh in OpenSSH before 10.1 allows the '\0' character in an ssh:// URI, potentially leading to code e...

ssh in OpenSSH before 10.1 allows the '\0' character in an ssh:// URI, potentially leading to code execution when a ProxyCommand is used.

