```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrladx3m-1oazw6s"
modified = 2025-10-05T03:28:16.594Z
upstream = ["CVE-2025-30348"]
references = ["https://codereview.qt-project.org/c/qt/qtbase/+/581442"]

[[affected]]
pkg = "Qt5Base_jll"
ranges = ["*"]
[[affected]]
pkg = "Qt_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-30348"
imported = 2025-10-05T03:28:16.594Z
modified = 2025-03-24T14:08:36.513Z
published = 2025-03-21T07:15:37.673Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-30348"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-30348"
```

# encodeText in QDom in Qt before 6.8.0 has a complex algorithm involving XML string copy and inline r...

encodeText in QDom in Qt before 6.8.0 has a complex algorithm involving XML string copy and inline replacement of parts of a string (with relocation of later data).

