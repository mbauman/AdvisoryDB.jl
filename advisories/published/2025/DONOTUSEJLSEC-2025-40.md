```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-40"
modified = 2025-09-26T13:32:05.000Z
published = 2025-09-23T22:07:20.273Z
upstream = ["CVE-2021-3711"]
references = ["http://www.openwall.com/lists/oss-security/2021/08/26/2", "https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=59f5e75f3bced8fc0e130d72a3f582cf7b480b46", "https://lists.apache.org/thread.html/r18995de860f0e63635f3008fd2a6aca82394249476d21691e7c59c9e%40%3Cdev.tomcat.apache.org%3E", "https://lists.apache.org/thread.html/rad5d9f83f0d11fb3f8bb148d179b8a9ad7c6a17f18d70e5805a713d1%40%3Cdev.tomcat.apache.org%3E", "https://security.gentoo.org/glsa/202209-02", "https://security.gentoo.org/glsa/202210-02", "https://security.netapp.com/advisory/ntap-20210827-0010/", "https://security.netapp.com/advisory/ntap-20211022-0003/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.debian.org/security/2021/dsa-4963", "https://www.openssl.org/news/secadv/20210824.txt", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://www.tenable.com/security/tns-2021-16", "https://www.tenable.com/security/tns-2022-02", "http://www.openwall.com/lists/oss-security/2021/08/26/2", "https://cert-portal.siemens.com/productcert/pdf/ssa-389290.pdf", "https://git.openssl.org/gitweb/?p=openssl.git%3Ba=commitdiff%3Bh=59f5e75f3bced8fc0e130d72a3f582cf7b480b46", "https://lists.apache.org/thread.html/r18995de860f0e63635f3008fd2a6aca82394249476d21691e7c59c9e%40%3Cdev.tomcat.apache.org%3E", "https://lists.apache.org/thread.html/rad5d9f83f0d11fb3f8bb148d179b8a9ad7c6a17f18d70e5805a713d1%40%3Cdev.tomcat.apache.org%3E", "https://security.gentoo.org/glsa/202209-02", "https://security.gentoo.org/glsa/202210-02", "https://security.netapp.com/advisory/ntap-20210827-0010/", "https://security.netapp.com/advisory/ntap-20211022-0003/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.debian.org/security/2021/dsa-4963", "https://www.openssl.org/news/secadv/20210824.txt", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://www.tenable.com/security/tns-2021-16", "https://www.tenable.com/security/tns-2022-02"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.13+0"]

[[jlsec_sources]]
id = "CVE-2021-3711"
imported = 2025-09-23T21:56:31.024Z
modified = 2024-11-21T06:22:12.960Z
published = 2021-08-24T15:15:09.133Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3711"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3711"
```

# In order to decrypt SM2 encrypted data an application is expected to call the API function EVP*PKEY*...

In order to decrypt SM2 encrypted data an application is expected to call the API function EVP*PKEY*decrypt(). Typically an application will call this function twice. The first time, on entry, the "out" parameter can be NULL and, on exit, the "outlen" parameter is populated with the buffer size required to hold the decrypted plaintext. The application can then allocate a sufficiently sized buffer and call EVP*PKEY*decrypt() again, but this time passing a non-NULL value for the "out" parameter. A bug in the implementation of the SM2 decryption code means that the calculation of the buffer size required to hold the plaintext returned by the first call to EVP*PKEY*decrypt() can be smaller than the actual size required by the second call. This can lead to a buffer overflow when EVP*PKEY*decrypt() is called by the application a second time with a buffer that is too small. A malicious attacker who is able present SM2 content for decryption to an application could cause attacker chosen data to overflow the buffer by up to a maximum of 62 bytes altering the contents of other data held after the buffer, possibly changing application behaviour or causing the application to crash. The location of the buffer is application dependent but is typically heap allocated. Fixed in OpenSSL 1.1.1l (Affected 1.1.1-1.1.1k).

