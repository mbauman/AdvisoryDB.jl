```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-14"
modified = 2025-09-26T19:24:29.391Z
published = 2025-09-23T14:07:03.657Z
upstream = ["CVE-2022-39253"]
references = ["http://seclists.org/fulldisclosure/2022/Nov/1", "http://www.openwall.com/lists/oss-security/2023/02/14/5", "http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://github.com/git/git/security/advisories/GHSA-3wp6-j8xr-qw85", "https://lists.debian.org/debian-lts-announce/2022/12/msg00025.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/C7B6JPKX5CGGLAHXJVQMIZNNEEB72FHD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JMQWGMDLX6KTVWW5JZLVPI7ICAK72TN7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OHNO2FB55CPX47BAXMBWUBGWHO6N6ZZH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UKFHE4KVD7EKS5J3KTDFVBEKU3CLXGVV/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VFYXCTLOSESYIP72BUYD6ECDIMUM4WMB/", "https://security.gentoo.org/glsa/202312-15", "https://support.apple.com/kb/HT213496", "http://seclists.org/fulldisclosure/2022/Nov/1", "http://www.openwall.com/lists/oss-security/2023/02/14/5", "http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://github.com/git/git/security/advisories/GHSA-3wp6-j8xr-qw85", "https://lists.debian.org/debian-lts-announce/2022/12/msg00025.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/C7B6JPKX5CGGLAHXJVQMIZNNEEB72FHD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JMQWGMDLX6KTVWW5JZLVPI7ICAK72TN7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OHNO2FB55CPX47BAXMBWUBGWHO6N6ZZH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UKFHE4KVD7EKS5J3KTDFVBEKU3CLXGVV/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VFYXCTLOSESYIP72BUYD6ECDIMUM4WMB/", "https://security.gentoo.org/glsa/202312-15", "https://support.apple.com/kb/HT213496"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.42.0+0"]

[[jlsec_sources]]
id = "CVE-2022-39253"
imported = 2025-09-23T02:52:12.926Z
modified = 2024-11-21T07:17:53.040Z
published = 2022-10-19T11:15:11.227Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-39253"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-39253"
```

# Git is an open source, scalable, distributed revision control system

Git is an open source, scalable, distributed revision control system. Versions prior to 2.30.6, 2.31.5, 2.32.4, 2.33.5, 2.34.5, 2.35.5, 2.36.3, and 2.37.4 are subject to exposure of sensitive information to a malicious actor. When performing a local clone (where the source and target of the clone are on the same volume), Git copies the contents of the source's `$GIT_DIR/objects` directory into the destination by either creating hardlinks to the source contents, or copying them (if hardlinks are disabled via `--no-hardlinks`). A malicious actor could convince a victim to clone a repository with a symbolic link pointing at sensitive information on the victim's machine. This can be done either by having the victim clone a malicious repository on the same machine, or having them clone a malicious repository embedded as a bare repository via a submodule from any source, provided they clone with the `--recurse-submodules` option. Git does not create symbolic links in the `$GIT_DIR/objects` directory. The problem has been patched in the versions published on 2022-10-18, and backported to v2.30.x. Potential workarounds: Avoid cloning untrusted repositories using the `--local` optimization when on a shared machine, either by passing the `--no-local` option to `git clone` or cloning from a URL that uses the `file://` scheme. Alternatively, avoid cloning repositories from untrusted sources with `--recurse-submodules` or run `git config --global protocol.file.allow user`.

