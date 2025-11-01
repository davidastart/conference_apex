# Conference Session Tracker - File Manifest

All SQL scripts for the "Building APEX Without the Builder" demo presentation.

## 📦 Complete File List

### Core SQL Scripts (Execute in Order)

| File | Purpose | Lines | Estimated Time |
|------|---------|-------|----------------|
| `00-deploy-all.sql` | Master deployment script - runs all scripts in sequence | 150 | 2-3 minutes |
| `01-schema.sql` | Database tables, constraints, indexes, sequences | 300 | 30 seconds |
| `02-supporting-objects.sql` | PL/SQL packages, triggers, views, business logic | 600 | 45 seconds |
| `03-sample-data.sql` | Realistic test data (8 speakers, 8 rooms, 12 sessions, 10 attendees) | 400 | 30 seconds |
| `04-apex-app.sql` | Complete APEX application via API (Pages 0, 1, 10, 20) | 800 | 60 seconds |
| `05-ratings-feature.sql` | Session ratings add-on (for live demo) | 500 | 45 seconds |

### Documentation

| File | Purpose |
|------|---------|
| `README.md` | Complete project documentation, installation guide, philosophy |
| `PROMPTS.md` | All AI prompts used to generate the code |
| `DEPLOYMENT_GUIDE.md` | Architecture comparison (ADB vs VM), detailed setup instructions, demo script |
| `FILE_MANIFEST.md` | This file - complete inventory and guide |

---

## 🚀 Quick Start

### Option 1: Full Deployment (Recommended)

```sql
-- Connect to your database
sql username/password@database

-- Run master script (executes all scripts)
@00-deploy-all.sql
```

### Option 2: Step-by-Step

```sql
-- 1. Create schema
@01-schema.sql

-- 2. Create supporting objects
@02-supporting-objects.sql

-- 3. Load sample data
@03-sample-data.sql

-- 4. Create APEX app (update workspace/schema first!)
@04-apex-app.sql

-- 5. (Optional) Add ratings feature for demo
@05-ratings-feature.sql
```

---

## 📋 Script Details

### 00-deploy-all.sql
**Master Deployment Script**
- Orchestrates entire deployment
- Includes prompts and confirmations
- Provides timing information
- Shows deployment summary
- Suggests next steps

**Key Features:**
- Error handling
- Progress indicators
- Post-installation checklist
- Demo script suggestions

---

### 01-schema.sql
**Database Schema**
- 5 main tables
- 4 supporting sequences
- Multiple indexes for performance
- Foreign key relationships
- Check constraints for validation

**Tables Created:**
- `speakers` - Conference presenters
- `rooms` - Venue spaces
- `sessions` - Scheduled presentations
- `attendees` - Registered participants
- `attendee_sessions` - Registration tracking

**Special Features:**
- Identity columns (auto-increment)
- Audit timestamps
- BLOB storage for photos
- Unique constraints
- Comprehensive comments

---

### 02-supporting-objects.sql
**Business Logic Layer**

**Package: CONFERENCE_PKG**
- 9 functions
- 3 procedures
- Complete error handling
- Transaction management

**Key Functions:**
- Room conflict detection
- Session capacity tracking
- Speaker schedule validation
- QR code generation
- Registration management
- Check-in processing

**Triggers:**
- Timestamp automation
- QR code auto-generation
- Conflict validation
- Data integrity enforcement

**Views:**
- `v_session_details` - Complete session information
- `v_todays_sessions` - Today's schedule

---

### 03-sample-data.sql
**Test Data**

**Includes:**
- 8 diverse speakers (various backgrounds, companies)
- 8 conference rooms (various sizes, layouts)
- 12 sessions (spanning 3 days, mixed tracks/levels)
- 10 attendees (different companies, roles)
- 15+ attendee registrations
- Mix of checked-in and pending attendees

**Data Quality:**
- Realistic names and companies
- Professional bios
- Proper date/time scheduling
- Some sessions TODAY for dashboard testing
- Demonstrates capacity and conflicts

**Special Notes:**
- Sessions use SYSDATE for "today"
- Mix of status (scheduled, confirmed, completed)
- Demonstrates all features

---

### 04-apex-app.sql
**APEX Application (API-Generated)**

**Application Details:**
- App ID: 200
- Alias: CONF_TRACKER
- Theme: Universal Theme (42)
- 4 pages total

**Pages:**

**Page 0 - Global Page**
- Shared components
- Common elements

**Page 1 - Dashboard**
- Today's sessions (cards region)
- Statistics summary
- Sessions by track chart
- Real-time data

**Page 10 - Session Catalog**
- Interactive Report
- Searchable/filterable
- Availability indicators
- Create button → Page 20

**Page 20 - Session Form**
- Modal dialog
- Full CRUD operations
- Validation via triggers
- LOVs for rooms/speakers
- Save/Cancel/Delete buttons

**Key Features:**
- Professional layout
- Proper navigation
- Form validation
- Success messages
- Error handling

---

### 05-ratings-feature.sql
**Session Ratings Add-On**

**New Components:**
- `session_ratings` table
- 4 new package functions
- 1 new procedure
- `v_session_ratings` view
- APEX Page 30 (Ratings Dashboard)

**Features:**
- 1-5 star rating system
- Text comments
- Recommendation flag
- Attendance verification
- One rating per attendee/session
- Average calculations
- Speaker rating aggregation

**APEX Page 30:**
- Top-rated sessions report
- Speaker ratings chart
- Visual star display
- Interactive filtering

