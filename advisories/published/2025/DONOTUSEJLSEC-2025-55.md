```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-55"
modified = 2025-09-29T02:51:33.558Z
published = 2025-09-23T22:07:20.395Z
upstream = ["CVE-2023-2650"]
references = ["http://www.openwall.com/lists/oss-security/2023/05/30/1", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=423a2bc737a908ad0c77bda470b2b59dc879936b", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=853c5e56ee0b8650c73140816bb8b91d6163422c", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=9e209944b35cf82368071f160a744b6178f9b098", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=db779b0e10b047f2585615e0b8f2acdf21f8544a", "https://lists.debian.org/debian-lts-announce/2023/06/msg00011.html", "https://psirt.global.sonicwall.com/vuln-detail/SNWLID-2023-0009", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230703-0001/", "https://security.netapp.com/advisory/ntap-20231027-0009/", "https://www.debian.org/security/2023/dsa-5417", "https://www.openssl.org/news/secadv/20230530.txt", "http://www.openwall.com/lists/oss-security/2023/05/30/1", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=423a2bc737a908ad0c77bda470b2b59dc879936b", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=853c5e56ee0b8650c73140816bb8b91d6163422c", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=9e209944b35cf82368071f160a744b6178f9b098", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=db779b0e10b047f2585615e0b8f2acdf21f8544a", "https://lists.debian.org/debian-lts-announce/2023/06/msg00011.html", "https://psirt.global.sonicwall.com/vuln-detail/SNWLID-2023-0009", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230703-0001/", "https://security.netapp.com/advisory/ntap-20231027-0009/", "https://www.debian.org/security/2023/dsa-5417", "https://www.openssl.org/news/secadv/20230530.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.21+0", ">= 3.0.8+0, < 3.0.9+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2023-2650"
imported = 2025-09-23T21:56:31.098Z
modified = 2025-03-19T16:15:21.890Z
published = 2023-05-30T14:15:09.683Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-2650"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-2650"
```

# Issue summary: Processing some specially crafted ASN.1 object identifiers or data containing them ma...

Issue summary: Processing some specially crafted ASN.1 object identifiers or data containing them may be very slow.

Impact summary: Applications that use OBJ_obj2txt() directly, or use any of the OpenSSL subsystems OCSP, PKCS7/SMIME, CMS, CMP/CRMF or TS with no message size limit may experience notable to very long delays when processing those messages, which may lead to a Denial of Service.

An OBJECT IDENTIFIER is composed of a series of numbers - sub-identifiers - most of which have no size limit.  OBJ*obj2txt() may be used to translate an ASN.1 OBJECT IDENTIFIER given in DER encoding form (using the OpenSSL type ASN1*OBJECT) to its canonical numeric text form, which are the sub-identifiers of the OBJECT IDENTIFIER in decimal form, separated by periods.

When one of the sub-identifiers in the OBJECT IDENTIFIER is very large (these are sizes that are seen as absurdly large, taking up tens or hundreds of KiBs), the translation to a decimal number in text may take a very long time.  The time complexity is O(n^2) with 'n' being the size of the sub-identifiers in bytes (*).

With OpenSSL 3.0, support to fetch cryptographic algorithms using names / identifiers in string form was introduced.  This includes using OBJECT IDENTIFIERs in canonical numeric text form as identifiers for fetching algorithms.

Such OBJECT IDENTIFIERs may be received through the ASN.1 structure AlgorithmIdentifier, which is commonly used in multiple protocols to specify what cryptographic algorithm should be used to sign or verify, encrypt or decrypt, or digest passed data.

Applications that call OBJ_obj2txt() directly with untrusted data are affected, with any version of OpenSSL.  If the use is for the mere purpose of display, the severity is considered low.

In OpenSSL 3.0 and newer, this affects the subsystems OCSP, PKCS7/SMIME, CMS, CMP/CRMF or TS.  It also impacts anything that processes X.509 certificates, including simple things like verifying its signature.

The impact on TLS is relatively low, because all versions of OpenSSL have a 100KiB limit on the peer's certificate chain.  Additionally, this only impacts clients, or servers that have explicitly enabled client authentication.

In OpenSSL 1.1.1 and 1.0.2, this only affects displaying diverse objects, such as X.509 certificates.  This is assumed to not happen in such a way that it would cause a Denial of Service, so these versions are considered not affected by this issue in such a way that it would be cause for concern, and the severity is therefore considered low.

