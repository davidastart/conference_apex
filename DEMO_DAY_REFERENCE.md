# Demo Day Quick Reference Card
## Building APEX Without the Builder
### Print this and keep it handy! 📋

---

## ⚡ QUICK ACCESS

### URLs (Bookmark These!)
```
OCI Console:     https://cloud.oracle.com
Cloud Shell:     [Click icon in OCI Console top-right]
APEX Runtime:    https://[your-adb-url]/ords/r/conf_tracker/dashboard
APEX Builder:    https://[your-adb-url]/ords/conference
GitHub Repo:     https://github.com/[your-username]/apex-without-builder
```

### Credentials
```
Database:
  User: CONFERENCE
  Pass: [YOUR_PASSWORD]
  TNS:  apexdemo_high

APEX Workspace:
  Workspace: CONFERENCE
  Username:  ADMIN
  Password:  [YOUR_PASSWORD]
```

---

## 🎬 60-MINUTE DEMO FLOW

### Part 1: Introduction (5 min)
- [ ] Show title slide
- [ ] Present the question: "Can you build APEX without Builder?"
- [ ] Show abstract and goals

### Part 2: The Setup (5 min)
- [ ] Show OCI Console → ADB Details
- [ ] Explain: "Fresh database, APEX pre-installed, $0 cost"
- [ ] Open Cloud Shell
- [ ] Show: `sql admin/password@apexdemo_high`

### Part 3: AI-Generated Code (10 min)
- [ ] Split screen: AI chat + Terminal
- [ ] Show prompt to AI
- [ ] Display generated 01-schema.sql
- [ ] Display generated 04-apex-app.sql
- [ ] Explain quality and completeness

