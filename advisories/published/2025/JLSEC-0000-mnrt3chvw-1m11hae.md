```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt3chvw-1m11hae"
modified = 2025-10-10T14:33:22.316Z
upstream = ["CVE-2021-22876"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://curl.se/docs/CVE-2021-22876.html", "https://hackerone.com/reports/1101882", "https://lists.debian.org/debian-lts-announce/2021/05/msg00019.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/2ZC5BMIOKLBQJSFCHEDN2G2C2SH274BP/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ITVWPVGLFISU5BJC2BXBRYSDXTXE2YGC/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KQUIOYX2KUU6FIUZVB5WWZ6JHSSYSQWJ/", "https://security.gentoo.org/glsa/202105-36", "https://security.netapp.com/advisory/ntap-20210521-0007/", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://curl.se/docs/CVE-2021-22876.html", "https://hackerone.com/reports/1101882", "https://lists.debian.org/debian-lts-announce/2021/05/msg00019.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/2ZC5BMIOKLBQJSFCHEDN2G2C2SH274BP/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ITVWPVGLFISU5BJC2BXBRYSDXTXE2YGC/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KQUIOYX2KUU6FIUZVB5WWZ6JHSSYSQWJ/", "https://security.gentoo.org/glsa/202105-36", "https://security.netapp.com/advisory/ntap-20210521-0007/", "https://www.oracle.com//security-alerts/cpujul2021.html"]

[[affected]]
pkg = "LibCURL_jll"
ranges = ["< 7.81.0+0"]

[[jlsec_sources]]
id = "CVE-2021-22876"
imported = 2025-10-10T14:33:22.316Z
modified = 2025-06-09T15:15:23.067Z
published = 2021-04-01T18:15:12.823Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-22876"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-22876"
```

# curl 7.1.1 to and including 7.75.0 is vulnerable to an "Exposure of Private Personal Information to ...

curl 7.1.1 to and including 7.75.0 is vulnerable to an "Exposure of Private Personal Information to an Unauthorized Actor" by leaking credentials in the HTTP Referer: header. libcurl does not strip off user credentials from the URL when automatically populating the Referer: HTTP request header field in outgoing HTTP requests, and therefore risks leaking sensitive data to the server that is the target of the second HTTP request.

