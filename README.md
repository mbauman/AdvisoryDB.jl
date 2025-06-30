# GitHub Security Advisory Fetcher

> [!WARNING]  
> Work in progress. Likely incorrect data. 

This script fetches GitHub Security Advisories for Julia packages and converts them to OSV (Open Source Vulnerability) format.

## Overview

The script:
1. Fetches GitHub Security Advisories published in the last 25 hours (configurable)
2. Filters for advisories affecting Julia ecosystem packages
3. Converts them to OSV format
4. Saves them as YAML files in a `packages/` directory structure

## Dependencies

- Julia 1.9+
- HTTP.jl - for API requests
- JSON3.jl - for JSON parsing
- YAML.jl - for YAML output
- Dates - for timestamp handling (standard library)

## Setup

1. Install dependencies:
   ```bash
   julia --project=. -e 'using Pkg; Pkg.instantiate()'
   ```

2. (Optional) Set GitHub token for higher rate limits:
   ```bash
   export GITHUB_TOKEN=your_token_here
   ```

## Usage

Run the script:
```bash
julia --project=. fetch_github_advisories.jl
```

## Output Structure

Advisories are saved in the following structure:
```
packages/
├── PackageName1/
│   └── GHSA-xxxx-xxxx-xxxx.yml
├── PackageName2/
│   └── GHSA-yyyy-yyyy-yyyy.yml
```

Each YAML file contains the advisory in OSV format with fields like:
- `id`: GitHub Security Advisory ID
- `schema_version`: OSV schema version
- `summary`: Brief description
- `details`: Detailed vulnerability information
- `affected`: Affected packages and version ranges
- `references`: Links to additional information

## GitHub Actions

This repository includes a GitHub Action (`.github/workflows/fetch-advisories.yml`) that runs automatically at 3 AM UTC daily to fetch new advisories and commit them to the repository.

## Functions

- `fetch_advisories(hours)` - Fetches advisories with pagination support
- `filter_julia_advisories()` - Filters for Julia ecosystem packages
- `convert_to_osv()` - Converts GitHub format to OSV format
- `write_advisory_files()` - Creates directory structure and writes files