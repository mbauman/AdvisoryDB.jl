```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt3chwu-pojg7r"
modified = 2025-10-10T14:33:22.350Z
upstream = ["CVE-2024-6197"]
references = ["http://www.openwall.com/lists/oss-security/2024/07/24/1", "http://www.openwall.com/lists/oss-security/2024/07/24/5", "https://curl.se/docs/CVE-2024-6197.html", "https://curl.se/docs/CVE-2024-6197.json", "https://hackerone.com/reports/2559516", "http://www.openwall.com/lists/oss-security/2024/07/24/1", "http://www.openwall.com/lists/oss-security/2024/07/24/5", "https://curl.se/docs/CVE-2024-6197.html", "https://curl.se/docs/CVE-2024-6197.json", "https://hackerone.com/reports/2559516", "https://security.netapp.com/advisory/ntap-20241129-0008/"]

[[affected]]
pkg = "CURL_jll"
ranges = [">= 8.6.0+0, < 8.9.0+0"]
[[affected]]
pkg = "LibCURL_jll"
ranges = [">= 8.6.0+0, < 8.9.0+0"]

[[jlsec_sources]]
id = "CVE-2024-6197"
imported = 2025-10-10T14:33:22.350Z
modified = 2024-11-29T12:15:08.430Z
published = 2024-07-24T08:15:03.340Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-6197"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-6197"
```

# libcurl's ASN1 parser has this utf8asn1str() function used for parsing an ASN.1 UTF-8 string

libcurl's ASN1 parser has this utf8asn1str() function used for parsing an ASN.1 UTF-8 string. Itcan detect an invalid field and return error. Unfortunately, when doing so it also invokes `free()` on a 4 byte localstack buffer.  Most modern malloc implementations detect this error and immediately abort. Some however accept the input pointer and add that memory to its list of available chunks. This leads to the overwriting of nearby stack memory. The content of the overwrite is decided by the `free()` implementation; likely to be memory pointers and a set of flags.  The most likely outcome of exploting this flaw is a crash, although it cannot be ruled out that more serious results can be had in special circumstances.

