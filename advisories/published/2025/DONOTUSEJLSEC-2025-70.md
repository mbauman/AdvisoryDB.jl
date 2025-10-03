```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-70"
modified = 2025-10-03T10:34:06.778Z
published = 2025-09-26T20:17:45.145Z
aliases = ["GHSA-589r-g8hf-xx59", "CVE-2025-52483"]

[[affected]]
pkg = "Registrator"
ranges = ["<= 1.9.4"]

[[jlsec_sources]]
id = "GHSA-589r-g8hf-xx59"
imported = 2025-09-26T20:12:36.942Z
modified = 2025-06-24T23:01:34.000Z
published = 2025-06-24T23:01:34.000Z
url = "https://api.github.com/repos/JuliaRegistries/Registrator.jl/security-advisories/GHSA-589r-g8hf-xx59"
html_url = "https://github.com/JuliaRegistries/Registrator.jl/security/advisories/GHSA-589r-g8hf-xx59"
```

# Command injection in `withpasswd()` function in Registrator.jl

### Impact

If the clone URL returned by GitHub is malicious (or can be injected using upstream vulnerabilities), a shell script injection can occur within the `withpasswd()` function.  This can then lead to a potential RCE.

### Patches

Users should upgrade immediately to v1.9.5. All prior versions are vulnerable.

### Workarounds

None

### References

Fixed by: https://github.com/JuliaRegistries/Registrator.jl/pull/448 (which is available in v1.9.5).

### Credits

Thanks to *splitline* from the DEVCORE Research Team for reporting this issue.

