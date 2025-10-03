```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrif66uw-16rfnd5"
modified = 2025-10-03T03:18:55.544Z
upstream = ["CVE-2024-6381"]
references = ["https://jira.mongodb.org/browse/CDRIVER-5622", "https://jira.mongodb.org/browse/CDRIVER-5622"]

[[affected]]
pkg = "MongoC_jll"
ranges = ["< 1.28.1+0"]

[[jlsec_sources]]
id = "CVE-2024-6381"
imported = 2025-10-03T03:18:55.524Z
modified = 2025-10-02T13:47:04.883Z
published = 2024-07-02T18:15:03.963Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-6381"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-6381"
```

# The bson_strfreev function in the MongoDB C driver library may be susceptible to an integer overflow...

The bson_strfreev function in the MongoDB C driver library may be susceptible to an integer overflow where the function will try to free memory at a negative offset. This may result in memory corruption. This issue affected libbson versions prior to 1.26.2

