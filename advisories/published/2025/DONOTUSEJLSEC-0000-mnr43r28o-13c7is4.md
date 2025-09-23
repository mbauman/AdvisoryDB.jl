```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr43r28o-13c7is4"
modified = 2025-09-23T02:50:27.480Z
upstream = ["CVE-2021-30474"]
references = ["https://aomedia.googlesource.com/aom/+/6e31957b6dc62dbc7d1bb70cd84902dd14c4bf2e", "https://bugs.chromium.org/p/aomedia/issues/detail?id=3000", "https://lists.debian.org/debian-lts-announce/2023/09/msg00003.html", "https://security.gentoo.org/glsa/202401-32", "https://www.debian.org/security/2023/dsa-5490", "https://aomedia.googlesource.com/aom/+/6e31957b6dc62dbc7d1bb70cd84902dd14c4bf2e", "https://bugs.chromium.org/p/aomedia/issues/detail?id=3000", "https://lists.debian.org/debian-lts-announce/2023/09/msg00003.html", "https://security.gentoo.org/glsa/202401-32", "https://www.debian.org/security/2023/dsa-5490"]

[[affected]]
pkg = "libaom_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2021-30474"
modified = "2024-11-21T06:03:59.627Z"
published = "2021-06-02T17:15:08.630Z"
imported = "2025-09-23T02:50:27.480Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-30474"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-30474"
```

# aom*dsp/grain*table.c in libaom in AOMedia before 2021-03-30 has a use-after-free.

aom*dsp/grain*table.c in libaom in AOMedia before 2021-03-30 has a use-after-free.

