```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrdkebs0-gy0wuk"
modified = 2025-09-29T17:46:22.368Z
upstream = ["CVE-2025-8534"]
references = ["http://www.libtiff.org/", "https://drive.google.com/file/d/15JPA3kLYiYD-nRNJ8y8HmnYjhv9NE7k6/view?usp=drive_link", "https://gitlab.com/libtiff/libtiff/-/commit/6ba36f159fd396ad11bf6b7874554197736ecc8b", "https://gitlab.com/libtiff/libtiff/-/issues/718", "https://gitlab.com/libtiff/libtiff/-/merge_requests/746", "https://vuldb.com/?ctiid.318664", "https://vuldb.com/?id.318664", "https://vuldb.com/?submit.617831", "https://gitlab.com/libtiff/libtiff/-/issues/718", "https://vuldb.com/?submit.617831"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.6.0+0, < 4.7.0+0"]

[[jlsec_sources]]
id = "CVE-2025-8534"
imported = 2025-09-29T17:46:22.368Z
modified = 2025-09-11T16:56:25.600Z
published = 2025-08-05T00:15:56.880Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-8534"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-8534"
```

# A vulnerability classified as problematic was found in libtiff 4.6.0

A vulnerability classified as problematic was found in libtiff 4.6.0. This vulnerability affects the function PS_Lvl2page of the file tools/tiff2ps.c of the component tiff2ps. The manipulation leads to null pointer dereference. It is possible to launch the attack on the local host. The complexity of an attack is rather high. The exploitation appears to be difficult. The exploit has been disclosed to the public and may be used. The name of the patch is 6ba36f159fd396ad11bf6b7874554197736ecc8b. It is recommended to apply a patch to fix this issue. One of the maintainers explains, that "[t]his error only occurs if DEFER_STRILE_LOAD (defer-strile-load:BOOL=ON) or TIFFOpen( .. "rD") option is used."

