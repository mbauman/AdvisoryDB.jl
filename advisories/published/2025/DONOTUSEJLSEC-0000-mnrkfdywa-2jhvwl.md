```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkfdywa-2jhvwl"
modified = 2025-10-04T13:00:30.826Z
upstream = ["CVE-2014-8964"]
references = ["http://advisories.mageia.org/MGASA-2014-0534.html", "http://bugs.exim.org/show_bug.cgi?id=1546", "http://lists.fedoraproject.org/pipermail/package-announce/2014-December/145843.html", "http://lists.fedoraproject.org/pipermail/package-announce/2015-January/147474.html", "http://lists.fedoraproject.org/pipermail/package-announce/2015-January/147511.html", "http://lists.fedoraproject.org/pipermail/package-announce/2015-January/147516.html", "http://lists.opensuse.org/opensuse-updates/2015-05/msg00014.html", "http://rhn.redhat.com/errata/RHSA-2015-0330.html", "http://www.exim.org/viewvc/pcre?view=revision&revision=1513", "http://www.mandriva.com/security/advisories?name=MDVSA-2015:002", "http://www.mandriva.com/security/advisories?name=MDVSA-2015:137", "http://www.openwall.com/lists/oss-security/2014/11/21/6", "http://www.oracle.com/technetwork/topics/security/bulletinjul2015-2511963.html", "http://www.securityfocus.com/bid/71206", "https://bugzilla.redhat.com/show_bug.cgi?id=1166147", "https://security.gentoo.org/glsa/201607-02", "http://advisories.mageia.org/MGASA-2014-0534.html", "http://bugs.exim.org/show_bug.cgi?id=1546", "http://lists.fedoraproject.org/pipermail/package-announce/2014-December/145843.html", "http://lists.fedoraproject.org/pipermail/package-announce/2015-January/147474.html", "http://lists.fedoraproject.org/pipermail/package-announce/2015-January/147511.html", "http://lists.fedoraproject.org/pipermail/package-announce/2015-January/147516.html", "http://lists.opensuse.org/opensuse-updates/2015-05/msg00014.html", "http://rhn.redhat.com/errata/RHSA-2015-0330.html", "http://www.exim.org/viewvc/pcre?view=revision&revision=1513", "http://www.mandriva.com/security/advisories?name=MDVSA-2015:002", "http://www.mandriva.com/security/advisories?name=MDVSA-2015:137", "http://www.openwall.com/lists/oss-security/2014/11/21/6", "http://www.oracle.com/technetwork/topics/security/bulletinjul2015-2511963.html", "http://www.securityfocus.com/bid/71206", "https://bugzilla.redhat.com/show_bug.cgi?id=1166147", "https://security.gentoo.org/glsa/201607-02"]

[[affected]]
pkg = "PCRE2_jll"
ranges = ["< 10.40.0+0"]

[[jlsec_sources]]
id = "CVE-2014-8964"
imported = 2025-10-04T13:00:30.826Z
modified = 2025-04-12T10:46:40.837Z
published = 2014-12-16T18:59:10.747Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-8964"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-8964"
```

# Heap-based buffer overflow in PCRE 8.36 and earlier allows remote attackers to cause a denial of ser...

Heap-based buffer overflow in PCRE 8.36 and earlier allows remote attackers to cause a denial of service (crash) or have other unspecified impact via a crafted regular expression, related to an assertion that allows zero repeats.

