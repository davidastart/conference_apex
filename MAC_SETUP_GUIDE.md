# Mac Setup Guide for conference_apex Repository

Quick guide for organizing your conference_apex repository on Mac with Visual Studio Code and GitHub Desktop.

---

## 📋 Prerequisites

✅ Visual Studio Code installed  
✅ GitHub Desktop installed  
✅ Repository cloned to: `/Users/davidstart/Documents/GitHub/conference_apex`  
✅ All downloaded files from Claude ready to copy  

---

## 🚀 Quick Setup (5 Minutes)

### Step 1: Navigate to Repository

```bash
cd /Users/davidstart/Documents/GitHub/conference_apex
```

### Step 2: Copy Downloaded Files

Copy all files you downloaded from Claude to this directory:

```bash
# From your Downloads folder (or wherever Claude saved them)
cp ~/Downloads/00-deploy-all.sql .
cp ~/Downloads/01-schema.sql .
cp ~/Downloads/02-supporting-objects.sql .
cp ~/Downloads/03-sample-data.sql .
cp ~/Downloads/04-apex-app.sql .
cp ~/Downloads/05-ratings-feature.sql .
cp ~/Downloads/README_GITHUB.md .
cp ~/Downloads/DEPLOYMENT_GUIDE.md .
cp ~/Downloads/PROMPTS.md .
cp ~/Downloads/FILE_MANIFEST.md .
cp ~/Downloads/START_HERE.md .
cp ~/Downloads/DEMO_DAY_REFERENCE.md .
cp ~/Downloads/.gitignore .
cp ~/Downloads/LICENSE .
cp ~/Downloads/CONTRIBUTING.md .
cp ~/Downloads/GITHUB_STRUCTURE.md .
cp ~/Downloads/setup-repository.sh .
```

### Step 3: Make Setup Script Executable

```bash
chmod +x setup-repository.sh
```

### Step 4: Run Setup Script

```bash
./setup-repository.sh
```

This will:
- ✅ Create directory structure (sql/, docs/, scripts/, etc.)
- ✅ Move files to appropriate directories
- ✅ Rename README_GITHUB.md to README.md
- ✅ Create helper scripts
- ✅ Set up examples and resources folders

### Step 5: Update Configuration

Edit the APEX application script with your workspace/schema:

```bash
# Open in VS Code
code sql/04-apex-app.sql

# Or use nano/vim
nano sql/04-apex-app.sql
```

Find these lines (around line 24-26):
```sql
apex_application_install.set_workspace('YOUR_WORKSPACE');
apex_application_install.set_schema('YOUR_SCHEMA');
```

Change to your actual workspace and schema names:
```sql
apex_application_install.set_workspace('CONFERENCE');
apex_application_install.set_schema('CONFERENCE');
```

Save and close.

### Step 6: Update README with Your Info

Edit README.md to add your contact information:

```bash
code README.md
```

Find these sections and update:
- Contact section (add your email/Twitter)
- Any placeholder URLs
- Video link when available

### Step 7: Initialize Git (If Not Already Done)

```bash
# Check if already initialized
git status

# If not, initialize
git init
git branch -M main
```

### Step 8: Add Remote Repository

```bash
# Add GitHub remote
git remote add origin https://github.com/davidastart/conference_apex.git

# Verify
git remote -v
```

### Step 9: Initial Commit

```bash
# Add all files
git add .

# Check what will be committed
git status

# Commit
git commit -m "Initial commit: Building APEX Without the Builder demo application

- Complete SQL scripts for conference management system
- Comprehensive documentation (Deployment, Prompts, Manifest)
- GitHub-ready structure with .gitignore and LICENSE
- Helper scripts for quick deployment
- AI-generated APEX application (no Builder used!)
"

# Push to GitHub
git push -u origin main
```

---

## 🎨 Using Visual Studio Code

### Open Project in VS Code

```bash
cd /Users/davidstart/Documents/GitHub/conference_apex
code .
```

### Recommended VS Code Extensions

1. **SQLTools** - SQL syntax highlighting and formatting
2. **Oracle Developer Tools** - Oracle SQL support
3. **GitLens** - Git visualization
4. **Markdown All in One** - Better markdown editing
5. **Code Spell Checker** - Catch typos in comments

Install via: `Cmd+Shift+X` → Search extension name → Install

### Useful VS Code Commands

