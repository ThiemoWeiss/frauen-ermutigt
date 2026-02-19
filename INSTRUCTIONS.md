
# Project: frauen-ermutigt — Instructions

Short summary: Static business‑card website for a consulting offering; deployment via GitHub Actions to Hetzner (staging/master). No forms or cookies initially.

Important paths
- Project root: `C:/Users/thiemo/repos/frauen-ermutigt`
- Web content: `index.html`, `pricing.html`, `contact.html`, `imprint.html`, `css/`
- CI workflows: `.github/workflows/deploy-staging.yml` and `deploy-prod.yml`
- arc42 docs: `doc/arc42/`

Branching & workflow
- `master` = production (push → prod deploy)
- `staging` = test (push → staging deploy)
- Feature branches: `feature/*` → PR → `staging` → test → PR from `staging` → `master`

Local development
1. Open PowerShell or CMD in the project folder.
2. Local preview:
```powershell
cd C:\Users\thiemo\repos\frauen-ermutigt
python -m http.server 8000
# Open in browser: http://localhost:8000
```

Deployment (summary)
- Set the following GitHub Environment secrets (staging/production): `FTP_HOST`, `FTP_USER`, `FTP_PASS`.
- Pushes to `staging` trigger the staging deploy; merging `staging` into `master` triggers the production deploy.

Hosting / DocumentRoot
- production.frauen-ermutigt.de -> /public_html/production (DocumentRoot points here)
- staging.frauen-ermutigt.de -> /public_html/staging

Rollback & cleanup
- FTP deploys update files in place. Keep external backups for rollback.

Administration / contact
- Server admin: FTP/FTPS access to the Hetzner host (deployer user) is required.
- Repo admin: permission to set secrets and create branches is required.

Other documents
- arc42 architecture sketch: `doc/arc42/arc42-overview.md`
- SKILLS: `SKILLS.md` and `SKILLS.yaml`

---
Note: Please provide logo, color palette, and final texts so I can adapt styles and content accordingly.

GitHub workflow requirement
- All project tasks shall be tracked using GitHub Issues going forward.
- To create the GitHub repository and migrate the current `TODO.md` tasks into Issues, run the script `scripts\create_issues.ps1` (see below). The script uses the GitHub CLI (`gh`) and requires an authenticated `gh` session.
- After migration, do not add new tasks to `TODO.md`.

Quick steps summary to create repo and migrate issues (local):
1. Install Git and GitHub CLI (`gh`) and authenticate: `gh auth login`.
2. From project root run the script (PowerShell elevated if required):
```powershell
cd C:\Users\thiemo\repos\frauen-ermutigt
.\scripts\create_issues.ps1
```
3. The script will create the repository under your GitHub account, push the current code, and create Issues for each unchecked `- [ ]` entry in `TODO.md`.

Important: The script will ask for confirmation before creating the remote repo and creating issues. It requires permission to push to the new remote.
