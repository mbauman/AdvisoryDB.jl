```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns3uopgh-1dao4gl"
modified = 2025-10-18T03:16:23.393Z
upstream = ["CVE-2025-59375"]
references = ["https://github.com/libexpat/libexpat/blob/676a4c531ec768732fac215da9730b5f50fbd2bf/expat/Changes#L45-L74", "https://github.com/libexpat/libexpat/blob/R_2_7_2/expat/Changes", "https://github.com/libexpat/libexpat/issues/1018", "https://github.com/libexpat/libexpat/pull/1034", "https://issues.oss-fuzz.com/issues/439133977"]

[[affected]]
pkg = "Expat_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-59375"
imported = 2025-10-18T03:16:23.393Z
modified = 2025-10-17T19:26:36.673Z
published = 2025-09-15T03:15:40.920Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-59375"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-59375"
```

# libexpat in Expat before 2.7.2 allows attackers to trigger large dynamic memory allocations via a sm...

libexpat in Expat before 2.7.2 allows attackers to trigger large dynamic memory allocations via a small document that is submitted for parsing.

