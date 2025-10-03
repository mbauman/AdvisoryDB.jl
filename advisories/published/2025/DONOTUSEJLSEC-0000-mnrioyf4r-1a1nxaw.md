```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrioyf4r-1a1nxaw"
modified = 2025-10-03T07:52:49.179Z
upstream = ["CVE-2015-2325"]
references = ["http://lists.opensuse.org/opensuse-updates/2015-05/msg00014.html", "https://bugs.exim.org/show_bug.cgi?id=1591", "https://fortiguard.com/zeroday/FG-VD-15-015", "https://www.pcre.org/original/changelog.txt", "http://lists.opensuse.org/opensuse-updates/2015-05/msg00014.html", "https://bugs.exim.org/show_bug.cgi?id=1591", "https://fortiguard.com/zeroday/FG-VD-15-015", "https://www.pcre.org/original/changelog.txt"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2015-2325"
imported = 2025-10-03T07:52:49.179Z
modified = 2024-11-21T02:27:13.130Z
published = 2020-01-14T17:15:12.080Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-2325"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-2325"
```

# The compile_branch function in PCRE before 8.37 allows context-dependent attackers to compile incorr...

The compile_branch function in PCRE before 8.37 allows context-dependent attackers to compile incorrect code, cause a denial of service (out-of-bounds heap read and crash), or possibly have other unspecified impact via a regular expression with a group containing a forward reference repeated a large number of times within a repeated outer group that has a zero minimum quantifier.

