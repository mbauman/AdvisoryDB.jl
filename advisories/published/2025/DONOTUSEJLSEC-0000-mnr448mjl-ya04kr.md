```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr448mjl-ya04kr"
modified = 2025-09-23T03:04:06.945Z
upstream = ["CVE-2025-9165"]
references = ["http://www.libtiff.org/", "https://drive.google.com/file/d/1FWhmkzksH8-qU0ZM6seBzGNB3aPnX3G8/view?usp=sharing", "https://gitlab.com/libtiff/libtiff/-/commit/ed141286a37f6e5ddafb5069347ff5d587e7a4e0", "https://gitlab.com/libtiff/libtiff/-/issues/728", "https://gitlab.com/libtiff/libtiff/-/merge_requests/747", "https://vuldb.com/?ctiid.320543", "https://vuldb.com/?id.320543", "https://vuldb.com/?submit.630506", "https://vuldb.com/?submit.630507", "https://gitlab.com/libtiff/libtiff/-/issues/728#note_2709263214"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.7.0+0"]

[database_specific.source]
id = "CVE-2025-9165"
modified = "2025-09-11T16:06:41.283Z"
published = "2025-08-19T20:15:37.557Z"
imported = "2025-09-23T03:04:06.945Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-9165"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-9165"
```

# A flaw has been found in LibTIFF 4.7.0

A flaw has been found in LibTIFF 4.7.0. This affects the function *TIFFmallocExt/*TIFFCheckRealloc/TIFFHashSetNew/InitCCITTFax3 of the file tools/tiffcmp.c of the component tiffcmp. Executing manipulation can lead to memory leak. The attack is restricted to local execution. The exploit has been published and may be used. This patch is called ed141286a37f6e5ddafb5069347ff5d587e7a4e0. It is best practice to apply a patch to resolve this issue.

