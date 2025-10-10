```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrs1qlh5-va33qd"
modified = 2025-10-09T21:00:34.745Z
upstream = ["CVE-2017-9814"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-07/msg00042.html", "https://bugs.freedesktop.org/show_bug.cgi?id=101547", "https://lists.apache.org/thread.html/rf9fa47ab66495c78bb4120b0754dd9531ca2ff0430f6685ac9b07772%40%3Cdev.mina.apache.org%3E", "https://security.gentoo.org/glsa/201904-01", "http://lists.opensuse.org/opensuse-security-announce/2020-07/msg00042.html", "https://bugs.freedesktop.org/show_bug.cgi?id=101547", "https://lists.apache.org/thread.html/rf9fa47ab66495c78bb4120b0754dd9531ca2ff0430f6685ac9b07772%40%3Cdev.mina.apache.org%3E", "https://security.gentoo.org/glsa/201904-01"]

[[affected]]
pkg = "Cairo_jll"
ranges = ["< 1.16.0+0"]

[[jlsec_sources]]
id = "CVE-2017-9814"
imported = 2025-10-09T21:00:34.745Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-17T13:18:30.937Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-9814"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-9814"
```

# cairo-truetype-subset.c in cairo 1.15.6 and earlier allows remote attackers to cause a denial of ser...

cairo-truetype-subset.c in cairo 1.15.6 and earlier allows remote attackers to cause a denial of service (out-of-bounds read) because of mishandling of an unexpected malloc(0) call.

