# arc42 — Architecture Overview (sketch)

This document is a simplified arc42 sketch for the static website project `frauen-ermutigt`.

1. Introduction and goals
- Goal: provide a stable, low‑maintenance business‑card website with staging and production deploys.
- Stakeholders: Consultant (owner), Server administrator, End users.

2. Constraints
- Hosted on Hetzner (VM with SSH). Repository on GitHub.
- No dynamic server components, no forms initially.

3. Context and scope
- System delivers static HTML/CSS/JS files.
- External dependencies: GitHub Actions (CI), Hetzner (hosting).

4. Solution concept
- Single repository with `staging` and `main` branches.
- Deploy: GitHub Actions synchronizes artifacts via rsync into atomic release folders; a `current` symlink points to the active release.

5. Building blocks
- Content: HTML pages and assets (`/css`, `/images`).
- CI: `.github/workflows/deploy-*.yml`.
- Server: web server (e.g. Nginx) serves the `current` directory.

6. Runtime operation
- Deploy steps: push → (optional) build → rsync → symlink swap → health check.
- Monitoring: simple HTTP health checks; logs available on the server.

7. Quality requirements
- Performance: low latency; static files cached.
- Security: SSH key authentication; no public write endpoints.
- Availability: simple rollback via symlink switch.

8. Risks
- Misconfigured symlink or permissions → web server errors.
- Accidental deletion due to improper cleanup scripts.

9. Open issues
- Web server configuration (DocumentRoot pointing to `current`?), Let's Encrypt/SSL setup, domain and hostnames.

Further: Expand this sketch with diagrams and detailed configuration files as needed.
