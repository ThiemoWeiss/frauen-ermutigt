
# frauen-ermutigt — simple static website

Project skeleton with 4 pages: Home, Pricing, Contact, Imprint.

Local preview:

```bash
# from project root
python -m http.server 8000
# then open in browser: http://localhost:8000
```

Branching & deployment (summary):
- `staging` → push triggers staging deploy (GitHub Actions)
- `main` → push triggers production deploy (GitHub Actions)

Important: Add these GitHub repository secrets: `HETZNER_HOST`, `HETZNER_USER`, `HETZNER_SSH_PRIVATE_KEY`, `DEPLOY_PATH_STAGING`, `DEPLOY_PATH_PROD`.

See `.github/workflows/` for deploy workflows.
