<#
  create_issues.ps1
  - Creates a GitHub repository named 'frauen-ermutigt' under the authenticated user's account (if it doesn't exist)
  - Initializes git (if necessary), pushes the local repo to GitHub
  - Parses TODO.md and creates GitHub Issues for each unchecked task (- [ ])

  Requirements:
  - Git installed and available in PATH
  - GitHub CLI (`gh`) installed and authenticated (`gh auth login`)
  - Run from project root: C:\Users\thiemo\repos\frauen-ermutigt
#>

Set-StrictMode -Version Latest

$projectRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent | Split-Path -Parent
if (-not (Test-Path "$projectRoot\TODO.md")) {
  Write-Error "TODO.md not found in $projectRoot. Run script from project root or move script to scripts/ and run from there."
  exit 1
}

Write-Host "Checking GitHub CLI authentication..." -ForegroundColor Cyan
try {
  $user = gh api user --jq .login 2>$null
} catch {
  Write-Host "Please login with 'gh auth login' before running this script." -ForegroundColor Yellow
  exit 1
}

if (-not $user) { Write-Host "Cannot determine GitHub user. Ensure 'gh' is authenticated."; exit 1 }

Write-Host "Authenticated as: $user" -ForegroundColor Green

$repoName = 'frauen-ermutigt'

Write-Host "Checking if repository $user/$repoName exists..." -ForegroundColor Cyan
$exists = (gh repo view "$user/$repoName" --json name --jq .name) -ne $null 2>$null

if (-not $exists) {
  $create = Read-Host "Repository $user/$repoName not found. Create it as public repo? (y/n)"
  if ($create -ne 'y') { Write-Host "Aborted by user."; exit 0 }
  gh repo create "$user/$repoName" --public --confirm
  Write-Host "Repository created." -ForegroundColor Green
} else {
  Write-Host "Repository already exists." -ForegroundColor Yellow
}

Push-Location $projectRoot
if (-not (Test-Path ".git")) {
  Write-Host "Initializing local git repository..."
  git init
  git add .
  git commit -m "Initial commit: static site skeleton" 2>$null || Write-Host "No changes to commit or commit failed." -ForegroundColor Yellow
}

Write-Host "Setting remote origin and pushing..."
git remote remove origin 2>$null | Out-Null
git remote add origin "https://github.com/$user/$repoName.git"
git branch -M master 2>$null | Out-Null
git push -u origin master --force

Write-Host "Parsing TODO.md and creating GitHub Issues..." -ForegroundColor Cyan
$lines = Get-Content TODO.md
foreach ($line in $lines) {
  if ($line -match '^- \[ \] (.+)$') {
    $title = $Matches[1].Trim()
    Write-Host "Create issue: $title"
    gh issue create --title "$title" --body "Imported from TODO.md" --label "task" --assignee "$user" || Write-Host "Failed to create issue: $title" -ForegroundColor Red
  }
}

Write-Host "Done. Open issues: https://github.com/$user/$repoName/issues" -ForegroundColor Green
Pop-Location
