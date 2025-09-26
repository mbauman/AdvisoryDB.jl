```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-69"
modified = 2025-09-25T17:06:05.000Z
published = 2025-09-24T15:09:41.228Z
upstream = ["CVE-2021-4048"]
references = ["https://github.com/JuliaLang/julia/issues/42415", "https://github.com/Reference-LAPACK/lapack/commit/38f3eeee3108b18158409ca2a100e6fe03754781", "https://github.com/Reference-LAPACK/lapack/pull/625", "https://github.com/xianyi/OpenBLAS/commit/2be5ee3cca97a597f2ee2118808a2d5eacea050c", "https://github.com/xianyi/OpenBLAS/commit/337b65133df174796794871b3988cd03426e6d41", "https://github.com/xianyi/OpenBLAS/commit/ddb0ff5353637bb5f5ad060c9620e334c143e3d7", "https://github.com/xianyi/OpenBLAS/commit/fe497efa0510466fd93578aaf9da1ad8ed4edbe7", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6QFEVOCUG2UXMVMFMTU4ONJVDEHY2LW2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DROZM4M2QRKSD6FBO4BHSV2QMIRJQPHT/", "https://github.com/JuliaLang/julia/issues/42415", "https://github.com/Reference-LAPACK/lapack/commit/38f3eeee3108b18158409ca2a100e6fe03754781", "https://github.com/Reference-LAPACK/lapack/pull/625", "https://github.com/xianyi/OpenBLAS/commit/2be5ee3cca97a597f2ee2118808a2d5eacea050c", "https://github.com/xianyi/OpenBLAS/commit/337b65133df174796794871b3988cd03426e6d41", "https://github.com/xianyi/OpenBLAS/commit/ddb0ff5353637bb5f5ad060c9620e334c143e3d7", "https://github.com/xianyi/OpenBLAS/commit/fe497efa0510466fd93578aaf9da1ad8ed4edbe7", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6QFEVOCUG2UXMVMFMTU4ONJVDEHY2LW2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DROZM4M2QRKSD6FBO4BHSV2QMIRJQPHT/"]

[[affected]]
pkg = "OpenBLAS_jll"
ranges = ["< 0.3.20+0"]
[[affected]]
pkg = "OpenBLAS32_jll"
ranges = ["< 0.3.20+0"]
[[affected]]
pkg = "OpenBLASHighCoreCount_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-4048"
imported = 2025-09-24T14:36:01.885Z
modified = 2024-11-21T06:36:47.820Z
published = 2021-12-08T22:15:10.220Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-4048"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-4048"
```

# An out-of-bounds read flaw was found in the CLARRV, DLARRV, SLARRV, and ZLARRV functions in lapack t...

An out-of-bounds read flaw was found in the CLARRV, DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0, as also used in OpenBLAS before version 0.3.18. Specially crafted inputs passed to these functions could cause an application using lapack to crash or possibly disclose portions of its memory.