### Part 4: Deployment (5 min)
- [ ] Connect: `sql conference/password@apexdemo_high`
- [ ] Run: `@00-deploy-all.sql`
- [ ] Watch output (talk through what's happening)
- [ ] Show: "Done in 3 minutes!"

### Part 5: The Application (10 min)
- [ ] Open APEX Runtime URL
- [ ] Navigate Dashboard
- [ ] Show Session Catalog
- [ ] Create new session
- [ ] Demonstrate validation
- [ ] Show all features working

### Part 6: The Big Reveal (5 min)
- [ ] Say: "Opening Builder for FIRST TIME"
- [ ] Login to APEX Builder
- [ ] Navigate to App 200
- [ ] Show all pages and components
- [ ] Prove: "Never opened Builder until now!"

### Part 7: Live Feature Add (10 min)
- [ ] Ask AI: "Add session ratings feature"
- [ ] Show generated code
- [ ] Run: `@05-ratings-feature.sql`
- [ ] Refresh browser
- [ ] Show new ratings page working
- [ ] Emphasize: "Added in 90 seconds!"

### Part 8: Discussion (10 min)
- [ ] Show advantages slide
- [ ] Show limitations slide
- [ ] Show when to use this
- [ ] Open for Q&A

---

## 🚨 EMERGENCY COMMANDS

### If Connection Fails
```bash
export TNS_ADMIN=/home/$(whoami)/wallet
sql conference/password@apexdemo_high
```

### If Cloud Shell Times Out
```bash
cd ~/apex-without-builder
export TNS_ADMIN=/home/$(whoami)/wallet
```

### If Script Fails
```sql
-- Check what exists
SELECT table_name FROM user_tables;
SELECT application_id FROM apex_applications;

-- Restart from specific script
@02-supporting-objects.sql  -- If schema ok but packages missing
@04-apex-app.sql            -- If data ok but no APEX app
```

### If APEX URL Wrong
```
Database Details → APEX → Copy URL
Format: https://[hash].adb.[region].oraclecloudapps.com/ords/
```

---

## 💬 KEY TALKING POINTS

### Opening
> "Today we're going to challenge a fundamental assumption: 
> that you need the APEX Builder to build APEX applications."

### During Setup
> "This is an Oracle Autonomous Database provisioned in 3 minutes. 
> APEX is already installed. Cloud Shell gives me SQLcl. 
> Total setup time: zero."

### During Deployment
> "Watch as AI-generated code creates a complete application. 
> Tables, business logic, APEX components—all from SQL scripts. 
> Traditional approach? Days or weeks. This approach? Minutes."

### The Reveal
> "I haven't opened the APEX Builder yet. Let's do that now. 
> [Opens Builder] Here's application 200 with all its pages. 
> Everything you saw was created via API. No clicks, just code."

### Live Feature Add
> "Let's add a feature right now. [Types prompt to AI] 
> AI generates the code... [Runs script] 
> Done. Refresh your browser. New feature is live. 
> 90 seconds from idea to production."

### Closing
> "This isn't about replacing the Builder—it's about expanding 
> our toolkit. It's about making APEX accessible to more people. 
> It's about the future where AI and humans collaborate to build 
> better applications, faster."

---

## 🛠️ TROUBLESHOOTING

| Problem | Quick Fix |
|---------|-----------|
| Can't connect to DB | Check TNS_ADMIN: `echo $TNS_ADMIN` |
| Wrong workspace | Run workspace creation script again |
| App ID exists | Change to 201 in 04-apex-app.sql |
| Page not found | Verify URL, check app deployed |
| Cloud Shell timeout | Reconnect, reset TNS_ADMIN |

---

## 📱 BACKUP PLAN

### If Live Demo Fails
1. **Show backup video** (have ready on laptop)
2. Say: "Let me show you a recording from this morning"
3. Continue with same talking points
4. Show GitHub repo with all code
5. Explain what would have happened

### If Internet Fails
1. **Use phone hotspot** as backup
2. Have pre-downloaded slides on laptop
3. Walk through code in editor
4. Show architecture diagrams
5. Extended Q&A session

---

## ✅ PRE-DEMO CHECKLIST

### Night Before
- [ ] ADB running and accessible
- [ ] Cloud Shell tested
- [ ] Scripts uploaded and tested
- [ ] Backup video recorded
- [ ] Slides prepared
- [ ] Handouts printed
- [ ] Get good sleep!

### Morning Of
- [ ] Full battery on laptop
- [ ] Backup battery pack
- [ ] Adapters for projector
- [ ] Phone hotspot ready
- [ ] Water bottle
- [ ] This reference card

### 1 Hour Before
- [ ] Start ADB if stopped
- [ ] Open Cloud Shell (pre-warm)
- [ ] Test database connection
- [ ] Open all browser tabs
- [ ] Load presentation
- [ ] Test A/V
- [ ] Silence notifications

### On Stage (Before Starting)
- [ ] Laptop connected to projector
- [ ] Screen mirroring working
- [ ] Internet connected
- [ ] Browser zoom 150%
- [ ] Windows positioned
- [ ] Phone airplane mode
- [ ] Water ready
- [ ] Deep breath!

---

## 🎯 SUCCESS INDICATORS

### During Demo
- ✓ Scripts execute without errors
- ✓ Application loads and works
- ✓ Live feature deploys successfully
- ✓ Stay within time limit
- ✓ Audience engaged

### After Demo
- ✓ Questions asked
- ✓ Business cards exchanged
- ✓ GitHub repo stars
- ✓ Social media mentions
- ✓ Follow-up emails

---

## 📞 HELP CONTACTS

### If You Need Support
```
Oracle Cloud Support: [Support number]
Conference A/V Team:  [Contact info]
Your Backup Person:   [Name/Number]
```

---

## 🎤 FINAL REMINDERS

### Do:
✓ Speak clearly and slowly
✓ Make eye contact
✓ Engage the audience
✓ Show enthusiasm
✓ Handle errors gracefully
✓ Stay on schedule

### Don't:
✗ Apologize excessively
✗ Rush through sections
✗ Read from slides
✗ Turn back to audience
✗ Panic if something fails
✗ Go over time

---

## 💡 AD-LIB SUGGESTIONS

### If Ahead of Schedule
- Show more code details
- Dive into AI prompts
- Extended live Q&A
- Show GitHub repository
- Discuss future possibilities

### If Behind Schedule
- Skip detailed code walkthrough
- Summarize some sections
- Show key highlights only
- Save details for Q&A
- Offer to share materials

### If Technical Issue
- Stay calm and positive
- Have audience guess what happens next
- Explain the concept verbally
- Draw architecture on whiteboard
- Switch to backup video

---

## 🌟 CONFIDENCE BOOSTERS

> You know this material cold.
> You've practiced multiple times.
> You have backups for backups.
> The audience wants you to succeed.
> You're teaching them something valuable.
> This presentation will help people.
> You've got this! 💪

---

**FOLD THIS CARD AND KEEP IN YOUR POCKET**

**Front side: Demo Flow & Key Points**
**Back side: Troubleshooting & Emergency Info**

**Good luck! You're going to do great! 🚀**
