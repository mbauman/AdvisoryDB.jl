```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-49"
modified = 2025-09-23T22:07:20.295Z
published = 2025-09-23T22:07:20.295Z
upstream = ["CVE-2023-0215"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=8818064ce3c3c0f1b740a5aaba2a987e75bfbafd", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=9816136fe31d92ace4037d5da5257f763aeeb4eb", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=c3829dd8825c654652201e16f8a0a0c46ee3f344", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230427-0007/", "https://security.netapp.com/advisory/ntap-20230427-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.openssl.org/news/secadv/20230207.txt", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=8818064ce3c3c0f1b740a5aaba2a987e75bfbafd", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=9816136fe31d92ace4037d5da5257f763aeeb4eb", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=c3829dd8825c654652201e16f8a0a0c46ee3f344", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230427-0007/", "https://security.netapp.com/advisory/ntap-20230427-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.openssl.org/news/secadv/20230207.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.20+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-0215"
id = "CVE-2023-0215"
imported = 2025-09-23T21:56:31.090Z
modified = 2025-05-05T16:15:24.900Z
published = 2023-02-08T20:15:24.107Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-0215"
```

# The public API function BIO*new*NDEF is a helper function used for streaming ASN.1 data via a BIO

The public API function BIO*new*NDEF is a helper function used for streaming ASN.1 data via a BIO. It is primarily used internally to OpenSSL to support the SMIME, CMS and PKCS7 streaming capabilities, but may also be called directly by end user applications.

The function receives a BIO from the caller, prepends a new BIO*f*asn1 filter BIO onto the front of it to form a BIO chain, and then returns the new head of the BIO chain to the caller. Under certain conditions, for example if a CMS recipient public key is invalid, the new filter BIO is freed and the function returns a NULL result indicating a failure. However, in this case, the BIO chain is not properly cleaned up and the BIO passed by the caller still retains internal pointers to the previously freed filter BIO. If the caller then goes on to call BIO_pop() on the BIO then a use-after-free will occur. This will most likely result in a crash.

This scenario occurs directly in the internal function B64*write*ASN1() which may cause BIO*new*NDEF() to be called and will subsequently call BIO*pop() on the BIO. This internal function is in turn called by the public API functions PEM*write*bio*ASN1*stream, PEM*write*bio*CMS*stream, PEM*write*bio*PKCS7*stream, SMIME*write*ASN1, SMIME*write*CMS and SMIME*write_PKCS7.

Other public API functions that may be impacted by this include i2d*ASN1*bio*stream, BIO*new*CMS, BIO*new*PKCS7, i2d*CMS*bio*stream and i2d*PKCS7*bio_stream.

The OpenSSL cms and smime command line applications are similarly affected.

