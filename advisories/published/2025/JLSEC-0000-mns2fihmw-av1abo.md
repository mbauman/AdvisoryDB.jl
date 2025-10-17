```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns2fihmw-av1abo"
modified = 2025-10-17T03:23:52.904Z
upstream = ["CVE-2025-5914"]
references = ["https://access.redhat.com/errata/RHSA-2025:14130", "https://access.redhat.com/errata/RHSA-2025:14135", "https://access.redhat.com/errata/RHSA-2025:14137", "https://access.redhat.com/errata/RHSA-2025:14141", "https://access.redhat.com/errata/RHSA-2025:14142", "https://access.redhat.com/errata/RHSA-2025:14525", "https://access.redhat.com/errata/RHSA-2025:14528", "https://access.redhat.com/errata/RHSA-2025:14594", "https://access.redhat.com/errata/RHSA-2025:14644", "https://access.redhat.com/errata/RHSA-2025:14808", "https://access.redhat.com/errata/RHSA-2025:14810", "https://access.redhat.com/errata/RHSA-2025:14828", "https://access.redhat.com/errata/RHSA-2025:15024", "https://access.redhat.com/errata/RHSA-2025:15709", "https://access.redhat.com/errata/RHSA-2025:15827", "https://access.redhat.com/errata/RHSA-2025:15828", "https://access.redhat.com/errata/RHSA-2025:16524", "https://access.redhat.com/errata/RHSA-2025:18219", "https://access.redhat.com/security/cve/CVE-2025-5914", "https://bugzilla.redhat.com/show_bug.cgi?id=2370861", "https://github.com/libarchive/libarchive/pull/2598", "https://github.com/libarchive/libarchive/releases/tag/v3.8.0", "https://github.com/libarchive/libarchive/pull/2598"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.8.0+0"]

[[jlsec_sources]]
id = "CVE-2025-5914"
imported = 2025-10-17T03:23:52.904Z
modified = 2025-10-16T09:15:35.380Z
published = 2025-06-09T20:15:26.123Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-5914"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-5914"
```

# A vulnerability has been identified in the libarchive library, specifically within the archive_read_...

A vulnerability has been identified in the libarchive library, specifically within the archive_read_format_rar_seek_data() function. This flaw involves an integer overflow that can ultimately lead to a double-free condition. Exploiting a double-free vulnerability can result in memory corruption, enabling an attacker to execute arbitrary code or cause a denial-of-service condition.

