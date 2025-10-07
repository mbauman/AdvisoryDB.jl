# Reporting New Julia Ecosystem Vulnerabilities

It’s generally best practice to report potentially-exploitable security issues privately, either following the package security policy (if it has one), contacting the maintainer(s) directly, or by mailing security@julialang.org.

Security advisories are the _notification_ mechanism for downstream consumers, and they are most effective when they have a clear upgrade path or alternative.

## Creating a new JLSEC advisory

To create a new advisory, open a pull request that creates a new file named `JLSEC-0000-0.md`. Its very first line should start a ```` ```toml```` block that defines the advisory _data_, using fields as defined in the [Open Source Vulnerability (OSV) Schema](https://ossf.github.io/osv-schema/). Note that there are a few fields where we have a special shorthand (e.g., `affected` and `credits`).

You needn't worry about the `id` and date fields — those will be automatically populated upon merging the pull request. The pull request GitHub actions will do a dry-run and ensure those will be appropriately populated upon merge; you can see what it would do in the action's output (both in adjusting the Markdown/TOML and in creating the OSV-compliant JSON).

In many cases, you don't need to create an advisory from scratch. Package maintainers that use GitHub hosting can directly issue security advisories on the repository's "Security" tab. Once issued, these GitHub security advisories (GHSAs) can be directly imported here (as _aliases_).  Simply open an issue here to request its import.

Other Julia packages may need to issue advisories because they are directly redistributing upstream components that have themselves issued advisories. This is a common case for JLLs — they issue advisories for the _upstream_ vulnerabilities they contain. These data are vast, and ensuring all JLLs are accurately representing their upstream vulnerabilities is a long-tail problem. If there's a package you know isn't reporting an upstream vulnerability, you can open an issue here directly. It may be that it simply hasn't been imported yet, or it may be that its components aren't yet well-tracked by [GeneralMetadata.jl](https://github.com/mbauman/GeneralMetadata.jl).

## Updating an already-published advisory

Anyone can update advisories! Good updates can include further population of the structured fields, grammatical and spelling improvements, and technical reviews. Upon every change, the modified dates will be appropriately bumped upon merge to master.

## FAQ

**Q:** Do I need to be the owner or maintainer of a package to file an advisory?

**A:** No, anyone can file an advisory against any package. The legitimacy of vulnerabilities will be determined prior to merging. And if anything is mistakenly published, it can be `withdrawn` at a later point.

**Q:** Can I file an advisory without creating a pull request?

**A:** Yes, instead of creating a full advisory yourself, you can also open an issue on the advisory-db repo.

**Q:** Is there a mechanism here to handle embargoed vulnerabilities?

**A:** A particular JLSEC identifier may be reserved by placing an empty file of the appropriate name in the `advisories/reserved/` directory. SecurityVulnerabilities.jl itself does not have a mechanism to facilitate private discussions; those should occur directly with package maintainers or, for high-impact vulnerabilities, security@julialang.org.
