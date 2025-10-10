```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt3chvz-1wgvq6v"
modified = 2025-10-10T14:33:22.319Z
upstream = ["CVE-2021-22945"]
references = ["http://seclists.org/fulldisclosure/2022/Mar/29", "https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://hackerone.com/reports/1269242", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/APOAK4X73EJTAPTSVT7IRVDMUWVXNWGD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RWLEC6YVEM2HWUBX67SDGPSY4CQB72OE/", "https://security.gentoo.org/glsa/202212-01", "https://security.netapp.com/advisory/ntap-20211029-0003/", "https://support.apple.com/kb/HT213183", "https://www.debian.org/security/2022/dsa-5197", "https://www.oracle.com/security-alerts/cpuoct2021.html", "http://seclists.org/fulldisclosure/2022/Mar/29", "https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://hackerone.com/reports/1269242", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/APOAK4X73EJTAPTSVT7IRVDMUWVXNWGD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RWLEC6YVEM2HWUBX67SDGPSY4CQB72OE/", "https://security.gentoo.org/glsa/202212-01", "https://security.netapp.com/advisory/ntap-20211029-0003/", "https://support.apple.com/kb/HT213183", "https://www.debian.org/security/2022/dsa-5197", "https://www.oracle.com/security-alerts/cpuoct2021.html"]

[[affected]]
pkg = "LibCURL_jll"
ranges = [">= 7.70.0+0, < 7.81.0+0"]

[[jlsec_sources]]
id = "CVE-2021-22945"
imported = 2025-10-10T14:33:22.319Z
modified = 2025-06-09T15:15:25.540Z
published = 2021-09-23T13:15:08.690Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-22945"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-22945"
```

# When sending data to an MQTT server, libcurl <= 7.73.0 and 7.78.0 could in some circumstances errone...

When sending data to an MQTT server, libcurl <= 7.73.0 and 7.78.0 could in some circumstances erroneously keep a pointer to an already freed memory area and both use that again in a subsequent call to send data and also free it *again*.

