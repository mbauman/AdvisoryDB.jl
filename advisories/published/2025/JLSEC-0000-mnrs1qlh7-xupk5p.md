```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrs1qlh7-xupk5p"
modified = 2025-10-09T21:00:34.747Z
upstream = ["CVE-2018-18064"]
references = ["https://gitlab.freedesktop.org/cairo/cairo/issues/341", "https://lists.apache.org/thread.html/rf9fa47ab66495c78bb4120b0754dd9531ca2ff0430f6685ac9b07772%40%3Cdev.mina.apache.org%3E", "https://gitlab.freedesktop.org/cairo/cairo/issues/341", "https://lists.apache.org/thread.html/rf9fa47ab66495c78bb4120b0754dd9531ca2ff0430f6685ac9b07772%40%3Cdev.mina.apache.org%3E"]

[[affected]]
pkg = "Cairo_jll"
ranges = ["< 1.16.0+0"]

[[jlsec_sources]]
id = "CVE-2018-18064"
imported = 2025-10-09T21:00:34.747Z
modified = 2024-11-21T03:55:25.210Z
published = 2018-10-08T18:29:00.270Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-18064"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-18064"
```

# cairo through 1.15.14 has an out-of-bounds stack-memory write during processing of a crafted documen...

cairo through 1.15.14 has an out-of-bounds stack-memory write during processing of a crafted document by WebKitGTK+ because of the interaction between cairo-rectangular-scan-converter.c (the generate and render_rows functions) and cairo-image-compositor.c (the _cairo_image_spans_and_zero function).

