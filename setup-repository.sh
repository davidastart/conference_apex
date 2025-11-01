#!/bin/bash
# setup-repository.sh
# Script to organize conference_apex repository structure
# Usage: ./setup-repository.sh

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "=========================================="
echo "Conference APEX Repository Setup"
echo "=========================================="
echo ""

# Check if we're in the right directory
if [[ ! $(pwd) == *"conference_apex"* ]]; then
    echo -e "${RED}Error: This script should be run from the conference_apex directory${NC}"
    echo "Current directory: $(pwd)"
    echo "Expected: /Users/davidstart/Documents/GitHub/conference_apex"
    echo ""
    echo "Run: cd /Users/davidstart/Documents/GitHub/conference_apex"
    exit 1
fi

echo -e "${GREEN}✓${NC} In correct directory: $(pwd)"
echo ""

# Create directory structure
echo "Creating directory structure..."

mkdir -p sql
mkdir -p docs/images
mkdir -p docs/slides
mkdir -p scripts
mkdir -p examples
mkdir -p resources

echo -e "${GREEN}✓${NC} Directories created"
echo ""

# Check for files in current directory
echo "Checking for files to organize..."

# Function to move file if it exists
move_if_exists() {
    local file=$1
    local dest=$2
    
    if [ -f "$file" ]; then
        mv "$file" "$dest"
        echo -e "${GREEN}  ✓${NC} Moved: $file → $dest"
        return 0
    fi
    return 1
}

# Move SQL files
echo ""
echo "Moving SQL files to sql/..."
move_if_exists "00-deploy-all.sql" "sql/"
move_if_exists "01-schema.sql" "sql/"
move_if_exists "02-supporting-objects.sql" "sql/"
move_if_exists "03-sample-data.sql" "sql/"
move_if_exists "04-apex-app.sql" "sql/"
move_if_exists "05-ratings-feature.sql" "sql/"

# Move documentation files
echo ""
echo "Moving documentation to docs/..."
move_if_exists "DEPLOYMENT_GUIDE.md" "docs/"
move_if_exists "PROMPTS.md" "docs/"
move_if_exists "FILE_MANIFEST.md" "docs/"
move_if_exists "START_HERE.md" "docs/"
move_if_exists "DEMO_DAY_REFERENCE.md" "docs/"

# Rename GitHub-specific README
echo ""
if [ -f "README_GITHUB.md" ]; then
    if [ -f "README.md" ]; then
        echo -e "${YELLOW}⚠${NC}  README.md already exists"
        echo "   Backing up existing README.md to README.old"
        mv README.md README.old
    fi
    mv README_GITHUB.md README.md
    echo -e "${GREEN}  ✓${NC} Set up README.md for GitHub"
fi

# Move other important files to root if they exist
echo ""
move_if_exists "GITHUB_STRUCTURE.md" "./"
move_if_exists ".gitignore" "./"
move_if_exists "LICENSE" "./"
move_if_exists "CONTRIBUTING.md" "./"

# Create placeholder script files
echo ""
echo "Creating placeholder scripts..."

# Quick deploy script
if [ ! -f "scripts/quick-deploy.sh" ]; then
    cat > scripts/quick-deploy.sh << 'EOF'
#!/bin/bash
# quick-deploy.sh
# Quick deployment script for conference APEX application

# Usage: ./quick-deploy.sh username password@database

