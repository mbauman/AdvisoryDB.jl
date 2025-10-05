```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrladx4u-1jukmoj"
modified = 2025-10-05T03:28:16.638Z
upstream = ["CVE-2025-25724"]
references = ["https://gist.github.com/Ekkosun/a83870ce7f3b7813b9b462a395e8ad92", "https://github.com/Ekkosun/pocs/blob/main/bsdtarbug", "https://github.com/libarchive/libarchive/blob/b439d586f53911c84be5e380445a8a259e19114c/tar/util.c#L751-L752"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.7.9+0"]

[[jlsec_sources]]
id = "CVE-2025-25724"
imported = 2025-10-05T03:28:16.638Z
modified = 2025-07-17T15:56:36.083Z
published = 2025-03-02T02:15:36.603Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-25724"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-25724"
```

# list_item_verbose in tar/util.c in libarchive through 3.7.7 does not check an strftime return value,...

list_item_verbose in tar/util.c in libarchive through 3.7.7 does not check an strftime return value, which can lead to a denial of service or unspecified other impact via a crafted TAR archive that is read with a verbose value of 2. For example, the 100-byte buffer may not be sufficient for a custom locale.

