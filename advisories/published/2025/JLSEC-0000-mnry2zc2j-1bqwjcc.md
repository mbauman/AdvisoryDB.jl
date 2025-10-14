```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnry2zc2j-1bqwjcc"
modified = 2025-10-14T02:21:59.131Z
aliases = ["GHSA-3mj7-qxh9-6q4p", "CVE-2025-52561"]

[[affected]]
pkg = "HTMLSanitizer"
ranges = ["<= 0.2.0"]

[[jlsec_sources]]
id = "GHSA-3mj7-qxh9-6q4p"
imported = 2025-10-14T02:21:59.106Z
modified = 2025-06-23T13:45:18.000Z
published = 2025-06-23T13:44:51.000Z
url = "https://api.github.com/repos/JuliaComputing/HTMLSanitizer.jl/security-advisories/GHSA-3mj7-qxh9-6q4p"
html_url = "https://github.com/JuliaComputing/HTMLSanitizer.jl/security/advisories/GHSA-3mj7-qxh9-6q4p"
```

# Possible XSS in HTMLSanitizer when using svg elements

### Description

When adding the style tag to the whitelist, content inside the tag is incorrectly unescaped, and closing tags injected as content are interpreted as real HTML, enabling tag injection and JavaScript execution.

This behavior is similar to the sanitization bypass described in CVE-2020-4054 (Sanitize for Ruby).

```
using HTMLSanitizer

user_input = "<svg><style>&lt;/style>&lt;img src onerror=alert(1)>"

whitelist = deepcopy(HTMLSanitizer.WHITELIST)
append!(whitelist[:elements], ["style"])
result = sanitize(user_input, whitelist=whitelist)
print(result) # <style></style><img src onerror=alert(1)></style>
```

### Impact

Possible XSS in any HTML that is sanitized with this library.

### Patches

Users should upgrade to `v0.2.1` as soon as possible. In this version, `svg` and `math` tags are removed by default.

### Workarounds

Add the `math` and `svg` elements to your whitelist manually via e.g.

```
whitelist = deepcopy(HTMLSanitizer.WHITELIST)
append!(whitelist[:removed_elements], ["math", "svg"])
```

and pass this modified whitelist to `sanitize`:

```
sanitize(user_input, whitelist=whitelist)
```

### References

[PR for fix](https://github.com/JuliaComputing/HTMLSanitizer.jl/pull/5)

### Credits

Thanks to  Chen T for finding and reporting this issue.

