```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr43r0wm-1m82dhd"
modified = 2025-09-23T02:50:25.750Z
upstream = ["CVE-2021-30473"]
references = ["https://aomedia.googlesource.com/aom/+/4efe20e99dcd9b6f8eadc8de8acc825be7416578", "https://bugs.chromium.org/p/aomedia/issues/detail?id=2998", "https://lists.debian.org/debian-lts-announce/2023/09/msg00003.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZXCI33HXH6YSOGC2LPE2REQLMIDH6US4/", "https://security.gentoo.org/glsa/202401-32", "https://www.debian.org/security/2023/dsa-5490", "https://aomedia.googlesource.com/aom/+/4efe20e99dcd9b6f8eadc8de8acc825be7416578", "https://bugs.chromium.org/p/aomedia/issues/detail?id=2998", "https://lists.debian.org/debian-lts-announce/2023/09/msg00003.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZXCI33HXH6YSOGC2LPE2REQLMIDH6US4/", "https://security.gentoo.org/glsa/202401-32", "https://www.debian.org/security/2023/dsa-5490"]

[[affected]]
pkg = "libaom_jll"
ranges = ["*"]

[database_specific.source]
id = "CVE-2021-30473"
modified = "2024-11-21T06:03:59.453Z"
published = "2021-05-06T15:15:07.943Z"
imported = "2025-09-23T02:50:25.723Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-30473"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-30473"
```

# aom_image.c in libaom in AOMedia before 2021-04-07 frees memory that is not located on the heap.

aom_image.c in libaom in AOMedia before 2021-04-07 frees memory that is not located on the heap.

