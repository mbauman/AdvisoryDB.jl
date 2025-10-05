```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrladx2s-160lmbx"
modified = 2025-10-05T03:28:16.564Z
aliases = ["CVE-2025-24855"]
references = ["https://gitlab.gnome.org/GNOME/libxslt/-/issues/128"]

[[affected]]
pkg = "XSLT_jll"
ranges = ["< 1.1.43+0"]

[[jlsec_sources]]
id = "CVE-2025-24855"
imported = 2025-10-05T03:28:16.564Z
modified = 2025-03-14T02:15:15.717Z
published = 2025-03-14T02:15:15.717Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-24855"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-24855"
[[jlsec_sources]]
id = "EUVD-2025-7659"
imported = 2025-10-05T03:28:16.571Z
modified = 2025-10-03T20:07:09.000Z
published = 2025-10-03T20:07:09.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-7659"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-7659"
fields = ["affected"]
```

# numbers.c in libxslt before 1.1.43 has a use-after-free because, in nested XPath evaluations, an XPa...

numbers.c in libxslt before 1.1.43 has a use-after-free because, in nested XPath evaluations, an XPath context node can be modified but never restored. This is related to xsltNumberFormatGetValue, xsltEvalXPathPredicate, xsltEvalXPathStringNs, and xsltComputeSortResultInternal.

