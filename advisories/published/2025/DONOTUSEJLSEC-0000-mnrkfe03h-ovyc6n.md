```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkfe03h-ovyc6n"
modified = 2025-10-04T13:00:32.381Z
upstream = ["CVE-2015-2326"]
references = ["http://lists.opensuse.org/opensuse-updates/2015-05/msg00014.html", "https://bugs.exim.org/show_bug.cgi?id=1592", "https://fortiguard.com/zeroday/FG-VD-15-016", "https://www.pcre.org/original/changelog.txt", "http://lists.opensuse.org/opensuse-updates/2015-05/msg00014.html", "https://bugs.exim.org/show_bug.cgi?id=1592", "https://fortiguard.com/zeroday/FG-VD-15-016", "https://www.pcre.org/original/changelog.txt"]

[[affected]]
pkg = "PCRE2_jll"
ranges = ["< 10.40.0+0"]

[[jlsec_sources]]
id = "CVE-2015-2326"
imported = 2025-10-04T13:00:32.381Z
modified = 2024-11-21T02:27:13.307Z
published = 2020-01-14T17:15:12.177Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-2326"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-2326"
```

# The pcre_compile2 function in PCRE before 8.37 allows context-dependent attackers to compile incorre...

The pcre_compile2 function in PCRE before 8.37 allows context-dependent attackers to compile incorrect code and cause a denial of service (out-of-bounds read) via regular expression with a group containing both a forward referencing subroutine call and a recursive back reference, as demonstrated by "((?+1)(\1))/".

