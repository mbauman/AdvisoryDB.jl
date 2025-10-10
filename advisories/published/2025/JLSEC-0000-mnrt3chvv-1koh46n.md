```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt3chvv-1koh46n"
modified = 2025-10-10T14:33:22.315Z
upstream = ["CVE-2020-8286"]
references = ["http://seclists.org/fulldisclosure/2021/Apr/50", "http://seclists.org/fulldisclosure/2021/Apr/51", "http://seclists.org/fulldisclosure/2021/Apr/54", "https://cert-portal.siemens.com/productcert/pdf/ssa-200951.pdf", "https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://curl.se/docs/CVE-2020-8286.html", "https://hackerone.com/reports/1048457", "https://lists.debian.org/debian-lts-announce/2020/12/msg00029.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DAEHE2S2QLO4AO4MEEYL75NB7SAH5PSL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NZUVSQHN2ESHMJXNQ2Z7T2EELBB5HJXG/", "https://security.gentoo.org/glsa/202012-14", "https://security.netapp.com/advisory/ntap-20210122-0007/", "https://support.apple.com/kb/HT212325", "https://support.apple.com/kb/HT212326", "https://support.apple.com/kb/HT212327", "https://www.debian.org/security/2021/dsa-4881", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "http://seclists.org/fulldisclosure/2021/Apr/50", "http://seclists.org/fulldisclosure/2021/Apr/51", "http://seclists.org/fulldisclosure/2021/Apr/54", "https://cert-portal.siemens.com/productcert/pdf/ssa-200951.pdf", "https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://curl.se/docs/CVE-2020-8286.html", "https://hackerone.com/reports/1048457", "https://lists.debian.org/debian-lts-announce/2020/12/msg00029.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DAEHE2S2QLO4AO4MEEYL75NB7SAH5PSL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NZUVSQHN2ESHMJXNQ2Z7T2EELBB5HJXG/", "https://security.gentoo.org/glsa/202012-14", "https://security.netapp.com/advisory/ntap-20210122-0007/", "https://support.apple.com/kb/HT212325", "https://support.apple.com/kb/HT212326", "https://support.apple.com/kb/HT212327", "https://www.debian.org/security/2021/dsa-4881", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html"]

[[affected]]
pkg = "LibCURL_jll"
ranges = ["< 7.81.0+0"]

[[jlsec_sources]]
id = "CVE-2020-8286"
imported = 2025-10-10T14:33:22.315Z
modified = 2024-11-21T05:38:39.643Z
published = 2020-12-14T20:15:14.043Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-8286"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-8286"
```

# curl 7.41.0 through 7.73.0 is vulnerable to an improper check for certificate revocation due to insu...

curl 7.41.0 through 7.73.0 is vulnerable to an improper check for certificate revocation due to insufficient verification of the OCSP response.

