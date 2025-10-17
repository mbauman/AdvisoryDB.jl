```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns2fifzx-r96hwc"
modified = 2025-10-17T03:23:50.781Z
upstream = ["CVE-2024-56406"]
references = ["https://github.com/Perl/perl5/commit/87f42aa0e0096e9a346c9672aa3a0bd3bef8c1dd.patch", "https://metacpan.org/release/SHAY/perl-5.38.4/changes", "https://metacpan.org/release/SHAY/perl-5.40.2/changes", "http://www.openwall.com/lists/oss-security/2025/04/13/3", "http://www.openwall.com/lists/oss-security/2025/04/13/4", "http://www.openwall.com/lists/oss-security/2025/04/13/5"]

[[affected]]
pkg = "Perl_jll"
ranges = [">= 5.34.0+0"]

[[jlsec_sources]]
id = "CVE-2024-56406"
imported = 2025-10-17T03:23:50.757Z
modified = 2025-10-16T14:15:34.083Z
published = 2025-04-13T14:15:14.527Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-56406"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-56406"
```

# A heap buffer overflow vulnerability was discovered in Perl.

A heap buffer overflow vulnerability was discovered in Perl.

Release branches 5.34, 5.36, 5.38 and 5.40 are affected, including development versions from 5.33.1 through 5.41.10.

When there are non-ASCII bytes in the left-hand-side of the `tr` operator, `S_do_trans_invmap` can overflow the destination pointer `d`.

$ perl -e '$_ = "\x{FF}" x 1000000; tr/\xFF/\x{100}/;'
   Segmentation fault (core dumped)

It is believed that this vulnerability can enable Denial of Service and possibly Code Execution attacks on platforms that lack sufficient defenses.

