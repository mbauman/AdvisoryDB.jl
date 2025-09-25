```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-1"
modified = 2025-09-23T02:23:16.095Z
published = 2025-09-23T02:23:16.095Z
aliases = ["GHSA-4g68-4pxg-mw93", "CVE-2025-52479"]

[[affected]]
pkg = "HTTP"
ranges = ["<= 1.10.16"]
[[affected]]
pkg = "URIs"
ranges = ["< 1.6.0"]

[[jlsec_sources]]
html_url = "https://github.com/JuliaWeb/HTTP.jl/security/advisories/GHSA-4g68-4pxg-mw93"
id = "GHSA-4g68-4pxg-mw93"
imported = 2025-09-23T02:06:09.198Z
modified = 2025-06-24T23:01:25Z
published = 2025-06-24T23:01:25Z
url = "https://api.github.com/repos/JuliaWeb/HTTP.jl/security-advisories/GHSA-4g68-4pxg-mw93"
```

# CR/LF injection in URIs.jl (also affects HTTP.jl)

### Description

The URIs.jl and HTTP.jl packages allowed the construction of URIs containing CR/LF characters. If user input was not otherwise escaped or protected, this can lead to a CRLF injection attack.

With this simple Julia code, you can inject a custom header named `Foo` with the value `bar`:

```julia
import HTTP

HTTP.get("http://localhost:1337/ HTTP/1.1\r\nFoo: bar\r\nbaz:")
```

The server will receive the request like this:

```
➜ ncat -klp 1337
GET / HTTP/1.1
Foo: bar <-- injected header!
baz: HTTP/1.1
Host: locahost:1337
Accept: */*
User-Agent: HTTP.jl/1.11.5
Content-Length: 0
Accept-Encoding: gzip
```

### Impact

Inject headers or inject data to the request body and cause “HTTP response splitting”.

### Patches

Users of HTTP.jl should upgrade immediately to HTTP.jl v1.10.17. All prior versions are vulnerable.

Users of URIs.jl should upgrade immediately to URIs.jl v1.6.0. All prior versions are vulnerable.

The check for valid URIs is now in the URI.jl package, and the latest version of HTTP.jl incorporates that fix.

### Workarounds

Manually validate any URIs before passing them on to functions in this package.

### References

Fixed by: https://github.com/JuliaWeb/URIs.jl/pull/66 (which is available in URIs.jl v1.6.0).

### Credits

Thanks to *splitline* from the DEVCORE Research Team for reporting this issue.

