```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns39g872-1apmvwq"
modified = 2025-10-17T17:21:55.838Z
upstream = ["CVE-2022-40303"]
references = ["http://seclists.org/fulldisclosure/2022/Dec/21", "http://seclists.org/fulldisclosure/2022/Dec/24", "http://seclists.org/fulldisclosure/2022/Dec/25", "http://seclists.org/fulldisclosure/2022/Dec/26", "http://seclists.org/fulldisclosure/2022/Dec/27", "https://gitlab.gnome.org/GNOME/libxml2/-/commit/c846986356fc149915a74972bf198abc266bc2c0", "https://gitlab.gnome.org/GNOME/libxml2/-/tags/v2.10.3", "https://security.netapp.com/advisory/ntap-20221209-0003/", "https://support.apple.com/kb/HT213531", "https://support.apple.com/kb/HT213533", "https://support.apple.com/kb/HT213534", "https://support.apple.com/kb/HT213535", "https://support.apple.com/kb/HT213536", "http://seclists.org/fulldisclosure/2022/Dec/21", "http://seclists.org/fulldisclosure/2022/Dec/24", "http://seclists.org/fulldisclosure/2022/Dec/25", "http://seclists.org/fulldisclosure/2022/Dec/26", "http://seclists.org/fulldisclosure/2022/Dec/27", "https://gitlab.gnome.org/GNOME/libxml2/-/commit/c846986356fc149915a74972bf198abc266bc2c0", "https://gitlab.gnome.org/GNOME/libxml2/-/tags/v2.10.3", "https://security.netapp.com/advisory/ntap-20221209-0003/", "https://support.apple.com/kb/HT213531", "https://support.apple.com/kb/HT213533", "https://support.apple.com/kb/HT213534", "https://support.apple.com/kb/HT213535", "https://support.apple.com/kb/HT213536"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.10.3+0"]

[[jlsec_sources]]
id = "CVE-2022-40303"
imported = 2025-10-17T17:21:55.838Z
modified = 2025-04-29T05:15:43.693Z
published = 2022-11-23T00:15:11.007Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-40303"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-40303"
```

# An issue was discovered in libxml2 before 2.10.3

An issue was discovered in libxml2 before 2.10.3. When parsing a multi-gigabyte XML document with the XML_PARSE_HUGE parser option enabled, several integer counters can overflow. This results in an attempt to access an array at a negative 2GB offset, typically leading to a segmentation fault.

