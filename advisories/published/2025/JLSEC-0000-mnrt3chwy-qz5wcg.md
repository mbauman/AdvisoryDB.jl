```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt3chwy-qz5wcg"
modified = 2025-10-10T14:33:22.354Z
upstream = ["CVE-2025-0725"]
references = ["https://curl.se/docs/CVE-2025-0725.html", "https://curl.se/docs/CVE-2025-0725.json", "https://hackerone.com/reports/2956023", "http://www.openwall.com/lists/oss-security/2025/02/05/3", "http://www.openwall.com/lists/oss-security/2025/02/06/2", "http://www.openwall.com/lists/oss-security/2025/02/06/4", "https://github.com/curl/curl/commit/76f83f0db23846e254d940ec7", "https://security.netapp.com/advisory/ntap-20250306-0009/"]

[[affected]]
pkg = "CURL_jll"
ranges = ["< 8.13.0+0"]
[[affected]]
pkg = "LibCURL_jll"
ranges = ["< 8.12.0+0"]

[[jlsec_sources]]
id = "CVE-2025-0725"
imported = 2025-10-10T14:33:22.354Z
modified = 2025-06-27T19:24:08.327Z
published = 2025-02-05T10:15:22.980Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-0725"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-0725"
```

# When libcurl is asked to perform automatic gzip decompression of content-encoded HTTP responses with...

When libcurl is asked to perform automatic gzip decompression of
content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option,
**using zlib 1.2.0.3 or older**, an attacker-controlled integer overflow would
make libcurl perform a buffer overflow.

