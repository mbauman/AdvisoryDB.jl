```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-27"
modified = 2025-09-25T17:06:05.000Z
published = 2025-09-23T22:02:34.047Z
aliases = ["GHSA-w8jv-rg3h-fc68", "CVE-2025-52480"]

[[affected]]
pkg = "Registrator"
ranges = ["<= 1.9.4"]

[[jlsec_sources]]
id = "GHSA-w8jv-rg3h-fc68"
imported = 2025-09-23T21:55:52.259Z
modified = 2025-06-24T23:01:40.000Z
published = 2025-06-24T23:01:40.000Z
url = "https://api.github.com/repos/JuliaRegistries/Registrator.jl/security-advisories/GHSA-w8jv-rg3h-fc68"
html_url = "https://github.com/JuliaRegistries/Registrator.jl/security/advisories/GHSA-w8jv-rg3h-fc68"
```

# Argument injection in `gettreesha()` function in Registrator.jl

### Impact

If the clone URL returned by GitHub is malicious (or can be injected using upstream vulnerabilities), an argument injection is possible in the `gettreesha()` function. This can then lead to a potential RCE.

### Patches

Users should upgrade immediately to v1.9.5. All prior versions are vulnerable.

### Workarounds

None

### References

Fixed by: https://github.com/JuliaRegistries/Registrator.jl/pull/449 (which is available in v1.9.5).

### Credits

Thanks to *splitline* from the DEVCORE Research Team for reporting this issue.

