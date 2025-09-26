```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-18"
modified = 2025-09-26T19:46:16.213Z
published = 2025-09-23T14:07:03.667Z
upstream = ["CVE-2022-41903"]
references = ["https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_export_subst", "https://git-scm.com/docs/pretty-formats#Documentation/pretty-formats.txt-emltltNgttruncltruncmtruncem", "https://github.com/git/git/commit/508386c6c5857b4faa2c3e491f422c98cc69ae76", "https://github.com/git/git/security/advisories/GHSA-475x-2q3q-hvwq", "https://security.gentoo.org/glsa/202312-15", "https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_export_subst", "https://git-scm.com/docs/pretty-formats#Documentation/pretty-formats.txt-emltltNgttruncltruncmtruncem", "https://github.com/git/git/commit/508386c6c5857b4faa2c3e491f422c98cc69ae76", "https://github.com/git/git/security/advisories/GHSA-475x-2q3q-hvwq", "https://security.gentoo.org/glsa/202312-15"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.42.0+0"]

[[jlsec_sources]]
id = "CVE-2022-41903"
imported = 2025-09-23T02:52:12.933Z
modified = 2024-11-21T07:24:01.993Z
published = 2023-01-17T23:15:15.690Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-41903"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-41903"
```

# Git is distributed revision control system

Git is distributed revision control system. `git log` can display commits in an arbitrary format using its `--format` specifiers. This functionality is also exposed to `git archive` via the `export-subst` gitattribute. When processing the padding operators, there is a integer overflow in `pretty.c::format_and_pad_commit()` where a `size_t` is stored improperly as an `int`, and then added as an offset to a `memcpy()`. This overflow can be triggered directly by a user running a command which invokes the commit formatting machinery (e.g., `git log --format=...`). It may also be triggered indirectly through git archive via the export-subst mechanism, which expands format specifiers inside of files within the repository during a git archive. This integer overflow can result in arbitrary heap writes, which may result in arbitrary code execution. The problem has been patched in the versions published on 2023-01-17, going back to v2.30.7. Users are advised to upgrade. Users who are unable to upgrade should disable `git archive` in untrusted repositories. If you expose git archive via `git daemon`, disable it by running `git config --global daemon.uploadArch false`.

