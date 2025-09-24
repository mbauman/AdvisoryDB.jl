```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448kpf-1k8a18t"
modified = 2025-09-23T03:04:04.563Z
upstream = ["CVE-2022-1056"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-1056.json", "https://gitlab.com/libtiff/libtiff/-/issues/391", "https://gitlab.com/libtiff/libtiff/-/merge_requests/307", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221228-0008/", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-1056.json", "https://gitlab.com/libtiff/libtiff/-/issues/391", "https://gitlab.com/libtiff/libtiff/-/merge_requests/307", "https://security.gentoo.org/glsa/202210-10", "https://security.netapp.com/advisory/ntap-20221228-0008/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.3.0+0, < 4.4.0+0"]

[database_specific.source]
id = "CVE-2022-1056"
modified = "2024-11-21T06:39:56.823Z"
published = "2022-03-28T19:15:08.837Z"
imported = "2025-09-23T03:04:04.563Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1056"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1056"
```

# Out-of-bounds Read error in tiffcrop in libtiff 4.3.0 allows attackers to cause a denial-of-service ...

Out-of-bounds Read error in tiffcrop in libtiff 4.3.0 allows attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit 46dc8fcd.

