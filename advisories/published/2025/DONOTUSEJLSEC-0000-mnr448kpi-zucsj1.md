```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpi-zucsj1"
modified = 2025-09-23T03:04:04.566Z
upstream = ["CVE-2022-2867"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2118847", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://www.debian.org/security/2023/dsa-5333", "https://bugzilla.redhat.com/show_bug.cgi?id=2118847", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-2867"
modified = "2024-11-21T07:01:50.353Z"
published = "2022-08-17T22:15:08.697Z"
imported = "2025-09-23T03:04:04.566Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2867"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2867"
```

# libtiff's tiffcrop utility has a uint32_t underflow that can lead to out of bounds read and write

libtiff's tiffcrop utility has a uint32_t underflow that can lead to out of bounds read and write. An attacker who supplies a crafted file to tiffcrop (likely via tricking a user to run tiffcrop on it with certain parameters) could cause a crash or in some cases, further exploitation.

