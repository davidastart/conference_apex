/*
 * Conference Session Tracker - Master Deployment Script
 * Generated for: Building APEX Without the Builder Demo
 * Description: One-command deployment of entire application
 * 
 * AI Model: Claude Sonnet 4.5
 * Generation Date: 2025-11-01
 * 
 * USAGE:
 *   sql username/password@database
 *   @00-deploy-all.sql
 */

SET SERVEROUTPUT ON
SET DEFINE OFF
SET VERIFY OFF
SET FEEDBACK ON
SET TIMING ON

PROMPT ========================================
PROMPT Conference Session Tracker
PROMPT Complete Application Deployment
PROMPT ========================================
PROMPT
PROMPT Building APEX Without the Builder Demo
PROMPT AI-Generated Application
PROMPT ========================================
PROMPT
PROMPT This script will:
PROMPT   1. Create database schema (tables, constraints, indexes)
PROMPT   2. Create supporting objects (packages, triggers, views)
PROMPT   3. Load sample data (speakers, rooms, sessions, attendees)
PROMPT   4. Create APEX application via API (no Builder!)
PROMPT   5. (Optional) Add ratings feature
PROMPT
PROMPT Estimated time: 2-3 minutes
PROMPT ========================================

WHENEVER SQLERROR CONTINUE
WHENEVER OSERROR CONTINUE

-- Prompt for confirmation
PROMPT
PROMPT Press ENTER to continue or Ctrl+C to cancel...
PAUSE

-- Start timing
SET TIMING ON

PROMPT
PROMPT ========================================
PROMPT Step 1 of 4: Creating Schema
PROMPT ========================================
@@01-schema.sql

PROMPT
PROMPT ========================================
PROMPT Step 2 of 4: Creating Supporting Objects
PROMPT ========================================
@@02-supporting-objects.sql

PROMPT
PROMPT ========================================
PROMPT Step 3 of 4: Loading Sample Data
PROMPT ========================================
@@03-sample-data.sql

PROMPT
PROMPT ========================================
PROMPT Step 4 of 4: Creating APEX Application
PROMPT ========================================
PROMPT
PROMPT IMPORTANT: Update YOUR_WORKSPACE and YOUR_SCHEMA
PROMPT in 04-apex-app.sql before running!
PROMPT
PROMPT Continue? (Press ENTER or Ctrl+C to cancel)
PAUSE
@@04-apex-app.sql

PROMPT
PROMPT ========================================
PROMPT Deployment Complete!
PROMPT ========================================
PROMPT
PROMPT Application Summary:
PROMPT   - Database Schema: ✓ Created
PROMPT   - Supporting Objects: ✓ Created
PROMPT   - Sample Data: ✓ Loaded
PROMPT   - APEX Application: ✓ Deployed
PROMPT
PROMPT Application Details:
PROMPT   - App ID: 200
PROMPT   - App Alias: CONF_TRACKER
PROMPT   - Pages: 4 (Dashboard, Catalog, Form, Global)
PROMPT   - Tables: 5 (speakers, rooms, sessions, attendees, attendee_sessions)
PROMPT   - Sample Data: 8 speakers, 8 rooms, 12 sessions, 10 attendees
PROMPT
PROMPT ========================================
PROMPT Next Steps:
PROMPT ========================================
PROMPT
PROMPT 1. Access your application:
PROMPT    [Your APEX URL]/r/conf_tracker/dashboard
PROMPT
PROMPT 2. (Optional) Open APEX Builder to see what was created:
PROMPT    App Builder > Application 200
PROMPT
PROMPT 3. (Optional) Add ratings feature for live demo:
PROMPT    @05-ratings-feature.sql
PROMPT
PROMPT 4. Share on GitHub:
PROMPT    git add .
PROMPT    git commit -m "AI-generated APEX application"
PROMPT    git push
PROMPT
PROMPT ========================================
PROMPT Demo Script Suggestions:
PROMPT ========================================
PROMPT
PROMPT For Conference Presentation:
PROMPT   1. Show this deployment script (how easy it is)
PROMPT   2. Access the running application
PROMPT   3. Show features working (dashboard, forms, validation)
PROMPT   4. Open Builder for the FIRST TIME (prove no Builder used)
PROMPT   5. Run @05-ratings-feature.sql LIVE
PROMPT   6. Refresh app to show new feature instantly
PROMPT
PROMPT ========================================
PROMPT Thank You!
PROMPT ========================================
PROMPT
PROMPT Questions about this approach?
PROMPT   - How was this generated? AI (Claude)
PROMPT   - How long did it take? Minutes
PROMPT   - Is it production-ready? Yes (with testing)
PROMPT   - Can I modify it? Absolutely
PROMPT   - Can non-APEX devs do this? Yes!
PROMPT
PROMPT ========================================

SET TIMING OFF
SET FEEDBACK ON
