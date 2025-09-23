```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr43tbll-g6v9lj"
modified = 2025-09-23T02:52:12.921Z
upstream = ["CVE-2021-21300"]
references = ["http://packetstormsecurity.com/files/163978/Git-LFS-Clone-Command-Execution.html", "http://seclists.org/fulldisclosure/2021/Apr/60", "http://www.openwall.com/lists/oss-security/2021/03/09/3", "https://git-scm.com/docs/git-config#Documentation/git-config.txt-coresymlinks", "https://git-scm.com/docs/gitattributes#_filter", "https://github.com/git/git/commit/684dd4c2b414bcf648505e74498a608f28de4592", "https://github.com/git/git/security/advisories/GHSA-8prw-h3cq-mghm", "https://lists.debian.org/debian-lts-announce/2022/10/msg00014.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BBPNGLQSYJHLZZ37BO42YY6S5OTIF4L4/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LCLJJLKKMS5WRFO6C475AOUZTWQLIARX/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LMXX2POK5X576BSDWSXGU7EIK6I72ERU/", "https://lore.kernel.org/git/xmqqim6019yd.fsf%40gitster.c.googlers.com/", "https://security.gentoo.org/glsa/202104-01", "https://support.apple.com/kb/HT212320", "http://packetstormsecurity.com/files/163978/Git-LFS-Clone-Command-Execution.html", "http://seclists.org/fulldisclosure/2021/Apr/60", "http://www.openwall.com/lists/oss-security/2021/03/09/3", "https://git-scm.com/docs/git-config#Documentation/git-config.txt-coresymlinks", "https://git-scm.com/docs/gitattributes#_filter", "https://github.com/git/git/commit/684dd4c2b414bcf648505e74498a608f28de4592", "https://github.com/git/git/security/advisories/GHSA-8prw-h3cq-mghm", "https://lists.debian.org/debian-lts-announce/2022/10/msg00014.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BBPNGLQSYJHLZZ37BO42YY6S5OTIF4L4/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LCLJJLKKMS5WRFO6C475AOUZTWQLIARX/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LMXX2POK5X576BSDWSXGU7EIK6I72ERU/", "https://lore.kernel.org/git/xmqqim6019yd.fsf%40gitster.c.googlers.com/", "https://security.gentoo.org/glsa/202104-01", "https://support.apple.com/kb/HT212320"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.31.0+0"]

[database_specific.source]
id = "CVE-2021-21300"
modified = "2024-11-21T05:47:58.407Z"
published = "2021-03-09T20:15:13.260Z"
imported = "2025-09-23T02:52:12.921Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-21300"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-21300"
```

# Git is an open-source distributed revision control system

Git is an open-source distributed revision control system. In affected versions of Git a specially crafted repository that contains symbolic links as well as files using a clean/smudge filter such as Git LFS, may cause just-checked out script to be executed while cloning onto a case-insensitive file system such as NTFS, HFS+ or APFS (i.e. the default file systems on Windows and macOS). Note that clean/smudge filters have to be configured for that. Git for Windows configures Git LFS by default, and is therefore vulnerable. The problem has been patched in the versions published on Tuesday, March 9th, 2021. As a workaound, if symbolic link support is disabled in Git (e.g. via `git config --global core.symlinks false`), the described attack won't work. Likewise, if no clean/smudge filters such as Git LFS are configured globally (i.e. *before* cloning), the attack is foiled. As always, it is best to avoid cloning repositories from untrusted sources. The earliest impacted version is 2.14.2. The fix versions are: 2.30.1, 2.29.3, 2.28.1, 2.27.1, 2.26.3, 2.25.5, 2.24.4, 2.23.4, 2.22.5, 2.21.4, 2.20.5, 2.19.6, 2.18.5, 2.17.62.17.6.

