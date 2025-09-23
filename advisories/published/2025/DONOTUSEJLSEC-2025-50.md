```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-50"
modified = 2025-09-23T22:07:20.298Z
published = 2025-09-23T22:07:20.298Z
upstream = ["CVE-2023-0286"]
references = ["https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.6.2-relnotes.txt", "https://ftp.openbsd.org/pub/OpenBSD/patches/7.2/common/018_x509.patch.sig", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=2c6c9d439b484e1ba9830d8454a34fa4f80fdfe9", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=2f7530077e0ef79d98718138716bc51ca0cad658", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=fd2af07dc083a350c959147097003a14a5e8ac4d", "https://security.gentoo.org/glsa/202402-08", "https://www.openssl.org/news/secadv/20230207.txt", "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.6.2-relnotes.txt", "https://ftp.openbsd.org/pub/OpenBSD/patches/7.2/common/018_x509.patch.sig", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=2c6c9d439b484e1ba9830d8454a34fa4f80fdfe9", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=2f7530077e0ef79d98718138716bc51ca0cad658", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=fd2af07dc083a350c959147097003a14a5e8ac4d", "https://security.gentoo.org/glsa/202402-08", "https://www.openssl.org/news/secadv/20230207.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.20+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[database_specific.source]
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-0286"
id = "CVE-2023-0286"
imported = 2025-09-23T21:56:31.092Z
modified = 2025-03-20T21:15:16.550Z
published = 2023-02-08T20:15:24.267Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-0286"
```

# There is a type confusion vulnerability relating to X.400 address processing inside an X.509 General...

There is a type confusion vulnerability relating to X.400 address processing inside an X.509 GeneralName. X.400 addresses were parsed as an ASN1*STRING but the public structure definition for GENERAL*NAME incorrectly specified the type of the x400Address field as ASN1*TYPE. This field is subsequently interpreted by the OpenSSL function GENERAL*NAME*cmp as an ASN1*TYPE rather than an ASN1_STRING.

When CRL checking is enabled (i.e. the application sets the X509*V*FLAG*CRL*CHECK flag), this vulnerability may allow an attacker to pass arbitrary pointers to a memcmp call, enabling them to read memory contents or enact a denial of service. In most cases, the attack requires the attacker to provide both the certificate chain and CRL, neither of which need to have a valid signature. If the attacker only controls one of these inputs, the other input must already contain an X.400 address as a CRL distribution point, which is uncommon. As such, this vulnerability is most likely to only affect applications which have implemented their own functionality for retrieving CRLs over a network.

