# Contributing

Thanks for helping improve frauen-ermutigt.

## Branching
- `master` is production.
- `staging` is test.
- Feature branches: `feature/*` -> PR -> `staging` -> test -> PR -> `master`.

## Deployments
- Push to `staging` triggers staging deploy.
- Push to `master` triggers production deploy.
- GitHub Environments are used: `staging`, `production`.
- Production should require approval in the GitHub Environment settings.

## Secrets
Set Environment secrets in GitHub (per environment):
- `FTP_HOST`
- `FTP_USER`
- `FTP_PASS`

## Style and content
- Keep HTML and CSS simple and readable.
- Update text placeholders before production.
