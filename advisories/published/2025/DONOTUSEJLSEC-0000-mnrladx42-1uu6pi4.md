```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrladx42-1uu6pi4"
modified = 2025-10-05T03:28:16.610Z
upstream = ["CVE-2025-29768"]
references = ["https://github.com/vim/vim/commit/f209dcd3defb95bae21b2740910e6aa7bb940531", "https://github.com/vim/vim/security/advisories/GHSA-693p-m996-3rmf", "https://security.netapp.com/advisory/ntap-20250502-0001/"]

[[affected]]
pkg = "Vim_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-29768"
imported = 2025-10-05T03:28:16.610Z
modified = 2025-08-18T14:14:27.967Z
published = 2025-03-13T17:15:37.623Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-29768"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-29768"
```

# Vim, a text editor, is vulnerable to potential data loss with zip.vim and special crafted zip files ...

Vim, a text editor, is vulnerable to potential data loss with zip.vim and special crafted zip files in versions prior to 9.1.1198. The impact is medium because a user must be made to view such an archive with Vim and then press 'x' on such a strange filename. The issue has been fixed as of Vim patch v9.1.1198.

