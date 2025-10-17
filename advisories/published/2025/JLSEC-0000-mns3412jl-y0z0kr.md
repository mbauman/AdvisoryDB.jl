```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3412jl-y0z0kr"
modified = 2025-10-17T14:50:10.593Z
upstream = ["CVE-2022-38784"]
references = ["http://www.openwall.com/lists/oss-security/2022/09/02/11", "https://github.com/jeffssh/CVE-2021-30860", "https://github.com/zmanion/Vulnerabilities/blob/main/CVE-2022-38171.md", "https://gitlab.freedesktop.org/poppler/poppler/-/merge_requests/1261/diffs?commit_id=27354e9d9696ee2bc063910a6c9a6b27c5184a52", "https://lists.debian.org/debian-lts-announce/2022/09/msg00030.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BGY72LBJMFAKQWC2XH4MRPIGPQLXTFL6/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/E5Z2677EQUWVHJLGSH5DQX53EK6MY2M2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/J546EJUKUOPWA3JSLP7DYNBAU3YGNCCW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NLKN3HJKZSGEEKOF57DM7Q3IB74HP5VW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TQAO6O2XHPQHNW2MWOCJJ4C3YWS2VV4K/", "https://poppler.freedesktop.org/releases.html", "https://security.gentoo.org/glsa/202209-21", "https://www.cve.org/CVERecord?id=CVE-2022-38171", "https://www.debian.org/security/2022/dsa-5224", "http://www.openwall.com/lists/oss-security/2022/09/02/11", "https://github.com/jeffssh/CVE-2021-30860", "https://github.com/zmanion/Vulnerabilities/blob/main/CVE-2022-38171.md", "https://gitlab.freedesktop.org/poppler/poppler/-/merge_requests/1261/diffs?commit_id=27354e9d9696ee2bc063910a6c9a6b27c5184a52", "https://lists.debian.org/debian-lts-announce/2022/09/msg00030.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BGY72LBJMFAKQWC2XH4MRPIGPQLXTFL6/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/E5Z2677EQUWVHJLGSH5DQX53EK6MY2M2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/J546EJUKUOPWA3JSLP7DYNBAU3YGNCCW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NLKN3HJKZSGEEKOF57DM7Q3IB74HP5VW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TQAO6O2XHPQHNW2MWOCJJ4C3YWS2VV4K/", "https://poppler.freedesktop.org/releases.html", "https://security.gentoo.org/glsa/202209-21", "https://www.cve.org/CVERecord?id=CVE-2022-38171", "https://www.debian.org/security/2022/dsa-5224"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["< 23.12.0+0"]

[[jlsec_sources]]
id = "CVE-2022-38784"
imported = 2025-10-17T14:50:10.593Z
modified = 2024-11-21T07:17:04.843Z
published = 2022-08-30T03:15:07.307Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-38784"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-38784"
```

# Poppler prior to and including 22.08.0 contains an integer overflow in the JBIG2 decoder (JBIG2Strea...

Poppler prior to and including 22.08.0 contains an integer overflow in the JBIG2 decoder (JBIG2Stream::readTextRegionSeg() in JBIGStream.cc). Processing a specially crafted PDF file or JBIG2 image could lead to a crash or the execution of arbitrary code. This is similar to the vulnerability described by CVE-2022-38171 in Xpdf.

