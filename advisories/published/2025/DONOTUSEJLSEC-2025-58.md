```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-58"
modified = 2025-10-06T13:10:23.999Z
published = 2025-09-23T22:07:20.403Z
upstream = ["CVE-2023-5363"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0df40630850fb2740e6be6890bb905d3fc623b2d", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5f69f5c65e483928c4b28ed16af6e5742929f1ee", "https://www.openssl.org/news/secadv/20231024.txt", "http://www.openwall.com/lists/oss-security/2023/10/24/1", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0df40630850fb2740e6be6890bb905d3fc623b2d", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5f69f5c65e483928c4b28ed16af6e5742929f1ee", "https://security.netapp.com/advisory/ntap-20231027-0010/", "https://security.netapp.com/advisory/ntap-20240201-0003/", "https://security.netapp.com/advisory/ntap-20240201-0004/", "https://www.debian.org/security/2023/dsa-5532", "https://www.openssl.org/news/secadv/20231024.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.0.8+0, < 3.0.12+0"]

[[jlsec_sources]]
id = "CVE-2023-5363"
imported = 2025-09-23T21:56:31.116Z
modified = 2024-11-21T08:41:36.810Z
published = 2023-10-25T18:17:43.613Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-5363"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-5363"
```

# Issue summary: A bug has been identified in the processing of key and initialisation vector (IV) len...

Issue summary: A bug has been identified in the processing of key and initialisation vector (IV) lengths.  This can lead to potential truncation or overruns during the initialisation of some symmetric ciphers.

Impact summary: A truncation in the IV can result in non-uniqueness, which could result in loss of confidentiality for some cipher modes.

When calling EVP*EncryptInit*ex2(), EVP*DecryptInit*ex2() or EVP*CipherInit*ex2() the provided OSSL*PARAM array is processed after the key and IV have been established.  Any alterations to the key length, via the "keylen" parameter or the IV length, via the "ivlen" parameter, within the OSSL*PARAM array will not take effect as intended, potentially causing truncation or overreading of these values.  The following ciphers and cipher modes are impacted: RC2, RC4, RC5, CCM, GCM and OCB.

For the CCM, GCM and OCB cipher modes, truncation of the IV can result in loss of confidentiality.  For example, when following NIST's SP 800-38D section 8.2.1 guidance for constructing a deterministic IV for AES in GCM mode, truncation of the counter portion could lead to IV reuse.

Both truncations and overruns of the key and overruns of the IV will produce incorrect results and could, in some cases, trigger a memory exception.  However, these issues are not currently assessed as security critical.

Changing the key and/or IV lengths is not considered to be a common operation and the vulnerable API was recently introduced. Furthermore it is likely that application developers will have spotted this problem during testing since decryption would fail unless both peers in the communication were similarly vulnerable. For these reasons we expect the probability of an application being vulnerable to this to be quite low. However if an application is vulnerable then this issue is considered very serious. For these reasons we have assessed this issue as Moderate severity overall.

The OpenSSL SSL/TLS implementation is not affected by this issue.

The OpenSSL 3.0 and 3.1 FIPS providers are not affected by this because the issue lies outside of the FIPS provider boundary.

OpenSSL 3.1 and 3.0 are vulnerable to this issue.