if [ $# -ne 1 ]; then
    echo "Usage: $0 username/password@database"
    exit 1
fi

echo "Deploying Conference APEX Application..."
echo "========================================"

cd "$(dirname "$0")/.."

sql $1 << SQLEOF
@sql/00-deploy-all.sql
exit
SQLEOF

echo ""
echo "Deployment complete!"
echo "Access your app at: https://[your-apex-url]/ords/r/conf_tracker/dashboard"
EOF
    chmod +x scripts/quick-deploy.sh
    echo -e "${GREEN}  ✓${NC} Created: scripts/quick-deploy.sh"
fi

# Verification script
if [ ! -f "scripts/verify-installation.sql" ]; then
    cat > scripts/verify-installation.sql << 'EOF'
-- verify-installation.sql
-- Verify that the conference APEX application is properly installed

SET SERVEROUTPUT ON
SET FEEDBACK ON

PROMPT ========================================
PROMPT Conference APEX Installation Verification
PROMPT ========================================
PROMPT

-- Check tables
PROMPT Checking tables...
SELECT 
    'TABLES' as component,
    COUNT(*) as count,
    CASE WHEN COUNT(*) = 6 THEN 'PASS' ELSE 'FAIL' END as status
FROM user_tables 
WHERE table_name IN ('SPEAKERS', 'ROOMS', 'SESSIONS', 'ATTENDEES', 'ATTENDEE_SESSIONS', 'SESSION_RATINGS');

-- Check package
PROMPT Checking PL/SQL package...
SELECT 
    'PACKAGE' as component,
    COUNT(*) as count,
    CASE WHEN COUNT(*) >= 1 THEN 'PASS' ELSE 'FAIL' END as status
FROM user_objects 
WHERE object_name = 'CONFERENCE_PKG' 
AND object_type = 'PACKAGE';

-- Check views
PROMPT Checking views...
SELECT 
    'VIEWS' as component,
    COUNT(*) as count,
    CASE WHEN COUNT(*) >= 2 THEN 'PASS' ELSE 'FAIL' END as status
FROM user_views 
WHERE view_name LIKE 'V_%';

-- Check APEX application
PROMPT Checking APEX application...
SELECT 
    'APEX APP' as component,
    COUNT(*) as count,
    CASE WHEN COUNT(*) = 1 THEN 'PASS' ELSE 'FAIL' END as status
FROM apex_applications 
WHERE application_id = 200;

-- Check sample data
PROMPT Checking sample data...
SELECT 'SPEAKERS' as table_name, COUNT(*) as row_count FROM speakers
UNION ALL
SELECT 'ROOMS', COUNT(*) FROM rooms
UNION ALL
SELECT 'SESSIONS', COUNT(*) FROM sessions
UNION ALL
SELECT 'ATTENDEES', COUNT(*) FROM attendees;

PROMPT
PROMPT ========================================
PROMPT Verification Complete
PROMPT ========================================
EOF
    echo -e "${GREEN}  ✓${NC} Created: scripts/verify-installation.sql"
fi

# Create README for resources
if [ ! -f "resources/README.md" ]; then
    cat > resources/README.md << 'EOF'
# Additional Resources

This directory contains supplementary materials and guides.

## Contents

- `free-tier-signup.md` - Guide to signing up for Oracle Cloud Free Tier
- `troubleshooting.md` - Common issues and solutions
- Additional reference materials

## Add Your Own

Feel free to add:
- Links to helpful articles
- Video tutorials
- Community resources
- Best practices
EOF
    echo -e "${GREEN}  ✓${NC} Created: resources/README.md"
fi

# Create README for examples
if [ ! -f "examples/README.md" ]; then
    cat > examples/README.md << 'EOF'
# Examples

This directory contains examples and demonstrations.

## Contents

- `sample-prompts.txt` - Example AI prompts for generating code
- `demo-transcript.md` - Walkthrough of a successful demo

## Contributing

Add your own examples:
- Custom prompts that worked well
- Variations of the application
- Integration examples
- Use case demonstrations
EOF
    echo -e "${GREEN}  ✓${NC} Created: examples/README.md"
fi

# List current structure
echo ""
echo "=========================================="
echo "Current Repository Structure:"
echo "=========================================="
echo ""

tree -L 2 -a 2>/dev/null || find . -maxdepth 2 -type d | sort

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo ""
echo "1. Review files in their new locations"
echo "2. Edit sql/04-apex-app.sql to set your workspace/schema"
echo "3. Add your contact info to README.md"
echo "4. Initialize git if not already done:"
echo "   git init"
echo "   git add ."
echo "   git commit -m \"Initial commit: Repository structure\""
echo ""
echo "5. Push to GitHub:"
echo "   git remote add origin https://github.com/davidastart/conference_apex.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "6. Add screenshots to docs/images/"
echo "7. Add presentation slides to docs/slides/"
echo ""
echo -e "${GREEN}Repository is ready!${NC}"
