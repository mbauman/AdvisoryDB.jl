```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-45"
modified = 2000-01-01T00:00:00.000Z
published = 2025-09-23T22:07:20.286Z
upstream = ["CVE-2022-2068"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-332410.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=2c9c35870601b4a44d86ddbf512b38df38285cfa", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=7a9c027159fe9e1bbc2cd38a8a2914bff0d5abd9", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=9639817dac8bbbaa64d09efad7464ccc405527c7", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6WZZBKUHQFGSKGNXXKICSRPL7AMVW5M5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VCMNWKERPBKOEBNL7CLTTX3ZZCZLH7XA/", "https://security.netapp.com/advisory/ntap-20220707-0008/", "https://www.debian.org/security/2022/dsa-5169", "https://www.openssl.org/news/secadv/20220621.txt", "https://cert-portal.siemens.com/productcert/pdf/ssa-332410.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=2c9c35870601b4a44d86ddbf512b38df38285cfa", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=7a9c027159fe9e1bbc2cd38a8a2914bff0d5abd9", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=9639817dac8bbbaa64d09efad7464ccc405527c7", "https://gitlab.com/fraf0/cve-2022-1292-re_score-analysis", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6WZZBKUHQFGSKGNXXKICSRPL7AMVW5M5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VCMNWKERPBKOEBNL7CLTTX3ZZCZLH7XA/", "https://security.netapp.com/advisory/ntap-20220707-0008/", "https://www.debian.org/security/2022/dsa-5169", "https://www.openssl.org/news/secadv/20220621.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.16+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.21.4+0"]

[[jlsec_sources]]
id = "CVE-2022-2068"
imported = 2025-09-23T21:56:31.084Z
modified = 2025-09-15T14:15:33.363Z
published = 2022-06-21T15:15:09.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2068"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2068"
```

# In addition to the c_rehash shell command injection identified in CVE-2022-1292, further circumstanc...

In addition to the c*rehash shell command injection identified in CVE-2022-1292, further circumstances where the c*rehash script does not properly sanitise shell metacharacters to prevent command injection were found by code review. When the CVE-2022-1292 was fixed it was not discovered that there are other places in the script where the file names of certificates being hashed were possibly passed to a command executed through the shell. This script is distributed by some operating systems in a manner where it is automatically executed. On such operating systems, an attacker could execute arbitrary commands with the privileges of the script. Use of the c_rehash script is considered obsolete and should be replaced by the OpenSSL rehash command line tool. Fixed in OpenSSL 3.0.4 (Affected 3.0.0,3.0.1,3.0.2,3.0.3). Fixed in OpenSSL 1.1.1p (Affected 1.1.1-1.1.1o). Fixed in OpenSSL 1.0.2zf (Affected 1.0.2-1.0.2ze).

