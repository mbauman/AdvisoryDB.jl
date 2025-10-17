```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns39g6y7-x8beyz"
modified = 2025-10-17T17:21:54.223Z
upstream = ["CVE-2022-23308"]
references = ["http://seclists.org/fulldisclosure/2022/May/33", "http://seclists.org/fulldisclosure/2022/May/34", "http://seclists.org/fulldisclosure/2022/May/35", "http://seclists.org/fulldisclosure/2022/May/36", "http://seclists.org/fulldisclosure/2022/May/37", "http://seclists.org/fulldisclosure/2022/May/38", "https://github.com/GNOME/libxml2/commit/652dd12a858989b14eed4e84e453059cd3ba340e", "https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.9.13/NEWS", "https://lists.debian.org/debian-lts-announce/2022/04/msg00004.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LA3MWWAYZADWJ5F6JOUBX65UZAMQB7RF/", "https://security.gentoo.org/glsa/202210-03", "https://security.netapp.com/advisory/ntap-20220331-0008/", "https://support.apple.com/kb/HT213253", "https://support.apple.com/kb/HT213254", "https://support.apple.com/kb/HT213255", "https://support.apple.com/kb/HT213256", "https://support.apple.com/kb/HT213257", "https://support.apple.com/kb/HT213258", "https://www.oracle.com/security-alerts/cpujul2022.html", "http://seclists.org/fulldisclosure/2022/May/33", "http://seclists.org/fulldisclosure/2022/May/34", "http://seclists.org/fulldisclosure/2022/May/35", "http://seclists.org/fulldisclosure/2022/May/36", "http://seclists.org/fulldisclosure/2022/May/37", "http://seclists.org/fulldisclosure/2022/May/38", "https://github.com/GNOME/libxml2/commit/652dd12a858989b14eed4e84e453059cd3ba340e", "https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.9.13/NEWS", "https://lists.debian.org/debian-lts-announce/2022/04/msg00004.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LA3MWWAYZADWJ5F6JOUBX65UZAMQB7RF/", "https://security.gentoo.org/glsa/202210-03", "https://security.netapp.com/advisory/ntap-20220331-0008/", "https://support.apple.com/kb/HT213253", "https://support.apple.com/kb/HT213254", "https://support.apple.com/kb/HT213255", "https://support.apple.com/kb/HT213256", "https://support.apple.com/kb/HT213257", "https://support.apple.com/kb/HT213258", "https://www.oracle.com/security-alerts/cpujul2022.html"]

[[affected]]
pkg = "XML2_jll"
ranges = ["< 2.9.14+0"]

[[jlsec_sources]]
id = "CVE-2022-23308"
imported = 2025-10-17T17:21:54.223Z
modified = 2025-05-05T17:17:56.523Z
published = 2022-02-26T05:15:08.280Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-23308"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-23308"
```

# valid.c in libxml2 before 2.9.13 has a use-after-free of ID and IDREF attributes.

valid.c in libxml2 before 2.9.13 has a use-after-free of ID and IDREF attributes.

