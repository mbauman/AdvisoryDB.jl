```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkfe0u3-1vqtz8w"
modified = 2025-10-04T13:00:33.339Z
upstream = ["CVE-2018-25032"]
references = ["http://seclists.org/fulldisclosure/2022/May/33", "http://seclists.org/fulldisclosure/2022/May/35", "http://seclists.org/fulldisclosure/2022/May/38", "http://www.openwall.com/lists/oss-security/2022/03/25/2", "http://www.openwall.com/lists/oss-security/2022/03/26/1", "https://cert-portal.siemens.com/productcert/pdf/ssa-333517.pdf", "https://github.com/madler/zlib/commit/5c44459c3b28a9bd3283aaceab7c615f8020c531", "https://github.com/madler/zlib/compare/v1.2.11...v1.2.12", "https://github.com/madler/zlib/issues/605", "https://lists.debian.org/debian-lts-announce/2022/04/msg00000.html", "https://lists.debian.org/debian-lts-announce/2022/05/msg00008.html", "https://lists.debian.org/debian-lts-announce/2022/09/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DCZFIJBJTZ7CL5QXBFKTQ22Q26VINRUF/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DF62MVMH3QUGMBDCB3DY2ERQ6EBHTADB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JZZPTWRYQULAOL3AW7RZJNVZ2UONXCV4/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NS2D2GFPFGOJUL4WQ3DUAY7HF4VWQ77F/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VOKNP2L734AEL47NRYGVZIKEFOUBQY5Y/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XOKFMSNQ5D5WGMALBNBXU3GE442V74WU/", "https://security.gentoo.org/glsa/202210-42", "https://security.netapp.com/advisory/ntap-20220526-0009/", "https://security.netapp.com/advisory/ntap-20220729-0004/", "https://support.apple.com/kb/HT213255", "https://support.apple.com/kb/HT213256", "https://support.apple.com/kb/HT213257", "https://www.debian.org/security/2022/dsa-5111", "https://www.openwall.com/lists/oss-security/2022/03/24/1", "https://www.openwall.com/lists/oss-security/2022/03/28/1", "https://www.openwall.com/lists/oss-security/2022/03/28/3", "https://www.oracle.com/security-alerts/cpujul2022.html", "http://seclists.org/fulldisclosure/2022/May/33", "http://seclists.org/fulldisclosure/2022/May/35", "http://seclists.org/fulldisclosure/2022/May/38", "http://www.openwall.com/lists/oss-security/2022/03/25/2", "http://www.openwall.com/lists/oss-security/2022/03/26/1", "https://cert-portal.siemens.com/productcert/pdf/ssa-333517.pdf", "https://github.com/madler/zlib/commit/5c44459c3b28a9bd3283aaceab7c615f8020c531", "https://github.com/madler/zlib/compare/v1.2.11...v1.2.12", "https://github.com/madler/zlib/issues/605", "https://lists.debian.org/debian-lts-announce/2022/04/msg00000.html", "https://lists.debian.org/debian-lts-announce/2022/05/msg00008.html", "https://lists.debian.org/debian-lts-announce/2022/09/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DCZFIJBJTZ7CL5QXBFKTQ22Q26VINRUF/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DF62MVMH3QUGMBDCB3DY2ERQ6EBHTADB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JZZPTWRYQULAOL3AW7RZJNVZ2UONXCV4/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NS2D2GFPFGOJUL4WQ3DUAY7HF4VWQ77F/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VOKNP2L734AEL47NRYGVZIKEFOUBQY5Y/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XOKFMSNQ5D5WGMALBNBXU3GE442V74WU/", "https://security.gentoo.org/glsa/202210-42", "https://security.netapp.com/advisory/ntap-20220526-0009/", "https://security.netapp.com/advisory/ntap-20220729-0004/", "https://support.apple.com/kb/HT213255", "https://support.apple.com/kb/HT213256", "https://support.apple.com/kb/HT213257", "https://www.debian.org/security/2022/dsa-5111", "https://www.openwall.com/lists/oss-security/2022/03/24/1", "https://www.openwall.com/lists/oss-security/2022/03/28/1", "https://www.openwall.com/lists/oss-security/2022/03/28/3", "https://www.oracle.com/security-alerts/cpujul2022.html"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.7+0"]
[[affected]]
pkg = "Zlib_jll"
ranges = ["< 1.2.12+3"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.21.4+0"]
[[affected]]
pkg = "GCCBootstrap_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2018-25032"
imported = 2025-10-04T13:00:33.339Z
modified = 2025-08-21T20:37:11.840Z
published = 2022-03-25T09:15:08.187Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-25032"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-25032"
```

# zlib before 1.2.12 allows memory corruption when deflating (i.e., when compressing) if the input has...

zlib before 1.2.12 allows memory corruption when deflating (i.e., when compressing) if the input has many distant matches.

