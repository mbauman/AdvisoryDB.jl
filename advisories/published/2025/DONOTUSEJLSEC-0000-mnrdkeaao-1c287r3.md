```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaao-1c287r3"
modified = 2025-09-29T17:46:20.448Z
upstream = ["CVE-2023-3618"]
references = ["https://access.redhat.com/security/cve/CVE-2023-3618", "https://bugzilla.redhat.com/show_bug.cgi?id=2215865", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://security.netapp.com/advisory/ntap-20230824-0012/", "https://support.apple.com/kb/HT214036", "https://support.apple.com/kb/HT214037", "https://support.apple.com/kb/HT214038", "https://access.redhat.com/security/cve/CVE-2023-3618", "https://bugzilla.redhat.com/show_bug.cgi?id=2215865", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://security.netapp.com/advisory/ntap-20230824-0012/", "https://support.apple.com/kb/HT214036", "https://support.apple.com/kb/HT214037", "https://support.apple.com/kb/HT214038"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2023-3618"
imported = 2025-09-29T17:46:20.448Z
modified = 2024-11-21T08:17:40.963Z
published = 2023-07-12T15:15:09.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-3618"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-3618"
```

# A flaw was found in libtiff

A flaw was found in libtiff. A specially crafted tiff file can lead to a segmentation fault due to a buffer overflow in the Fax3Encode function in libtiff/tif_fax3.c, resulting in a denial of service.

