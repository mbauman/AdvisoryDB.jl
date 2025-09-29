```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaa9-xkfgv2"
modified = 2025-09-29T17:46:20.433Z
upstream = ["CVE-2022-2868"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2118863", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://www.debian.org/security/2023/dsa-5333", "https://bugzilla.redhat.com/show_bug.cgi?id=2118863", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[[jlsec_sources]]
id = "CVE-2022-2868"
imported = 2025-09-29T17:46:20.433Z
modified = 2024-11-21T07:01:50.467Z
published = 2022-08-17T22:15:08.753Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2868"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2868"
```

# libtiff's tiffcrop utility has a improper input validation flaw that can lead to out of bounds read ...

libtiff's tiffcrop utility has a improper input validation flaw that can lead to out of bounds read and ultimately cause a crash if an attacker is able to supply a crafted file to tiffcrop.

