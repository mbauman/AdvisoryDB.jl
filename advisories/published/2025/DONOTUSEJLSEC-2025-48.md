```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-48"
modified = 2025-09-25T17:06:05.000Z
published = 2025-09-23T22:07:20.293Z
upstream = ["CVE-2022-4450"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=63bcf189be73a9cc1264059bed6f57974be74a83", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=bbcf509bd046b34cca19c766bbddc31683d0858b", "https://security.gentoo.org/glsa/202402-08", "https://www.openssl.org/news/secadv/20230207.txt", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=63bcf189be73a9cc1264059bed6f57974be74a83", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=bbcf509bd046b34cca19c766bbddc31683d0858b", "https://security.gentoo.org/glsa/202402-08", "https://www.openssl.org/news/secadv/20230207.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.20+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = [">= 1.19.9+0, < 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2022-4450"
imported = 2025-09-23T21:56:31.089Z
modified = 2025-05-05T16:15:22.940Z
published = 2023-02-08T20:15:23.973Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-4450"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-4450"
```

# The function PEM*read*bio_ex() reads a PEM file from a BIO and parses and decodes the "name" (e.g

The function PEM*read*bio*ex() reads a PEM file from a BIO and parses and decodes the "name" (e.g. "CERTIFICATE"), any header data and the payload data. If the function succeeds then the "name*out", "header" and "data" arguments are populated with pointers to buffers containing the relevant decoded data. The caller is responsible for freeing those buffers. It is possible to construct a PEM file that results in 0 bytes of payload data. In this case PEM*read*bio_ex() will return a failure code but will populate the header argument with a pointer to a buffer that has already been freed. If the caller also frees this buffer then a double free will occur. This will most likely lead to a crash. This could be exploited by an attacker who has the ability to supply malicious PEM files for parsing to achieve a denial of service attack.

The functions PEM*read*bio() and PEM*read() are simple wrappers around PEM*read*bio*ex() and therefore these functions are also directly affected.

These functions are also called indirectly by a number of other OpenSSL functions including PEM*X509*INFO*read*bio*ex() and SSL*CTX*use*serverinfo*file() which are also vulnerable. Some OpenSSL internal uses of these functions are not vulnerable because the caller does not free the header argument if PEM*read*bio*ex() returns a failure code. These locations include the PEM*read*bio_TYPE() functions as well as the decoders introduced in OpenSSL 3.0.

The OpenSSL asn1parse command line application is also impacted by this issue.

