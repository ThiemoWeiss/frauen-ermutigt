# Deployment secrets checklist

Use GitHub Environments to separate staging and production.

## 1) Create environments
- `staging`
- `production` (require reviewers)

## 2) Add secrets to each environment
Secrets must exist in BOTH environments, with environment-specific values.

| Secret | staging value (example) | production value (example) |
| --- | --- | --- |
| `FTP_HOST` | staging.frauen-ermutigt.de | production.frauen-ermutigt.de |
| `FTP_USER` | staging user | production user |
| `FTP_PASS` | staging password | production password |

Remote directory: `/` (root). The user/environment defines the target directory.

## 3) Verify
- Push to `staging` and confirm deploy succeeds.
- Push to `master` and confirm production approval is required.

## 4) Password hygiene
- Use separate passwords per environment.
- Rotate passwords periodically.
