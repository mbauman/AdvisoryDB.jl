```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrpkiyhr-1irnhng"
modified = 2025-10-08T03:23:12.543Z
upstream = ["CVE-2022-49043"]
references = ["https://github.com/php/php-src/issues/17467", "https://gitlab.gnome.org/GNOME/libxml2/-/commit/5a19e21605398cef6a8b1452477a8705cb41562b"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.12.0+0"]

[[jlsec_sources]]
id = "CVE-2022-49043"
imported = 2025-10-08T03:23:12.519Z
modified = 2025-10-07T16:24:00.340Z
published = 2025-01-26T06:15:21.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-49043"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-49043"
```

# xmlXIncludeAddNode in xinclude.c in libxml2 before 2.11.0 has a use-after-free.

xmlXIncludeAddNode in xinclude.c in libxml2 before 2.11.0 has a use-after-free.

