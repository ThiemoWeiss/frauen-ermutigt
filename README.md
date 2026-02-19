
# frauen-ermutigt — simple static website

Project skeleton with 4 pages: Home, Pricing, Contact, Imprint.

Task tracking: Use GitHub Issues for all new tasks (TODO.md is deprecated).

Local preview:

```bash
# from project root
python -m http.server 8000
# then open in browser: http://localhost:8000
```

Branching & deployment (summary):
 `staging` → push triggers staging deploy (GitHub Actions)
 `master` → push triggers production deploy (GitHub Actions)

Important: Add these GitHub Environment secrets (staging/production): `FTP_HOST`, `FTP_USER`, `FTP_PASS`.

Hosting / DocumentRoot:
- production.frauen-ermutigt.de -> /public_html/production (DocumentRoot points here)
- staging.frauen-ermutigt.de -> /public_html/staging

See `.github/workflows/` for deploy workflows.
