```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-2025-66"
modified = 2025-09-23T22:07:20.585Z
published = 2025-09-23T22:07:20.585Z
aliases = ["CVE-2024-4741"]
references = ["https://github.com/openssl/openssl/commit/704f725b96aa373ee45ecfb23f6abfe8be8d9177", "https://github.com/openssl/openssl/commit/b3f0eb0a295f58f16ba43ba99dad70d4ee5c437d", "https://github.com/openssl/openssl/commit/c88c3de51020c37e8706bf7a682a162593053aac", "https://github.com/openssl/openssl/commit/e5093133c35ca82874ad83697af76f4b0f7e3bd8", "https://github.openssl.org/openssl/extended-releases/commit/f7a045f3143fc6da2ee66bf52d8df04829590dd4", "https://www.openssl.org/news/secadv/20240528.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 3.0.14+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = [">= 1.19.9+0, < 1.27.1+0"]

[database_specific.affected_source]
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2024-44338"
id = "EUVD-2024-44338"
imported = 2025-09-23T21:56:31.488Z
modified = 2024-11-13T14:49:05.000Z
published = 2024-11-13T10:20:50.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2024-44338"

[database_specific.source]
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-4741"
id = "CVE-2024-4741"
imported = 2025-09-23T21:56:31.486Z
modified = 2024-11-13T17:01:16.850Z
published = 2024-11-13T11:15:04.480Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-4741"
```

# Issue summary: Calling the OpenSSL API function SSL*free*buffers may cause memory to be accessed tha...

Issue summary: Calling the OpenSSL API function SSL*free*buffers may cause memory to be accessed that was previously freed in some situations

Impact summary: A use after free can have a range of potential consequences such as the corruption of valid data, crashes or execution of arbitrary code. However, only applications that directly call the SSL*free*buffers function are affected by this issue. Applications that do not call this function are not vulnerable. Our investigations indicate that this function is rarely used by applications.

The SSL*free*buffers function is used to free the internal OpenSSL buffer used when processing an incoming record from the network. The call is only expected to succeed if the buffer is not currently in use. However, two scenarios have been identified where the buffer is freed even when still in use.

The first scenario occurs where a record header has been received from the network and processed by OpenSSL, but the full record body has not yet arrived. In this case calling SSL*free*buffers will succeed even though a record has only been partially processed and the buffer is still in use.

The second scenario occurs where a full record containing application data has been received and processed by OpenSSL but the application has only read part of this data. Again a call to SSL*free*buffers will succeed even though the buffer is still in use.

While these scenarios could occur accidentally during normal operation a malicious attacker could attempt to engineer a stituation where this occurs. We are not aware of this issue being actively exploited.

The FIPS modules in 3.3, 3.2, 3.1 and 3.0 are not affected by this issue.

