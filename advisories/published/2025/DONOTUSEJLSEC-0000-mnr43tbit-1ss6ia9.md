```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnr43tbit-1ss6ia9"
modified = 2025-09-23T02:52:12.821Z
upstream = ["CVE-2024-32002"]
references = ["http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---recurse-submodulesltpathspecgt", "https://git-scm.com/docs/git-config#Documentation/git-config.txt-coresymlinks", "https://github.com/git/git/commit/97065761333fd62db1912d81b489db938d8c991d", "https://github.com/git/git/security/advisories/GHSA-8h77-4q3w-gfgv", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/", "http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---recurse-submodulesltpathspecgt", "https://git-scm.com/docs/git-config#Documentation/git-config.txt-coresymlinks", "https://github.com/git/git/commit/97065761333fd62db1912d81b489db938d8c991d", "https://github.com/git/git/security/advisories/GHSA-8h77-4q3w-gfgv", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.46.2+0"]

[database_specific.source]
id = "CVE-2024-32002"
modified = "2024-11-21T09:14:19.267Z"
published = "2024-05-14T19:15:10.810Z"
imported = "2025-09-23T02:52:12.821Z"
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-32002"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-32002"
```

# Git submodules could write malicious code to the repository's hooks

Git is a revision control system. Prior to versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4, repositories with submodules can be crafted in a way that exploits a bug in Git whereby it can be fooled into writing files not into the submodule's worktree but into a `.git/` directory. This allows writing a hook that will be executed while the clone operation is still running, giving the user no opportunity to inspect the code that is being executed. The problem has been patched in versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4. If symbolic link support is disabled in Git (e.g. via `git config --global core.symlinks false`), the described attack won't work. As always, it is best to avoid cloning repositories from untrusted sources.

