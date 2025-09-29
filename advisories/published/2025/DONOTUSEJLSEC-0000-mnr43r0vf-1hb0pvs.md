```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr43r0vf-1hb0pvs"
modified = 2025-09-23T02:50:25.707Z
upstream = ["CVE-2024-5171"]
references = ["https://issues.chromium.org/issues/332382766", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6HYUEHZ35ZPY2EONVZCGO6LPT3AMLZCP/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/U5NRNCEYS246CYGOR32MF7OGKWOWER22/", "https://issues.chromium.org/issues/332382766", "https://lists.debian.org/debian-lts-announce/2024/09/msg00024.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6HYUEHZ35ZPY2EONVZCGO6LPT3AMLZCP/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/U5NRNCEYS246CYGOR32MF7OGKWOWER22/"]

[[affected]]
pkg = "libaom_jll"
ranges = ["< 3.11.0+0"]

[database_specific.source]
id = "CVE-2024-5171"
modified = "2024-11-21T09:47:07.493Z"
published = "2024-06-05T20:15:13.800Z"
imported = "2025-09-23T02:50:25.636Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-5171"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-5171"
```

# Integer overflow in libaom internal function img*alloc*helper can lead to heap buffer overflow

Integer overflow in libaom internal function img*alloc*helper can lead to heap buffer overflow. This function can be reached via 3 callers:

  * Calling aom*img*alloc() with a large value of the d*w, d*h, or align parameter may result in integer overflows in the calculations of buffer sizes and offsets and some fields of the returned aom*image*t struct may be invalid.
  * Calling aom*img*wrap() with a large value of the d*w, d*h, or align parameter may result in integer overflows in the calculations of buffer sizes and offsets and some fields of the returned aom*image*t struct may be invalid.
  * Calling aom*img*alloc*with*border() with a large value of the d*w, d*h, align, size*align, or border parameter may result in integer overflows in the calculations of buffer sizes and offsets and some fields of the returned aom*image_t struct may be invalid.

