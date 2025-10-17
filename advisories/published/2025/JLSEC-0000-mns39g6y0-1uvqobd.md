```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns39g6y0-1uvqobd"
modified = 2025-10-17T17:21:54.216Z
upstream = ["CVE-2019-20388"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00047.html", "https://gitlab.gnome.org/GNOME/libxml2/merge_requests/68", "https://lists.debian.org/debian-lts-announce/2020/09/msg00009.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/545SPOI3ZPPNPX4TFRIVE4JVRTJRKULL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5R55ZR52RMBX24TQTWHCIWKJVRV6YAWI/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JDPF3AAVKUAKDYFMFKSIQSVVS3EEFPQH/", "https://security.gentoo.org/glsa/202010-04", "https://security.netapp.com/advisory/ntap-20200702-0005/", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujul2020.html", "https://www.oracle.com/security-alerts/cpujul2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "http://lists.opensuse.org/opensuse-security-announce/2020-05/msg00047.html", "https://gitlab.gnome.org/GNOME/libxml2/merge_requests/68", "https://lists.debian.org/debian-lts-announce/2020/09/msg00009.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/545SPOI3ZPPNPX4TFRIVE4JVRTJRKULL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5R55ZR52RMBX24TQTWHCIWKJVRV6YAWI/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JDPF3AAVKUAKDYFMFKSIQSVVS3EEFPQH/", "https://security.gentoo.org/glsa/202010-04", "https://security.netapp.com/advisory/ntap-20200702-0005/", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujul2020.html", "https://www.oracle.com/security-alerts/cpujul2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html"]

[[affected]]
pkg = "XML2_jll"
ranges = [">= 2.9.10+0, < 2.9.12+0"]

[[jlsec_sources]]
id = "CVE-2019-20388"
imported = 2025-10-17T17:21:54.216Z
modified = 2024-11-21T04:38:21.893Z
published = 2020-01-21T23:15:13.553Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-20388"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-20388"
```

# xmlSchemaPreRun in xmlschemas.c in libxml2 2.9.10 allows an xmlSchemaValidateStream memory leak.

xmlSchemaPreRun in xmlschemas.c in libxml2 2.9.10 allows an xmlSchemaValidateStream memory leak.

