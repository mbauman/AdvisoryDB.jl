```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrpkipdv-pcz6tu"
modified = 2025-10-08T03:23:00.739Z
upstream = ["CVE-2023-47038"]
references = ["https://access.redhat.com/errata/RHSA-2024:2228", "https://access.redhat.com/errata/RHSA-2024:3128", "https://access.redhat.com/security/cve/CVE-2023-47038", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1056746", "https://bugzilla.redhat.com/show_bug.cgi?id=2249523", "https://access.redhat.com/errata/RHSA-2024:2228", "https://access.redhat.com/errata/RHSA-2024:3128", "https://access.redhat.com/security/cve/CVE-2023-47038", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1056746", "https://bugzilla.redhat.com/show_bug.cgi?id=2249523", "https://github.com/Perl/perl5/commit/12c313ce49b36160a7ca2e9b07ad5bd92ee4a010", "https://github.com/Perl/perl5/commit/7047915eef37fccd93e7cd985c29fe6be54650b6", "https://github.com/Perl/perl5/commit/ff1f9f59360afeebd6f75ca1502f5c3ebf077da3", "https://github.com/aquasecurity/trivy/discussions/8400", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/GNEEWAACXQCEEAKSG7XX2D5YDRWLCIZJ/", "https://perldoc.perl.org/perl5382delta#CVE-2023-47038-Write-past-buffer-end-via-illegal-user-defined-Unicode-property", "https://ubuntu.com/security/CVE-2023-47100", "https://www.suse.com/security/cve/CVE-2023-47100.html"]

[[affected]]
pkg = "Perl_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-47038"
imported = 2025-10-08T03:23:00.720Z
modified = 2025-10-07T18:15:32.663Z
published = 2023-12-18T14:15:08.933Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-47038"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-47038"
```

# A vulnerability was found in perl 5.30.0 through 5.38.0

A vulnerability was found in perl 5.30.0 through 5.38.0. This issue occurs when a crafted regular expression is compiled by perl, which can allow an attacker controlled byte buffer overflow in a heap allocated buffer.

