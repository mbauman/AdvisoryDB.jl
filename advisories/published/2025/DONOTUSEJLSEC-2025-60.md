```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-60"
modified = 2025-09-26T13:32:05.000Z
published = 2025-09-23T22:07:20.410Z
upstream = ["CVE-2023-5678"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=34efaef6c103d636ab507a0cc34dca4d3aecc055", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=710fee740904b6290fef0dd5536fbcedbc38ff0c", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=db925ae2e65d0d925adef429afc37f75bd1c2017", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=ddeb4b6c6d527e54ce9a99cba785c0f7776e54b6", "https://www.openssl.org/news/secadv/20231106.txt", "http://www.openwall.com/lists/oss-security/2024/03/11/1", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=34efaef6c103d636ab507a0cc34dca4d3aecc055", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=710fee740904b6290fef0dd5536fbcedbc38ff0c", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=db925ae2e65d0d925adef429afc37f75bd1c2017", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=ddeb4b6c6d527e54ce9a99cba785c0f7776e54b6", "https://security.netapp.com/advisory/ntap-20231130-0010/", "https://www.openssl.org/news/secadv/20231106.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 3.0.13+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2023-5678"
imported = 2025-09-23T21:56:31.118Z
modified = 2024-11-21T08:42:15.573Z
published = 2023-11-06T16:15:42.670Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-5678"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-5678"
```

# Issue summary: Generating excessively long X9.42 DH keys or checking excessively long X9.42 DH keys ...

Issue summary: Generating excessively long X9.42 DH keys or checking excessively long X9.42 DH keys or parameters may be very slow.

Impact summary: Applications that use the functions DH*generate*key() to generate an X9.42 DH key may experience long delays.  Likewise, applications that use DH*check*pub*key(), DH*check*pub*key*ex() or EVP*PKEY*public*check() to check an X9.42 DH key or X9.42 DH parameters may experience long delays. Where the key or parameters that are being checked have been obtained from an untrusted source this may lead to a Denial of Service.

While DH*check() performs all the necessary checks (as of CVE-2023-3817), DH*check*pub*key() doesn't make any of these checks, and is therefore vulnerable for excessively large P and Q parameters.

Likewise, while DH*generate*key() performs a check for an excessively large P, it doesn't check for an excessively large Q.

An application that calls DH*generate*key() or DH*check*pub_key() and supplies a key or parameters obtained from an untrusted source could be vulnerable to a Denial of Service attack.

DH*generate*key() and DH*check*pub*key() are also called by a number of other OpenSSL functions.  An application calling any of those other functions may similarly be affected.  The other functions affected by this are DH*check*pub*key*ex(), EVP*PKEY*public*check(), and EVP*PKEY*generate().

Also vulnerable are the OpenSSL pkey command line application when using the "-pubcheck" option, as well as the OpenSSL genpkey command line application.

The OpenSSL SSL/TLS implementation is not affected by this issue.

The OpenSSL 3.0 and 3.1 FIPS providers are not affected by this issue.

