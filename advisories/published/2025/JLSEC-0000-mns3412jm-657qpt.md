```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3412jm-657qpt"
modified = 2025-10-17T14:50:10.594Z
upstream = ["CVE-2023-34872"]
references = ["https://gitlab.freedesktop.org/poppler/poppler/-/commit/591235c8b6c65a2eee88991b9ae73490fd9afdfe", "https://gitlab.freedesktop.org/poppler/poppler/-/issues/1399", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3XXL3L6RJOTLGCN7GLH2OLLNF4FJ4T7I/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JQ3NYJ43U2MA7COKGMJDARZUAAOP45D4/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SFBT75QHBWNMSDAHSXZQ2I3PBJWID36K/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/W3H3GOWFE3C7543GMEN7LY4GWMWJ7D2G/", "https://gitlab.freedesktop.org/poppler/poppler/-/commit/591235c8b6c65a2eee88991b9ae73490fd9afdfe", "https://gitlab.freedesktop.org/poppler/poppler/-/issues/1399", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3XXL3L6RJOTLGCN7GLH2OLLNF4FJ4T7I/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JQ3NYJ43U2MA7COKGMJDARZUAAOP45D4/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SFBT75QHBWNMSDAHSXZQ2I3PBJWID36K/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/W3H3GOWFE3C7543GMEN7LY4GWMWJ7D2G/"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["< 23.12.0+0"]

[[jlsec_sources]]
id = "CVE-2023-34872"
imported = 2025-10-17T14:50:10.594Z
modified = 2025-07-09T14:15:24.977Z
published = 2023-07-31T14:15:10.427Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-34872"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-34872"
```

# A vulnerability in Outline.cc for Poppler prior to 23.06.0 allows a remote attacker to cause a Denia...

A vulnerability in Outline.cc for Poppler prior to 23.06.0 allows a remote attacker to cause a Denial of Service (DoS) (crash) via a crafted PDF file in OutlineItem::open.

