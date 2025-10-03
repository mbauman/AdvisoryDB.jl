```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkeaao-77siit"
modified = 2025-09-29T17:46:20.448Z
upstream = ["CVE-2023-2908"]
references = ["https://access.redhat.com/security/cve/CVE-2023-2908", "https://bugzilla.redhat.com/show_bug.cgi?id=2218830", "https://gitlab.com/libtiff/libtiff/-/commit/9bd48f0dbd64fb94dc2b5b05238fde0bfdd4ff3f", "https://gitlab.com/libtiff/libtiff/-/merge_requests/479", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://security.netapp.com/advisory/ntap-20230731-0004/", "https://access.redhat.com/security/cve/CVE-2023-2908", "https://bugzilla.redhat.com/show_bug.cgi?id=2218830", "https://gitlab.com/libtiff/libtiff/-/commit/9bd48f0dbd64fb94dc2b5b05238fde0bfdd4ff3f", "https://gitlab.com/libtiff/libtiff/-/merge_requests/479", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://security.netapp.com/advisory/ntap-20230731-0004/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2023-2908"
imported = 2025-09-29T17:46:20.448Z
modified = 2024-11-21T07:59:32.713Z
published = 2023-06-30T22:15:10.017Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-2908"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-2908"
```

# A null pointer dereference issue was found in Libtiff's tif_dir.c file

A null pointer dereference issue was found in Libtiff's tif_dir.c file. This issue may allow an attacker to pass a crafted TIFF image file to the tiffcp utility which triggers a runtime error that causes undefined behavior. This will result in an application crash, eventually leading to a denial of service.

