```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnro3zbxq-1uffgci"
modified = 2025-10-07T02:52:16.814Z
aliases = ["GHSA-g2xx-229f-3qjm", "CVE-2025-50178"]

[[affected]]
pkg = "GitForge"
ranges = ["< 0.4.3"]

[[jlsec_sources]]
id = "GHSA-g2xx-229f-3qjm"
imported = 2025-10-07T02:52:16.795Z
modified = 2025-06-24T23:01:20.000Z
published = 2025-06-24T23:01:20.000Z
url = "https://api.github.com/repos/JuliaWeb/GitForge.jl/security-advisories/GHSA-g2xx-229f-3qjm"
html_url = "https://github.com/JuliaWeb/GitForge.jl/security/advisories/GHSA-g2xx-229f-3qjm"
```

# Lack of validation for user-provided fields in GitForge.jl

### Description

There is a lack of input validation for user-provided values in certain functions.

In the `GitForge.get_repo()` function for GitHub, the user can provide any string for the `owner` and `repo fields`. These inputs are not validated or safely encoded and are sent directly to the server.

### Impact

This means a user can add path traversal patterns like `../` in the input to access any other endpoints on `api.github.com` that were not intended.

### Patches

Users should upgrade immediately to v0.4.3. All prior versions are vulnerable.

### Workarounds

None

### References

Fixed by: https://github.com/JuliaWeb/GitForge.jl/pull/50 (which is available in v0.4.3).

### Credits

Thanks to *splitline* from the DEVCORE Research Team for reporting this issue.

