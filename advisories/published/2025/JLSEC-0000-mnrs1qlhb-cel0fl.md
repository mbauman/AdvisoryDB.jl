```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrs1qlhb-cel0fl"
modified = 2025-10-09T21:00:34.751Z
upstream = ["CVE-2020-35492"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1898396", "https://security.gentoo.org/glsa/202305-21", "https://bugzilla.redhat.com/show_bug.cgi?id=1898396", "https://security.gentoo.org/glsa/202305-21"]

[[affected]]
pkg = "Cairo_jll"
ranges = ["< 1.18.0+0"]

[[jlsec_sources]]
id = "CVE-2020-35492"
imported = 2025-10-09T21:00:34.751Z
modified = 2024-11-21T05:27:24.803Z
published = 2021-03-18T19:15:13.230Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-35492"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-35492"
```

# A flaw was found in cairo's image-compositor.c in all versions prior to 1.17.4

A flaw was found in cairo's image-compositor.c in all versions prior to 1.17.4. This flaw allows an attacker who can provide a crafted input file to cairo's image-compositor (for example, by convincing a user to open a file in an application using cairo, or if an application uses cairo on untrusted input) to cause a stack buffer overflow -> out-of-bounds WRITE. The highest impact from this vulnerability is to confidentiality, integrity, as well as system availability.

