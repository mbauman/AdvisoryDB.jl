```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrqzvunt-hgxwfl"
modified = 2025-10-09T03:20:54.521Z
aliases = ["CVE-2025-61984"]
references = ["https://marc.info/?l=openssh-unix-dev&m=175974522032149&w=2", "https://www.openssh.com/releasenotes.html#10.1p1", "https://www.openwall.com/lists/oss-security/2025/10/06/1", "https://dgl.cx/2025/10/bash-a-newline-ssh-proxycommand-cve-2025-61984"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 10.1.1+0"]

[[jlsec_sources]]
id = "CVE-2025-61984"
imported = 2025-10-09T03:20:54.521Z
modified = 2025-10-08T19:38:32.610Z
published = 2025-10-06T19:15:36.157Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-61984"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-61984"
[[jlsec_sources]]
id = "EUVD-2025-32089"
imported = 2025-10-09T03:20:54.696Z
modified = 2025-10-08T03:55:09.000Z
published = 2025-10-06T00:00:00.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-32089"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-32089"
fields = ["affected"]
```

# ssh in OpenSSH before 10.1 allows control characters in usernames that originate from certain possib...

ssh in OpenSSH before 10.1 allows control characters in usernames that originate from certain possibly untrusted sources, potentially leading to code execution when a ProxyCommand is used. The untrusted sources are the command line and %-sequence expansion of a configuration file. (A configuration file that provides a complete literal username is not categorized as an untrusted source.)

