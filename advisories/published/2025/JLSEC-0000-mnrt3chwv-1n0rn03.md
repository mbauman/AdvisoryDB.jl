```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt3chwv-1n0rn03"
modified = 2025-10-10T14:33:22.351Z
upstream = ["CVE-2024-6874"]
references = ["http://www.openwall.com/lists/oss-security/2024/07/24/2", "https://curl.se/docs/CVE-2024-6874.html", "https://curl.se/docs/CVE-2024-6874.json", "https://hackerone.com/reports/2604391", "http://www.openwall.com/lists/oss-security/2024/07/24/2", "https://curl.se/docs/CVE-2024-6874.html", "https://curl.se/docs/CVE-2024-6874.json", "https://hackerone.com/reports/2604391", "https://security.netapp.com/advisory/ntap-20240822-0004/"]

[[affected]]
pkg = "LibCURL_jll"
ranges = [">= 8.8.0+0, < 8.9.0+0"]

[[jlsec_sources]]
id = "CVE-2024-6874"
imported = 2025-10-10T14:33:22.351Z
modified = 2024-11-21T09:50:26.493Z
published = 2024-07-24T08:15:03.413Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-6874"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-6874"
```

# libcurl's URL API function [curl_url_get()](https://curl.se/libcurl/c/curl_url_get.html) offers puny...

libcurl's URL API function
[curl_url_get()](https://curl.se/libcurl/c/curl_url_get.html) offers punycode
conversions, to and from IDN. Asking to convert a name that is exactly 256
bytes, libcurl ends up reading outside of a stack based buffer when built to
use the *macidn* IDN backend. The conversion function then fills up the
provided buffer exactly - but does not null terminate the string.

This flaw can lead to stack contents accidently getting returned as part of
the converted string.

