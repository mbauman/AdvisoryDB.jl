```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-29"
modified = 2025-09-23T22:07:20.201Z
published = 2025-09-23T22:07:20.201Z
upstream = ["CVE-2019-1549"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=1b0fe00e2704b5e20334a16d3c9099d1ba2ef1be", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GY6SNRJP2S7Y42GIIDO3HXPNMDYN2U3A/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZN4VVQJ3JDCHGIHV4Y2YTXBYQZ6PWQ7E/", "https://seclists.org/bugtraq/2019/Oct/1", "https://security.netapp.com/advisory/ntap-20190919-0002/", "https://support.f5.com/csp/article/K44070243", "https://support.f5.com/csp/article/K44070243?utm_source=f5support&amp%3Butm_medium=RSS", "https://usn.ubuntu.com/4376-1/", "https://www.debian.org/security/2019/dsa-4539", "https://www.openssl.org/news/secadv/20190910.txt", "https://www.oracle.com/security-alerts/cpuapr2020.html", "https://www.oracle.com/security-alerts/cpujan2020.html", "https://www.oracle.com/security-alerts/cpujul2020.html", "https://www.oracle.com/security-alerts/cpuoct2020.html", "https://www.oracle.com/technetwork/security-advisory/cpuoct2019-5072832.html", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=1b0fe00e2704b5e20334a16d3c9099d1ba2ef1be", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GY6SNRJP2S7Y42GIIDO3HXPNMDYN2U3A/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZN4VVQJ3JDCHGIHV4Y2YTXBYQZ6PWQ7E/", "https://seclists.org/bugtraq/2019/Oct/1", "https://security.netapp.com/advisory/ntap-20190919-0002/", "https://support.f5.com/csp/article/K44070243", "https://support.f5.com/csp/article/K44070243?utm_source=f5support&amp%3Butm_medium=RSS", "https://usn.ubuntu.com/4376-1/", "https://www.debian.org/security/2019/dsa-4539", "https://www.openssl.org/news/secadv/20190910.txt", "https://www.oracle.com/security-alerts/cpuapr2020.html", "https://www.oracle.com/security-alerts/cpujan2020.html", "https://www.oracle.com/security-alerts/cpujul2020.html", "https://www.oracle.com/security-alerts/cpuoct2020.html", "https://www.oracle.com/technetwork/security-advisory/cpuoct2019-5072832.html"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.1+2"]

[database_specific.source]
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-1549"
id = "CVE-2019-1549"
imported = 2025-09-23T21:56:30.607Z
modified = 2024-11-21T04:36:48.343Z
published = 2019-09-10T17:15:11.813Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-1549"
```

# OpenSSL 1.1.1 introduced a rewritten random number generator (RNG)

OpenSSL 1.1.1 introduced a rewritten random number generator (RNG). This was intended to include protection in the event of a fork() system call in order to ensure that the parent and child processes did not share the same RNG state. However this protection was not being used in the default case. A partial mitigation for this issue is that the output from a high precision timer is mixed into the RNG state so the likelihood of a parent and child process sharing state is significantly reduced. If an application already calls OPENSSL*init*crypto() explicitly using OPENSSL*INIT*ATFORK then this problem does not occur at all. Fixed in OpenSSL 1.1.1d (Affected 1.1.1-1.1.1c).

