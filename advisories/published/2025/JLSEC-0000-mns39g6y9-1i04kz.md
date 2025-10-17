```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns39g6y9-1i04kz"
modified = 2025-10-17T17:21:54.225Z
upstream = ["CVE-2022-29824"]
references = ["http://packetstormsecurity.com/files/167345/libxml2-xmlBufAdd-Heap-Buffer-Overflow.html", "http://packetstormsecurity.com/files/169825/libxml2-xmlParseNameComplex-Integer-Overflow.html", "https://gitlab.gnome.org/GNOME/libxml2/-/commit/2554a2408e09f13652049e5ffb0d26196b02ebab", "https://gitlab.gnome.org/GNOME/libxml2/-/commit/6c283d83eccd940bcde15634ac8c7f100e3caefd", "https://gitlab.gnome.org/GNOME/libxml2/-/tags/v2.9.14", "https://gitlab.gnome.org/GNOME/libxslt/-/tags", "https://lists.debian.org/debian-lts-announce/2022/05/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FZOBT5Y6Y2QLDDX2HZGMV7MJMWGXORKK/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/P3NVZVWFRBXBI3AKZZWUWY6INQQPQVSF/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/P5363EDV5VHZ5C77ODA43RYDCPMA7ARM/", "https://security.gentoo.org/glsa/202210-03", "https://security.netapp.com/advisory/ntap-20220715-0006/", "https://www.debian.org/security/2022/dsa-5142", "https://www.oracle.com/security-alerts/cpujul2022.html", "http://packetstormsecurity.com/files/167345/libxml2-xmlBufAdd-Heap-Buffer-Overflow.html", "http://packetstormsecurity.com/files/169825/libxml2-xmlParseNameComplex-Integer-Overflow.html", "https://gitlab.gnome.org/GNOME/libxml2/-/commit/2554a2408e09f13652049e5ffb0d26196b02ebab", "https://gitlab.gnome.org/GNOME/libxml2/-/commit/6c283d83eccd940bcde15634ac8c7f100e3caefd", "https://gitlab.gnome.org/GNOME/libxml2/-/tags/v2.9.14", "https://gitlab.gnome.org/GNOME/libxslt/-/tags", "https://lists.debian.org/debian-lts-announce/2022/05/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FZOBT5Y6Y2QLDDX2HZGMV7MJMWGXORKK/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/P3NVZVWFRBXBI3AKZZWUWY6INQQPQVSF/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/P5363EDV5VHZ5C77ODA43RYDCPMA7ARM/", "https://security.gentoo.org/glsa/202210-03", "https://security.netapp.com/advisory/ntap-20220715-0006/", "https://www.debian.org/security/2022/dsa-5142", "https://www.oracle.com/security-alerts/cpujul2022.html"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.9.14+0"]
[[affected]]
pkg = "XSLT_jll"
ranges = ["< 1.1.41+0"]

[[jlsec_sources]]
id = "CVE-2022-29824"
imported = 2025-10-17T17:21:54.225Z
modified = 2024-11-21T06:59:45.417Z
published = 2022-05-03T03:15:06.687Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-29824"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-29824"
```

# In libxml2 before 2.9.14, several buffer handling functions in buf.c (xmlBuf*) and tree.c (xmlBuffer...

In libxml2 before 2.9.14, several buffer handling functions in buf.c (xmlBuf*) and tree.c (xmlBuffer*) don't check for integer overflows. This can result in out-of-bounds memory writes. Exploitation requires a victim to open a crafted, multi-gigabyte XML file. Other software using libxml2's buffer functions, for example libxslt through 1.1.35, is affected as well.

