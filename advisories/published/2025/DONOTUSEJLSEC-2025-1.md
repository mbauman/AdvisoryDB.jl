```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-1"
modified = 2025-09-29T02:51:33.558Z
published = 2025-09-23T02:23:16.095Z
aliases = ["CVE-2025-52479"]
references = ["https://github.com/JuliaWeb/HTTP.jl/security/advisories/GHSA-4g68-4pxg-mw93", "https://github.com/JuliaWeb/URIs.jl/pull/66"]

[[affected]]
pkg = "HTTP"
ranges = ["*"]
[[affected]]
pkg = "URIs"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-52479"
imported = 2025-09-29T13:20:44.522Z
modified = 2025-06-26T18:57:43.670Z
published = 2025-06-25T16:15:27.017Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-52479"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-52479"
```

# HTTP.jl provides HTTP client and server functionality for Julia, and URIs.jl parses and works with U...

HTTP.jl provides HTTP client and server functionality for Julia, and URIs.jl parses and works with Uniform Resource Identifiers (URIs). URIs.jl prior to version 1.6.0 and HTTP.jl prior to version 1.10.17 allows the construction of URIs containing CR/LF characters. If user input was not otherwise escaped or protected, this can lead to a CRLF injection attack. Users of HTTP.jl should upgrade immediately to HTTP.jl v1.10.17, and users of URIs.jl should upgrade immediately to URIs.jl v1.6.0. The check for valid URIs is now in the URI.jl package, and the latest version of HTTP.jl incorporates that fix. As a workaround, manually validate any URIs before passing them on to functions in this package.

