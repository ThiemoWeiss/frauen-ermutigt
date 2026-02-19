# arc42 — Architecture Overview (sketch)

This document is a simplified arc42 sketch for the static website project `frauen-ermutigt`.

1. Introduction and goals
- Goal: provide a stable, low‑maintenance business‑card website with staging and production deploys.
- Stakeholders: Consultant (owner), Server administrator, End users.

2. Constraints
- Hosted on Hetzner (webhosting/VM with FTPS). Repository on GitHub.
- No dynamic server components, no forms initially.

3. Context and scope
- System delivers static HTML/CSS/JS files.
- External dependencies: GitHub Actions (CI), Hetzner (hosting).

4. Solution concept
- Single repository with `staging` and `master` branches.
- Deploy: GitHub Actions uploads files via FTPS (user/password) to the target directory.

5. Building blocks
- Content: HTML pages and assets (`/css`, `/images`).
- CI: `.github/workflows/deploy-*.yml`.
- Server: web server (e.g. Nginx) serves the `current` directory.

6. Runtime operation
- Deploy steps: push → (optional) build → FTPS upload → health check.
- Monitoring: simple HTTP health checks; logs available on the server.
- DocumentRoot: production.frauen-ermutigt.de -> /public_html/production, staging.frauen-ermutigt.de -> /public_html/staging.

7. Quality requirements
- Performance: low latency; static files cached.
- Security: FTPS (TLS); no public write endpoints.
- Availability: rollback via external backup/restore if needed.

8. Risks
- Misconfigured permissions or FTP target directory → web server errors.
- Accidental deletion due to incorrect upload settings.

9. Open issues
- Web server configuration (DocumentRoot pointing to `current`?), Let's Encrypt/SSL setup.

Further: Expand this sketch with diagrams and detailed configuration files as needed.
