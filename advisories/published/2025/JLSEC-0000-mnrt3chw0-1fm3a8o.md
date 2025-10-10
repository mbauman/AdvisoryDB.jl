```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt3chw0-1fm3a8o"
modified = 2025-10-10T14:33:22.320Z
upstream = ["CVE-2023-27536"]
references = ["https://hackerone.com/reports/1895135", "https://lists.debian.org/debian-lts-announce/2023/04/msg00025.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/36NBD5YLJXXEDZLDGNFCERWRYJQ6LAQW/", "https://security.gentoo.org/glsa/202310-12", "https://security.netapp.com/advisory/ntap-20230420-0010/", "https://hackerone.com/reports/1895135", "https://lists.debian.org/debian-lts-announce/2023/04/msg00025.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/36NBD5YLJXXEDZLDGNFCERWRYJQ6LAQW/", "https://security.gentoo.org/glsa/202310-12", "https://security.netapp.com/advisory/ntap-20230420-0010/"]

[[affected]]
pkg = "CURL_jll"
ranges = ["< 8.5.0+0"]
[[affected]]
pkg = "LibCURL_jll"
ranges = ["< 8.0.1+0"]

[[jlsec_sources]]
id = "CVE-2023-27536"
imported = 2025-10-10T14:33:22.320Z
modified = 2025-02-14T16:15:33.497Z
published = 2023-03-30T20:15:07.547Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-27536"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-27536"
```

# An authentication bypass vulnerability exists libcurl <8.0.0 in the connection reuse feature which c...

An authentication bypass vulnerability exists libcurl <8.0.0 in the connection reuse feature which can reuse previously established connections with incorrect user permissions due to a failure to check for changes in the CURLOPT_GSSAPI_DELEGATION option. This vulnerability affects krb5/kerberos/negotiate/GSSAPI transfers and could potentially result in unauthorized access to sensitive information. The safest option is to not reuse connections if the CURLOPT_GSSAPI_DELEGATION option has been changed.