- `Cmd+P` - Quick file open
- `Cmd+Shift+F` - Search across all files
- `Cmd+B` - Toggle sidebar
- `Cmd+J` - Toggle terminal
- `Ctrl+` ` - Open terminal

---

## 🖥️ Using GitHub Desktop

### Open Repository

1. Open GitHub Desktop
2. File → Add Local Repository
3. Choose: `/Users/davidstart/Documents/GitHub/conference_apex`
4. Click "Add Repository"

### Making Changes

1. Edit files in VS Code
2. Switch to GitHub Desktop
3. Review changes in left panel
4. Write commit message
5. Click "Commit to main"
6. Click "Push origin"

### Best Practices

- **Commit often** - Small, focused commits
- **Good messages** - Describe what and why
- **Review changes** - Check before committing
- **Sync regularly** - Pull before you push

---

## 📂 Final Directory Structure

After setup, your repository should look like:

```
conference_apex/
├── .gitignore
├── CONTRIBUTING.md
├── GITHUB_STRUCTURE.md
├── LICENSE
├── README.md
├── setup-repository.sh
│
├── docs/
│   ├── DEMO_DAY_REFERENCE.md
│   ├── DEPLOYMENT_GUIDE.md
│   ├── FILE_MANIFEST.md
│   ├── PROMPTS.md
│   ├── START_HERE.md
│   ├── images/
│   │   └── (add screenshots here)
│   └── slides/
│       └── (add presentation here)
│
├── examples/
│   └── README.md
│
├── resources/
│   └── README.md
│
├── scripts/
│   ├── quick-deploy.sh
│   └── verify-installation.sql
│
└── sql/
    ├── 00-deploy-all.sql
    ├── 01-schema.sql
    ├── 02-supporting-objects.sql
    ├── 03-sample-data.sql
    ├── 04-apex-app.sql
    └── 05-ratings-feature.sql
```

---

## ✅ Verification

Run these commands to verify everything is set up correctly:

```bash
# Check git status
git status
# Should show: "On branch main, nothing to commit, working tree clean"

# Check remote
git remote -v
# Should show: origin https://github.com/davidastart/conference_apex.git

# List directory structure
tree -L 2
# or
find . -type d -maxdepth 2 | sort

# Verify SQL files
ls -la sql/
# Should show all 6 SQL files

# Verify docs
ls -la docs/
# Should show all documentation files
```

---

## 🎯 Next Steps

### Add Screenshots

Take screenshots of your running application:

```bash
# Create images directory if not exists
mkdir -p docs/images

# Add screenshots:
# - Dashboard view
# - Session catalog
# - Session form
# - Ratings dashboard
# - Architecture diagram

# Commit
git add docs/images/
git commit -m "Add application screenshots"
git push
```

### Add Presentation

After your conference presentation:

```bash
# Add slides
cp ~/Desktop/conference-presentation.pdf docs/slides/

# Commit
git add docs/slides/
git commit -m "Add conference presentation slides"
git push
```

### Update README

After first deployment:

```bash
# Edit README.md with:
# - Live demo link (if available)
# - Video recording link
# - Lessons learned
# - Additional notes

code README.md

# Commit changes
git add README.md
git commit -m "Update README with demo links and notes"
git push
```

### Tag Release

After successful presentation:

```bash
# Create release tag
git tag -a v1.0 -m "v1.0 - Initial conference demo release"
git push origin v1.0

# In GitHub, create a Release from this tag
# Add release notes about the presentation
```

---

## 🐛 Troubleshooting

### Issue: Permission denied on setup script

```bash
chmod +x setup-repository.sh
```

### Issue: Git says repository already exists

```bash
# Check current remote
git remote -v

# Remove if wrong
git remote remove origin

# Add correct remote
git remote add origin https://github.com/davidastart/conference_apex.git
```

### Issue: Files not moving in setup script

Make sure you're in the right directory:
```bash
pwd
# Should show: /Users/davidstart/Documents/GitHub/conference_apex
```

### Issue: VS Code can't find files

Reload VS Code:
- `Cmd+Shift+P` → "Reload Window"

---

## 💡 Tips

### Mac Shortcuts

- `Cmd+Space` - Spotlight search
- `Cmd+Tab` - Switch applications
- `Cmd+C`, `Cmd+V` - Copy, paste
- `Cmd+Z` - Undo
- `Cmd+Shift+.` - Show hidden files in Finder

### Terminal Tips

```bash
# Clear terminal
clear
# or Cmd+K

# List files including hidden
ls -la

# Open current directory in Finder
open .

# Open file with default application
open filename.pdf

# Create and navigate in one command
mkdir -p some/deep/path && cd $_

# Go back to previous directory
cd -
```

### Git Aliases (Optional)

Add to `~/.gitconfig`:

```ini
[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    unstage = reset HEAD --
    last = log -1 HEAD
    visual = log --graph --oneline --decorate --all
```

Then use:
```bash
git st        # Instead of git status
git co main   # Instead of git checkout main
git visual    # Nice visual log
```

---

## 🎉 You're All Set!

Your repository is now:
- ✅ Properly structured
- ✅ Git initialized
- ✅ Connected to GitHub
- ✅ Ready for development
- ✅ Ready to share

**Next:** Deploy the application and start presenting!

See `docs/DEPLOYMENT_GUIDE.md` for deployment instructions.

---

## 📞 Need Help?

- **Setup issues:** Check `GITHUB_STRUCTURE.md`
- **Git questions:** [Git documentation](https://git-scm.com/doc)
- **VS Code help:** [VS Code docs](https://code.visualstudio.com/docs)
- **GitHub Desktop:** [GitHub Desktop docs](https://docs.github.com/en/desktop)

Good luck with your presentation! 🚀
