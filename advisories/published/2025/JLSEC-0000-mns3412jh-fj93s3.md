```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3412jh-fj93s3"
modified = 2025-10-17T14:50:10.589Z
upstream = ["CVE-2021-30860"]
references = ["http://seclists.org/fulldisclosure/2021/Sep/25", "http://seclists.org/fulldisclosure/2021/Sep/26", "http://seclists.org/fulldisclosure/2021/Sep/27", "http://seclists.org/fulldisclosure/2021/Sep/28", "http://seclists.org/fulldisclosure/2021/Sep/38", "http://seclists.org/fulldisclosure/2021/Sep/39", "http://seclists.org/fulldisclosure/2021/Sep/40", "http://seclists.org/fulldisclosure/2021/Sep/50", "http://www.openwall.com/lists/oss-security/2022/09/02/11", "https://security.gentoo.org/glsa/202209-21", "https://support.apple.com/en-us/HT212804", "https://support.apple.com/en-us/HT212805", "https://support.apple.com/en-us/HT212806", "https://support.apple.com/en-us/HT212807", "https://support.apple.com/kb/HT212824", "http://seclists.org/fulldisclosure/2021/Sep/25", "http://seclists.org/fulldisclosure/2021/Sep/26", "http://seclists.org/fulldisclosure/2021/Sep/27", "http://seclists.org/fulldisclosure/2021/Sep/28", "http://seclists.org/fulldisclosure/2021/Sep/38", "http://seclists.org/fulldisclosure/2021/Sep/39", "http://seclists.org/fulldisclosure/2021/Sep/40", "http://seclists.org/fulldisclosure/2021/Sep/50", "http://www.openwall.com/lists/oss-security/2022/09/02/11", "https://security.gentoo.org/glsa/202209-21", "https://support.apple.com/en-us/HT212804", "https://support.apple.com/en-us/HT212805", "https://support.apple.com/en-us/HT212806", "https://support.apple.com/en-us/HT212807", "https://support.apple.com/kb/HT212824"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["< 23.12.0+0"]

[[jlsec_sources]]
id = "CVE-2021-30860"
imported = 2025-10-17T14:50:10.589Z
modified = 2025-02-28T14:43:40.400Z
published = 2021-08-24T19:15:14.370Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-30860"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-30860"
```

# An integer overflow was addressed with improved input validation

An integer overflow was addressed with improved input validation. This issue is fixed in Security Update 2021-005 Catalina, iOS 14.8 and iPadOS 14.8, macOS Big Sur 11.6, watchOS 7.6.2. Processing a maliciously crafted PDF may lead to arbitrary code execution. Apple is aware of a report that this issue may have been actively exploited.

