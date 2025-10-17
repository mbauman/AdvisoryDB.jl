```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3412jk-15jknih"
modified = 2025-10-17T14:50:10.592Z
upstream = ["CVE-2022-38171"]
references = ["http://www.openwall.com/lists/oss-security/2022/09/02/11", "http://www.xpdfreader.com/security-fixes.html", "https://dl.xpdfreader.com/xpdf-4.04.tar.gz", "https://github.com/jeffssh/CVE-2021-30860", "https://github.com/zmanion/Vulnerabilities/blob/main/CVE-2022-38171.md", "https://googleprojectzero.blogspot.com/2021/12/a-deep-dive-into-nso-zero-click.html", "https://www.cve.org/CVERecord?id=CVE-2021-30860", "http://www.openwall.com/lists/oss-security/2022/09/02/11", "http://www.xpdfreader.com/security-fixes.html", "https://dl.xpdfreader.com/xpdf-4.04.tar.gz", "https://github.com/jeffssh/CVE-2021-30860", "https://github.com/zmanion/Vulnerabilities/blob/main/CVE-2022-38171.md", "https://googleprojectzero.blogspot.com/2021/12/a-deep-dive-into-nso-zero-click.html", "https://www.cve.org/CVERecord?id=CVE-2021-30860"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["< 23.12.0+0"]

[[jlsec_sources]]
id = "CVE-2022-38171"
imported = 2025-10-17T14:50:10.592Z
modified = 2024-11-21T07:15:56.110Z
published = 2022-08-22T19:15:11.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-38171"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-38171"
```

# Xpdf prior to version 4.04 contains an integer overflow in the JBIG2 decoder (JBIG2Stream::readTextR...

Xpdf prior to version 4.04 contains an integer overflow in the JBIG2 decoder (JBIG2Stream::readTextRegionSeg() in JBIG2Stream.cc). Processing a specially crafted PDF file or JBIG2 image could lead to a crash or the execution of arbitrary code. This is similar to the vulnerability described by CVE-2021-30860 (Apple CoreGraphics).