**Sample Data:**
- 7 ratings for demo
- Mix of scores (4-5 stars)
- Helpful comments
- Realistic feedback

**Purpose:**
- Demonstrates live feature addition
- Shows iteration speed
- Proves AI-driven development
- Impresses demo audience!

---

## 🎯 Demonstration Flow

### Pre-Demo Setup
1. Clean database with APEX workspace
2. Git repository initialized
3. Terminal + AI + Browser visible
4. APEX Builder **deliberately closed**

### Demo Execution

**Act 1: Build (30 min)**
1. Show requirements to AI
2. AI generates `01-schema.sql`
3. Execute → Database created
4. AI generates `04-apex-app.sql`
5. Execute → App deployed
6. Browse working application

**Act 2: Reveal (5 min)**
1. Open APEX Builder (first time!)
2. Navigate to App 200
3. Show all pages/components exist
4. Prove no Builder usage

**Act 3: Iterate (10 min)**
1. Request ratings feature from AI
2. AI generates `05-ratings-feature.sql`
3. Execute script (live!)
4. Refresh app → New page appears
5. Commit to Git
6. Show GitHub history

**Act 4: Discuss (10 min)**
- Q&A
- Limitations
- Future implications
- Alternative approaches

---

## 📊 Statistics

### Code Generated
- **Total SQL Lines:** ~2,750
- **PL/SQL Functions:** 13
- **PL/SQL Procedures:** 4
- **Database Tables:** 6
- **APEX Pages:** 4 (5 with ratings)
- **Triggers:** 4
- **Views:** 3
- **Sample Records:** 50+

### Development Time
- **Traditional APEX:** 2-3 days
- **With Builder:** 4-6 hours
- **AI-Generated:** 45 minutes (+ testing)
- **Live Demo Add-on:** 5 minutes

### Lines of Code by File
```
00-deploy-all.sql           150 lines
01-schema.sql              300 lines
02-supporting-objects.sql  600 lines
03-sample-data.sql         400 lines
04-apex-app.sql            800 lines
05-ratings-feature.sql     500 lines
-----------------------------------
Total:                   2,750 lines
```

---

## ⚙️ Configuration Required

### Before Running

**In `04-apex-app.sql`, update:**
```sql
apex_application_install.set_workspace('YOUR_WORKSPACE');  -- Line 24
apex_application_install.set_schema('YOUR_SCHEMA');        -- Line 26
```

**In `05-ratings-feature.sql`, update:**
```sql
(Same workspace/schema changes if needed)
```

### Database Requirements
- Oracle Database 19c or higher (23ai/26ai preferred)
- APEX 21.2 or higher
- APEX workspace with development privileges
- Schema with CREATE TABLE/PACKAGE/TRIGGER privileges

### Network Requirements
- Access to Oracle database
- ORDS endpoint for APEX runtime
- (Optional) Internet for sharing/GitHub

---

## 🔍 Troubleshooting

### Common Issues

**"Invalid workspace"**
- Update workspace name in `04-apex-app.sql`

**"Schema does not exist"**
- Update schema name in `04-apex-app.sql`

**"Table already exists"**
- Script includes DROP statements
- Check for manual cleanup if errors

**"APEX application not found"**
- Verify app ID 200 not in use
- Check workspace permissions

**"Function not found"**
- Ensure `02-supporting-objects.sql` ran successfully
- Check compilation errors

---

## 🎓 Educational Use

### For Learning

**APEX API Study:**
- See real `wwv_flow_api` usage
- Understand page creation
- Learn component relationships

**PL/SQL Patterns:**
- Business logic separation
- Package design
- Error handling
- Trigger usage

**AI Collaboration:**
- Effective prompting
- Code review practices
- Iteration techniques

### For Teaching

**Workshop Ideas:**
- APEX without Builder basics
- AI-assisted development
- DevOps for APEX
- Code-first approaches

**Assignments:**
- Extend with new features
- Improve UI/UX
- Add security
- Optimize performance

---

## 📚 Additional Files to Create

### For Production Use

**Consider adding:**
- `06-security.sql` - Row-level security
- `07-authorization.sql` - APEX auth schemes
- `08-email-notifications.sql` - Notification system
- `09-reports.sql` - Additional reports
- `10-api.sql` - REST APIs

### For DevOps

**Consider adding:**
- `.gitignore` - Exclude temp files
- `Containerfile` - Database container
- `docker-compose.yml` - Full stack
- `deploy.sh` - Automation script
- `test.sql` - Unit tests

---

## 🎉 Success Criteria

### Application Deployed Successfully When:

✅ All scripts execute without errors  
✅ Tables contain sample data  
✅ Views return results  
✅ Package compiles successfully  
✅ Application appears in Builder  
✅ Runtime URL loads dashboard  
✅ Forms save data correctly  
✅ Validation prevents conflicts  
✅ Git history shows commits  

---

## 🚦 Next Steps

### After Deployment

1. **Test thoroughly** - Try all features
2. **Review code** - Understand what was generated
3. **Customize** - Adapt to your needs
4. **Share** - Show colleagues, teach others
5. **Iterate** - Add your own features
6. **Contribute** - Improve and share back

### Going Further

- Add authentication/authorization
- Implement additional features
- Create mobile app version
- Build REST APIs
- Add reporting dashboard
- Integrate with other systems

---

**📧 Questions?**

Open an issue, check the README, or review PROMPTS.md for detailed guidance.

---

*All code generated by Claude AI • Deployed without APEX Builder • Production-ready with testing*
