```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-11"
modified = 2025-09-29T02:51:33.558Z
published = 2025-09-23T14:07:03.648Z
upstream = ["CVE-2022-24975"]
references = ["https://github.com/git/git/blob/2dc94da3744bfbbf145eca587a0f5ff480cc5867/Documentation/git-clone.txt#L185-L191", "https://lore.kernel.org/git/xmqq4k14qe9g.fsf%40gitster.g/", "https://www.aquasec.com/blog/undetected-hard-code-secrets-expose-corporations/", "https://wwws.nightwatchcybersecurity.com/2022/02/11/gitbleed/", "https://github.com/git/git/blob/2dc94da3744bfbbf145eca587a0f5ff480cc5867/Documentation/git-clone.txt#L185-L191", "https://www.aquasec.com/blog/undetected-hard-code-secrets-expose-corporations/", "https://wwws.nightwatchcybersecurity.com/2022/02/11/gitbleed/"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.36.1+0"]

[[jlsec_sources]]
id = "CVE-2022-24975"
imported = 2025-09-23T02:52:12.922Z
modified = 2024-11-21T06:51:29.247Z
published = 2022-02-11T20:15:07.507Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-24975"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-24975"
```

# The –mirror documentation for Git through 2.35.1 does not mention the availability of deleted conte...

The –mirror documentation for Git through 2.35.1 does not mention the availability of deleted content, aka the "GitBleed" issue. This could present a security risk if information-disclosure auditing processes rely on a clone operation without the –mirror option. Note: This has been disputed by multiple 3rd parties who believe this is an intended feature of the git binary and does not pose a security risk.

