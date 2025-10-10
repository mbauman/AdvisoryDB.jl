```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnrt161kd-5750dn"
modified = 2025-10-10T13:32:21.997Z
upstream = ["CVE-2020-12049"]
references = ["http://packetstormsecurity.com/files/172840/D-Bus-File-Descriptor-Leak-Denial-Of-Service.html", "http://www.openwall.com/lists/oss-security/2020/06/04/3", "https://gitlab.freedesktop.org/dbus/dbus/-/issues/294", "https://gitlab.freedesktop.org/dbus/dbus/-/tags/dbus-1.10.30", "https://gitlab.freedesktop.org/dbus/dbus/-/tags/dbus-1.12.18", "https://gitlab.freedesktop.org/dbus/dbus/-/tags/dbus-1.13.16", "https://security.gentoo.org/glsa/202007-46", "https://securitylab.github.com/advisories/GHSL-2020-057-DBus-DoS-file-descriptor-leak", "https://usn.ubuntu.com/4398-1/", "https://usn.ubuntu.com/4398-2/", "http://packetstormsecurity.com/files/172840/D-Bus-File-Descriptor-Leak-Denial-Of-Service.html", "http://www.openwall.com/lists/oss-security/2020/06/04/3", "https://gitlab.freedesktop.org/dbus/dbus/-/issues/294", "https://gitlab.freedesktop.org/dbus/dbus/-/tags/dbus-1.10.30", "https://gitlab.freedesktop.org/dbus/dbus/-/tags/dbus-1.12.18", "https://gitlab.freedesktop.org/dbus/dbus/-/tags/dbus-1.13.16", "https://security.gentoo.org/glsa/202007-46", "https://securitylab.github.com/advisories/GHSL-2020-057-DBus-DoS-file-descriptor-leak", "https://usn.ubuntu.com/4398-1/", "https://usn.ubuntu.com/4398-2/"]

[[affected]]
pkg = "Dbus_jll"
ranges = ["< 1.14.10+0"]

[[jlsec_sources]]
id = "CVE-2020-12049"
imported = 2025-10-10T13:32:21.997Z
modified = 2024-11-21T04:59:10.813Z
published = 2020-06-08T17:15:09.910Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-12049"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-12049"
```

# An issue was discovered in dbus >= 1.3.0 before 1.12.18

An issue was discovered in dbus >= 1.3.0 before 1.12.18. The DBusServer in libdbus, as used in dbus-daemon, leaks file descriptors when a message exceeds the per-message file descriptor limit. A local attacker with access to the D-Bus system bus or another system service's private AF_UNIX socket could use this to make the system service reach its file descriptor limit, denying service to subsequent D-Bus clients.

