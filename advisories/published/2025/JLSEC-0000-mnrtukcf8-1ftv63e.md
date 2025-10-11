```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrtukcf8-1ftv63e"
modified = 2025-10-11T03:15:18.116Z
upstream = ["CVE-2024-34459"]
references = ["https://gitlab.gnome.org/GNOME/libxml2/-/issues/720", "https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.11.8", "https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.12.7", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5HVUXKYTBWT3G5DEEQX62STJQBY367NL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/INKSSLW5VMZIXHRPZBAW4TJUX5SQKARG/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VRDJCNQP32LV56KESUQ5SNZKAJWSZZRI/", "https://gitlab.gnome.org/GNOME/libxml2/-/issues/720", "https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.11.8", "https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.12.7", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5HVUXKYTBWT3G5DEEQX62STJQBY367NL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/INKSSLW5VMZIXHRPZBAW4TJUX5SQKARG/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VRDJCNQP32LV56KESUQ5SNZKAJWSZZRI/"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.12.7+0"]

[[jlsec_sources]]
id = "CVE-2024-34459"
imported = 2025-10-11T03:15:18.098Z
modified = 2025-10-10T18:00:14.990Z
published = 2024-05-14T15:39:11.917Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-34459"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-34459"
```

# An issue was discovered in xmllint (from libxml2) before 2.11.8 and 2.12.x before 2.12.7

An issue was discovered in xmllint (from libxml2) before 2.11.8 and 2.12.x before 2.12.7. Formatting error messages with xmllint --htmlout can result in a buffer over-read in xmlHTMLPrintFileContext in xmllint.c.

