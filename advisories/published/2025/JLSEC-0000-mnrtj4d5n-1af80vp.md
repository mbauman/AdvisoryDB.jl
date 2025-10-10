```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrtj4d5n-1af80vp"
modified = 2025-10-10T21:54:56.795Z
upstream = ["CVE-2013-0340"]
references = ["http://openwall.com/lists/oss-security/2013/02/22/3", "http://seclists.org/fulldisclosure/2021/Oct/61", "http://seclists.org/fulldisclosure/2021/Oct/62", "http://seclists.org/fulldisclosure/2021/Oct/63", "http://seclists.org/fulldisclosure/2021/Sep/33", "http://seclists.org/fulldisclosure/2021/Sep/34", "http://seclists.org/fulldisclosure/2021/Sep/35", "http://seclists.org/fulldisclosure/2021/Sep/38", "http://seclists.org/fulldisclosure/2021/Sep/39", "http://seclists.org/fulldisclosure/2021/Sep/40", "http://securitytracker.com/id?1028213", "http://www.openwall.com/lists/oss-security/2013/04/12/6", "http://www.openwall.com/lists/oss-security/2021/10/07/4", "http://www.osvdb.org/90634", "http://www.securityfocus.com/bid/58233", "https://lists.apache.org/thread.html/r41eca5f4f09e74436cbb05dec450fc2bef37b5d3e966aa7cc5fada6d%40%3Cannounce.apache.org%3E", "https://lists.apache.org/thread.html/rfb2c193360436e230b85547e85a41bea0916916f96c501f5b6fc4702%40%3Cusers.openoffice.apache.org%3E", "https://security.gentoo.org/glsa/201701-21", "https://support.apple.com/kb/HT212804", "https://support.apple.com/kb/HT212805", "https://support.apple.com/kb/HT212807", "https://support.apple.com/kb/HT212814", "https://support.apple.com/kb/HT212815", "https://support.apple.com/kb/HT212819", "http://openwall.com/lists/oss-security/2013/02/22/3", "http://seclists.org/fulldisclosure/2021/Oct/61", "http://seclists.org/fulldisclosure/2021/Oct/62", "http://seclists.org/fulldisclosure/2021/Oct/63", "http://seclists.org/fulldisclosure/2021/Sep/33", "http://seclists.org/fulldisclosure/2021/Sep/34", "http://seclists.org/fulldisclosure/2021/Sep/35", "http://seclists.org/fulldisclosure/2021/Sep/38", "http://seclists.org/fulldisclosure/2021/Sep/39", "http://seclists.org/fulldisclosure/2021/Sep/40", "http://securitytracker.com/id?1028213", "http://www.openwall.com/lists/oss-security/2013/04/12/6", "http://www.openwall.com/lists/oss-security/2021/10/07/4", "http://www.osvdb.org/90634", "http://www.securityfocus.com/bid/58233", "https://lists.apache.org/thread.html/r41eca5f4f09e74436cbb05dec450fc2bef37b5d3e966aa7cc5fada6d%40%3Cannounce.apache.org%3E", "https://lists.apache.org/thread.html/rfb2c193360436e230b85547e85a41bea0916916f96c501f5b6fc4702%40%3Cusers.openoffice.apache.org%3E", "https://security.gentoo.org/glsa/201701-21", "https://support.apple.com/kb/HT212804", "https://support.apple.com/kb/HT212805", "https://support.apple.com/kb/HT212807", "https://support.apple.com/kb/HT212814", "https://support.apple.com/kb/HT212815", "https://support.apple.com/kb/HT212819"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.7+0"]
[[affected]]
pkg = "Expat_jll"
ranges = ["< 2.4.4+0"]

[[jlsec_sources]]
id = "CVE-2013-0340"
imported = 2025-10-10T21:54:56.795Z
modified = 2025-04-11T00:51:21.963Z
published = 2014-01-21T18:55:09.117Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2013-0340"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2013-0340"
```

# expat 2.1.0 and earlier does not properly handle entities expansion unless an application developer ...

expat 2.1.0 and earlier does not properly handle entities expansion unless an application developer uses the XML_SetEntityDeclHandler function, which allows remote attackers to cause a denial of service (resource consumption), send HTTP requests to intranet servers, or read arbitrary files via a crafted XML document, aka an XML External Entity (XXE) issue.  NOTE: it could be argued that because expat already provides the ability to disable external entity expansion, the responsibility for resolving this issue lies with application developers; according to this argument, this entry should be REJECTed, and each affected application would need its own CVE.

