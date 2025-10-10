```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt161ko-1qpo5ka"
modified = 2025-10-10T13:32:22.008Z
upstream = ["CVE-2023-34969"]
references = ["https://gitlab.freedesktop.org/dbus/dbus/-/issues/457", "https://lists.debian.org/debian-lts-announce/2023/10/msg00033.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BZYCDRMD7B4XO4HF6C6YTLH4YUD7TANP/", "https://security.netapp.com/advisory/ntap-20231208-0007/", "https://gitlab.freedesktop.org/dbus/dbus/-/issues/457", "https://lists.debian.org/debian-lts-announce/2023/10/msg00033.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BZYCDRMD7B4XO4HF6C6YTLH4YUD7TANP/", "https://security.netapp.com/advisory/ntap-20231208-0007/"]

[[affected]]
pkg = "Dbus_jll"
ranges = ["< 1.14.10+0"]

[[jlsec_sources]]
id = "CVE-2023-34969"
imported = 2025-10-10T13:32:22.008Z
modified = 2025-06-09T15:15:29.340Z
published = 2023-06-08T03:15:08.970Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-34969"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-34969"
```

# D-Bus before 1.15.6 sometimes allows unprivileged users to crash dbus-daemon

D-Bus before 1.15.6 sometimes allows unprivileged users to crash dbus-daemon. If a privileged user with control over the dbus-daemon is using the org.freedesktop.DBus.Monitoring interface to monitor message bus traffic, then an unprivileged user with the ability to connect to the same dbus-daemon can cause a dbus-daemon crash under some circumstances via an unreplyable message. When done on the well-known system bus, this is a denial-of-service vulnerability. The fixed versions are 1.12.28, 1.14.8, and 1.15.6.

