# GitHub Repository Structure Guide
## /Users/davidstart/Documents/GitHub/conference_apex

## Recommended Directory Structure

```
conference_apex/
├── README.md                          # Main repository README (GitHub homepage)
├── LICENSE                            # MIT License (recommended)
├── .gitignore                         # Git ignore rules
│
├── sql/                               # SQL deployment scripts
│   ├── 00-deploy-all.sql
│   ├── 01-schema.sql
│   ├── 02-supporting-objects.sql
│   ├── 03-sample-data.sql
│   ├── 04-apex-app.sql
│   └── 05-ratings-feature.sql
│
├── docs/                              # Documentation
│   ├── DEPLOYMENT_GUIDE.md
│   ├── PROMPTS.md
│   ├── FILE_MANIFEST.md
│   ├── START_HERE.md
│   ├── DEMO_DAY_REFERENCE.md
│   ├── images/                        # Screenshots and diagrams
│   │   ├── dashboard.png
│   │   ├── session-catalog.png
│   │   ├── architecture-adb.png
│   │   └── demo-flow.png
│   └── slides/                        # Presentation materials
│       └── conference-presentation.pdf
│
├── scripts/                           # Helper scripts
│   ├── setup-adb.sh                   # Automated ADB setup
│   ├── quick-deploy.sh                # Quick deployment script
│   └── verify-installation.sql        # Verification queries
│
├── examples/                          # Example outputs
│   ├── sample-prompts.txt             # Example AI prompts
│   └── demo-transcript.md             # Example demo walkthrough
│
└── resources/                         # Additional resources
    ├── free-tier-signup.md            # OCI Free Tier guide
    └── troubleshooting.md             # Common issues

```

## How to Organize Your Files

### Step 1: Create Directory Structure

```bash
cd /Users/davidstart/Documents/GitHub/conference_apex

# Create directories
mkdir -p sql
mkdir -p docs/images
mkdir -p docs/slides
mkdir -p scripts
mkdir -p examples
mkdir -p resources
```

### Step 2: Move SQL Files

```bash
# Move all SQL files to sql/ directory
mv 00-deploy-all.sql sql/
mv 01-schema.sql sql/
mv 02-supporting-objects.sql sql/
mv 03-sample-data.sql sql/
mv 04-apex-app.sql sql/
mv 05-ratings-feature.sql sql/
```

### Step 3: Move Documentation

```bash
# Move documentation files to docs/
mv DEPLOYMENT_GUIDE.md docs/
mv PROMPTS.md docs/
mv FILE_MANIFEST.md docs/
mv START_HERE.md docs/
mv DEMO_DAY_REFERENCE.md docs/

# Keep README.md and LICENSE in root
```

### Step 4: Create Helper Scripts

Create these in the `scripts/` directory (examples provided in this guide)

### Step 5: Add .gitignore

Create a `.gitignore` file in the root (content provided in this guide)

---

## File Purposes

### Root Level
- **README.md** - Main entry point, project overview, badges
- **LICENSE** - MIT License for open source
- **.gitignore** - Exclude sensitive files (wallets, passwords)

### sql/
All deployment SQL scripts in execution order

### docs/
All documentation, guides, and reference materials

### scripts/
Helper scripts for automation and setup

### examples/
Example usage, sample prompts, demo walkthroughs

### resources/
Additional supporting materials and guides

---

## Commit Strategy

### Initial Commit
```bash
git add README.md LICENSE .gitignore
git commit -m "Initial commit: Project structure and documentation"
git push origin main
```

### Add SQL Scripts
```bash
git add sql/
git commit -m "Add SQL deployment scripts for APEX application"
git push origin main
```

### Add Documentation
```bash
git add docs/
git commit -m "Add comprehensive documentation and guides"
git push origin main
```

### Add Helper Scripts
```bash
git add scripts/
git commit -m "Add automation and deployment helper scripts"
git push origin main
```

---

## GitHub Best Practices

1. **Use meaningful commit messages**
   - "Add session ratings feature SQL"
   - "Update deployment guide with ADB instructions"
   - "Fix connection string in setup script"

2. **Tag releases**
   ```bash
   git tag -a v1.0 -m "Initial release: Conference demo version"
   git push origin v1.0
   ```

3. **Add topics/tags in GitHub**
   - oracle-apex
   - oracle-database
   - ai-assisted-development
   - low-code
   - conference-demo

4. **Enable GitHub Pages** (optional)
   - Settings → Pages → Deploy from /docs folder
   - Makes documentation accessible via web

5. **Add screenshots**
   - Take screenshots of running app
   - Add to docs/images/
   - Reference in README.md

---

## Quick Setup Commands

Run these commands to set up your repository:

```bash
# Navigate to repository
cd /Users/davidstart/Documents/GitHub/conference_apex

# Create directory structure
mkdir -p sql docs/images docs/slides scripts examples resources

# If files are in current directory, move them
[ -f "00-deploy-all.sql" ] && mv *.sql sql/ 2>/dev/null
[ -f "DEPLOYMENT_GUIDE.md" ] && mv *GUIDE.md *PROMPTS.md *MANIFEST.md *HERE.md *REFERENCE.md docs/ 2>/dev/null

# Initialize git if not already done
git init
git branch -M main

# Add remote if not already added
git remote add origin https://github.com/davidastart/conference_apex.git

# Create initial files (README, LICENSE, .gitignore)
# (Content provided in separate files)

# Initial commit
git add .
git commit -m "Initial commit: Building APEX Without the Builder demo"
git push -u origin main
```

---

## Maintenance

### Updating After Presentation
```bash
# Add presentation slides
cp ~/Desktop/presentation.pdf docs/slides/

# Add screenshots
cp ~/Desktop/screenshots/*.png docs/images/

# Commit updates
git add docs/
git commit -m "Add presentation materials and screenshots"
git push
```

### Adding Issues/Feedback
Use GitHub Issues for:
- Bug reports
- Feature requests
- Questions from attendees
- Suggestions for improvements

---

This structure keeps everything organized and makes it easy for visitors to find what they need!
