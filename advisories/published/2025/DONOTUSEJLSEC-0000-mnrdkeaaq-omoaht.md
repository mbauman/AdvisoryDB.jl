```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaaq-omoaht"
modified = 2025-09-29T17:46:20.450Z
upstream = ["CVE-2023-3164"]
references = ["https://access.redhat.com/security/cve/CVE-2023-3164", "https://bugzilla.redhat.com/show_bug.cgi?id=2213531", "https://gitlab.com/libtiff/libtiff/-/issues/542", "https://access.redhat.com/security/cve/CVE-2023-3164", "https://bugzilla.redhat.com/show_bug.cgi?id=2213531", "https://gitlab.com/libtiff/libtiff/-/issues/542"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.6.0+0"]

[[jlsec_sources]]
id = "CVE-2023-3164"
imported = 2025-09-29T17:46:20.450Z
modified = 2024-11-21T08:16:36.097Z
published = 2023-11-02T12:15:09.543Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-3164"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-3164"
```

# A heap-buffer-overflow vulnerability was found in LibTIFF, in extractImageSection() at tools/tiffcro...

A heap-buffer-overflow vulnerability was found in LibTIFF, in extractImageSection() at tools/tiffcrop.c:7916 and tools/tiffcrop.c:7801. This flaw allows attackers to cause a denial of service via a crafted tiff file.

