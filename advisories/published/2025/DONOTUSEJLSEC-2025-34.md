```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-34"
modified = 2025-09-26T19:46:16.213Z
published = 2025-09-23T22:07:20.257Z
upstream = ["CVE-2020-1968"]
references = ["https://lists.debian.org/debian-lts-announce/2020/09/msg00016.html", "https://security.gentoo.org/glsa/202210-02", "https://security.netapp.com/advisory/ntap-20200911-0004/", "https://usn.ubuntu.com/4504-1/", "https://www.openssl.org/news/secadv/20200909.txt", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2021.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00016.html", "https://security.gentoo.org/glsa/202210-02", "https://security.netapp.com/advisory/ntap-20200911-0004/", "https://usn.ubuntu.com/4504-1/", "https://www.openssl.org/news/secadv/20200909.txt", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2021.html", "https://www.oracle.com/security-alerts/cpuoct2021.html"]

[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.19.9+0"]

[[jlsec_sources]]
id = "CVE-2020-1968"
imported = 2025-09-23T21:56:31.018Z
modified = 2024-11-21T05:11:45.367Z
published = 2020-09-09T14:15:12.507Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-1968"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-1968"
```

# The Raccoon attack exploits a flaw in the TLS specification which can lead to an attacker being able...

The Raccoon attack exploits a flaw in the TLS specification which can lead to an attacker being able to compute the pre-master secret in connections which have used a Diffie-Hellman (DH) based ciphersuite. In such a case this would result in the attacker being able to eavesdrop on all encrypted communications sent over that TLS connection. The attack can only be exploited if an implementation re-uses a DH secret across multiple TLS connections. Note that this issue only impacts DH ciphersuites and not ECDH ciphersuites. This issue affects OpenSSL 1.0.2 which is out of support and no longer receiving public updates. OpenSSL 1.1.1 is not vulnerable to this issue. Fixed in OpenSSL 1.0.2w (Affected 1.0.2-1.0.2v).

