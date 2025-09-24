```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpj-1loxb7q"
modified = 2025-09-23T03:04:04.567Z
upstream = ["CVE-2022-2869"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2118869", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://www.debian.org/security/2023/dsa-5333", "https://bugzilla.redhat.com/show_bug.cgi?id=2118869", "https://lists.debian.org/debian-lts-announce/2023/01/msg00018.html", "https://www.debian.org/security/2023/dsa-5333"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-2869"
modified = "2024-11-21T07:01:50.573Z"
published = "2022-08-17T22:15:08.807Z"
imported = "2025-09-23T03:04:04.567Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2869"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2869"
```

# libtiff's tiffcrop tool has a uint32_t underflow which leads to out of bounds read and write in the ...

libtiff's tiffcrop tool has a uint32_t underflow which leads to out of bounds read and write in the extractContigSamples8bits routine. An attacker who supplies a crafted file to tiffcrop could trigger this flaw, most likely by tricking a user into opening the crafted file with tiffcrop. Triggering this flaw could cause a crash or potentially further exploitation.

