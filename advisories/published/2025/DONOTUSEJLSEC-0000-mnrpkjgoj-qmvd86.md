```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrpkjgoj-qmvd86"
modified = 2025-10-08T03:23:36.115Z
upstream = ["CVE-2021-39212"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/01faddbe2711a4156180c4a92837e2f23683cc68", "https://github.com/ImageMagick/ImageMagick/commit/35893e7cad78ce461fcaffa56076c11700ba5e4e", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qvhr-jj4p-j2qr", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html", "https://github.com/ImageMagick/ImageMagick/commit/01faddbe2711a4156180c4a92837e2f23683cc68", "https://github.com/ImageMagick/ImageMagick/commit/35893e7cad78ce461fcaffa56076c11700ba5e4e", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qvhr-jj4p-j2qr", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = [">= 6.9.12+0, < 6.9.12+4", ">= 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2021-39212"
imported = 2025-10-08T03:23:36.115Z
modified = 2024-11-21T06:18:54.870Z
published = 2021-09-13T18:15:23.907Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-39212"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-39212"
```

# ImageMagick is free software delivered as a ready-to-run binary distribution or as source code that ...

ImageMagick is free software delivered as a ready-to-run binary distribution or as source code that you may use, copy, modify, and distribute in both open and proprietary applications. In affected versions and in certain cases, Postscript files could be read and written when specifically excluded by a `module` policy in `policy.xml`. ex. <policy domain="module" rights="none" pattern="PS" />. The issue has been resolved in ImageMagick 7.1.0-7 and in 6.9.12-22. Fortunately, in the wild, few users utilize the `module` policy and instead use the `coder` policy that is also our workaround recommendation: <policy domain="coder" rights="none" pattern="{PS,EPI,EPS,EPSF,EPSI}" />.

