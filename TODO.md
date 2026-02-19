# Project TODO — frauen-ermutigt

Deprecated: This file is no longer the source of truth. Use GitHub Issues for all new tasks. See INSTRUCTIONS.md for the migration script.

This file contains the project's current tasks so that other tools or instances can read them.

- [ ] Choose Hetzner server type (VM or webhosting)
- [ ] Provide domain/subdomain for staging (e.g. staging.example.com)
- [ ] Provide branding: logo, color palette, final texts
- [ ] Set GitHub secrets (SSH key, host, deploy paths)
- [ ] Review workflows & create initial commit (in progress)
- [ ] Local: preview pages (http server)
- [ ] Staging: perform first deploy
- [ ] Production: merge & deploy after successful test
- [ ] Add INSTRUCTIONS.md (completed)
- [ ] Add arc42 docs under `doc/arc42` (completed)
- [ ] Add SKILLS files (`SKILLS.md`, `SKILLS.yaml`) (completed)

Notes:
- The GitHub Actions workflows are in `.github/workflows/` and expect repository secrets to be set.
- For atomic deploys we use release directories and a `current` symlink on the server.
