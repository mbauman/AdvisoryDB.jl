```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaal-1cf6v03"
modified = 2025-09-29T17:46:20.445Z
upstream = ["CVE-2023-30774"]
references = ["http://seclists.org/fulldisclosure/2023/Oct/24", "https://access.redhat.com/security/cve/CVE-2023-30774", "https://bugzilla.redhat.com/show_bug.cgi?id=2187139", "https://gitlab.com/libtiff/libtiff/-/issues/463", "https://security.netapp.com/advisory/ntap-20230703-0002/", "https://support.apple.com/kb/HT213984", "http://seclists.org/fulldisclosure/2023/Oct/24", "https://access.redhat.com/security/cve/CVE-2023-30774", "https://bugzilla.redhat.com/show_bug.cgi?id=2187139", "https://gitlab.com/libtiff/libtiff/-/issues/463", "https://security.netapp.com/advisory/ntap-20230703-0002/", "https://support.apple.com/kb/HT213984"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2023-30774"
imported = 2025-09-29T17:46:20.445Z
modified = 2025-03-14T19:09:26.310Z
published = 2023-05-19T15:15:08.923Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-30774"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-30774"
```

# A vulnerability was found in the libtiff library

A vulnerability was found in the libtiff library. This flaw causes a heap buffer overflow issue via the TIFFTAG_INKNAMES and TIFFTAG_NUMBEROFINKS values.

