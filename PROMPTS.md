# AI Prompts Used to Generate This Application

This document contains the actual prompts used with Claude AI to generate all SQL scripts in this repository. These prompts demonstrate how to effectively communicate with AI to generate production-quality database applications.

---

## General Principles for AI-Driven APEX Development

### Effective Prompt Structure

1. **Be Specific** - Define exact requirements, not vague goals
2. **Provide Context** - Explain the business domain and constraints
3. **Request Standards** - Ask for comments, naming conventions, error handling
4. **Iterate** - Start broad, then refine with follow-up prompts
5. **Test & Validate** - Always review and test AI-generated code

---

## Prompts Used in This Project

### 1. Initial Schema Generation

**Prompt:**
```
I need to build a conference session management system. Create a complete Oracle database schema with the following requirements:

Tables needed:
- Speakers (with contact info, bio, photo storage)
- Rooms (with capacity, equipment, location)
- Sessions (with date/time, description, status)
- Attendees (with registration info)
- Attendee-Session registrations (many-to-many)

Business rules:
- Prevent double-booking of rooms (same room, overlapping times)
- Prevent speakers from having overlapping sessions
- Track session capacity and registrations
- Support QR code generation for sessions
- Maintain audit timestamps

Technical requirements:
- Use identity columns for primary keys
- Include proper foreign keys and constraints
- Add indexes for performance
- Use check constraints for data validation
- Include helpful comments
- Follow Oracle naming conventions

Generate professional-quality DDL with:
- DROP statements for clean reruns
- Sequences for backward compatibility
- Comprehensive comments
- Clear organization
```

**Result:** `01-schema.sql`

---

### 2. Supporting Objects (PL/SQL)

**Prompt:**
```
Now create PL/SQL supporting objects for the conference system schema we just created. I need:

Package: CONFERENCE_PKG with functions/procedures for:
- check_room_conflict: Detect overlapping sessions in same room
- get_session_occupancy: Count registered attendees
- is_session_full: Check if session at capacity
- generate_session_qr: Create QR code data string
- register_attendee: Handle registration with validation
- cancel_registration: Remove registration
- checkin_attendee: Mark attendance
- validate_speaker_schedule: Prevent speaker conflicts

Triggers:
- Auto-update timestamps on modifications
- Auto-generate QR codes on session insert
- Validate room conflicts before insert/update
- Validate speaker schedule conflicts

Views:
- v_session_details: Complete session info with joins
- v_todays_sessions: Filter for current date

Requirements:
- Include proper error handling
- Add helpful comments
- Use consistent naming
- Make functions reusable
- Include exception handlers
```

**Result:** `02-supporting-objects.sql`

---

### 3. Sample Data

**Prompt:**
```
Generate realistic sample data for the conference session tracker:

Speakers: 8-10 diverse speakers with:
- Realistic names from various backgrounds
- Tech companies and job titles
- Professional bios (2-3 sentences)
- Social media handles
- Mix of experience levels

Rooms: 6-8 conference rooms with:
- Different capacities (20-500)
- Various layouts (theater, classroom, boardroom)
- Different buildings/floors
- AV equipment flags

Sessions: 10-15 sessions spanning 3 days with:
- Mix of tracks (Technical, Business, Community)
- Different difficulty levels
- Keynotes and regular sessions
- Some overlapping to show scheduling
- Include sessions for TODAY (SYSDATE) for dashboard testing

Attendees: 10-12 with:
- Diverse names
- Different companies
- Some checked in, some registered
- Mix of roles

Attendee Registrations:
- Register attendees for various sessions
- Include some for today's sessions
- Some attended, some not yet

Requirements:
- Use meaningful, realistic data
- Include data for demo purposes
- Set dates relative to SYSDATE
- Add summary statistics at end
```

**Result:** `03-sample-data.sql`

---

### 4. APEX Application

**Prompt:**
```
Create a complete Oracle APEX application using ONLY the wwv_flow_api package - no manual Builder use allowed!

Application Details:
- App ID: 200
- Name: Conference Session Tracker
- Alias: CONF_TRACKER
- Theme: Universal Theme (42)

Pages to create:

Page 0 (Global):
- Shared components

Page 1 (Dashboard):
- Cards region showing today's sessions
- Statistics region with key metrics
- Chart showing sessions by track
- Use SQL queries against our tables

Page 10 (Session Catalog):
- Interactive Report of all sessions
- Include speaker, room, time info
- Show availability status (colors for full/available)
- "Create Session" button linking to Page 20
- Searchable and filterable

Page 20 (Session Form - Modal):
- Form on SESSIONS table
- All relevant fields (title, description, dates, room, speaker)
- Select lists for rooms and speakers (with LOVs)
- Validation built-in via database triggers
- Save, Cancel, Delete buttons
- Modal dialog mode

Requirements:
- Use proper wwv_flow_api syntax
- Include all necessary IDs and references
- Add helpful comments
- Create navigation menu
- Use standard APEX patterns
- Make it production-ready
- Include process success messages
```

**Result:** `04-apex-app.sql`

---

### 5. Live Feature Addition (Ratings)

**Prompt:**
```
We're doing a LIVE DEMO and need to add a session ratings feature quickly!

Requirements:

New Table: session_ratings
- Link to sessions and attendees
- Rating (1-5 stars)
- Comment text
- Would recommend flag
- Can only rate attended sessions
- One rating per attendee per session

Extend Package: CONFERENCE_PKG
- get_session_avg_rating: Calculate average
- get_session_rating_count: Count ratings
- get_speaker_avg_rating: Average across all their sessions
- submit_session_rating: Add/update rating with validation

New View: v_session_ratings
- Summary of all ratings
- Calculate percentages

New APEX Page: Page 30 (Ratings Dashboard)
- Interactive Report of top-rated sessions
- Chart showing speaker ratings
- Display star visualization

Sample Data:
- Add 5-7 ratings for existing sessions
- Include mix of scores
- Add comments

Make it:
- Production quality
- Fast to deploy
- Impressive for live demo
- Show the power of this approach
```

**Result:** `05-ratings-feature.sql`

---

## Follow-Up Prompts During Development

### Refinement Examples

**If initial code has issues:**
```
The room conflict function is returning false positives. 
Fix the logic to properly detect overlapping time ranges:
- Session starts during existing session
- Session ends during existing session  
- Session completely encompasses existing session
Use proper timestamp comparison.
```

**If needing more features:**
```
Add email validation to the speakers table.
Include it as a package function: validate_email
Use regex pattern for standard email format.
Update triggers to call validation before insert/update.
```

**If output formatting needs adjustment:**
```
Improve the session display query:
- Format dates as "Day, DD-MON-YYYY"
- Format times as "HH24:MI"
- Show availability with colored HTML spans
- Calculate and display occupancy percentage
```

---

## Best Practices Learned

### What Works Well

✅ **Detailed Requirements**
- Specific data types, constraints, validations
- Explicit business rules
- Exact naming conventions

✅ **Structural Requests**
- "Include comments explaining each section"
- "Add error handling to all procedures"
- "Generate DROP statements for clean reruns"

✅ **Context Provision**
- "This is for a conference management system"
- "Speakers can have multiple sessions"
- "Rooms have capacity limits"

✅ **Quality Expectations**
- "Production-ready code"
- "Follow Oracle best practices"
- "Include proper indexing"

### What to Avoid

❌ **Vague Requests**
- "Create a database" (too broad)
- "Make it better" (not actionable)
- "Fix the bugs" (no specifics)

❌ **Assuming Context**
- Don't assume AI knows your business rules
- Don't assume AI knows your naming standards
- Don't assume AI knows your environment

❌ **Skipping Validation**
- Always test generated code
- Always review for security
- Always check for edge cases

---

## Prompt Templates for APEX Development

### Schema Generation Template
```
Create an Oracle database schema for [DOMAIN].

Tables needed:
- [TABLE 1]: [description and key fields]
- [TABLE 2]: [description and key fields]

Business rules:
- [RULE 1]
- [RULE 2]

Technical requirements:
- Use identity columns for PKs
- Include proper foreign keys
- Add performance indexes
- Use check constraints
- Include comments

Generate professional DDL with clean structure.
```

### PL/SQL Package Template
```
Create a PL/SQL package for [PURPOSE].

Functions/Procedures needed:
- [FUNCTION 1]: [description and parameters]
- [FUNCTION 2]: [description and parameters]

Requirements:
- Proper error handling
- Transaction management
- Clear comments
- Reusable code
- Exception handlers
```

### APEX Application Template
```
Create an APEX application using wwv_flow_api for [PURPOSE].

Application:
- App ID: [ID]
- Name: [NAME]
- Alias: [ALIAS]

Pages:
- Page [N]: [description and components]
- Page [N]: [description and components]

Use standard APEX patterns and Universal Theme.
```

---

## Tips for Success

### 1. **Start Simple, Iterate**
```
First prompt: "Create basic schema"
Second prompt: "Add validation triggers"
Third prompt: "Add business logic package"
Fourth prompt: "Create APEX UI"
```

### 2. **Reference Previous Work**
```
"Using the schema we created earlier, now generate..."
"Extend the CONFERENCE_PKG package we built with..."
```

### 3. **Request Specific Formats**
```
"Generate SQL with numbered comments for each section"
"Include banner comments at the top of each file"
"Add a summary at the end showing what was created"
```

### 4. **Ask for Explanations**
```
"Explain why you chose this approach for room conflict detection"
"What are the trade-offs of this design decision?"
```

### 5. **Request Alternatives**
```
"Show me two different ways to implement session capacity checking"
"What's a simpler approach to QR code generation?"
```

---

## Measuring Success

### Good AI Output Has:

✅ Clear, commented code  
✅ Proper error handling  
✅ Consistent naming  
✅ Follows conventions  
✅ Reusable components  
✅ Production-ready quality  

### Red Flags:

❌ Hardcoded values  
❌ Missing error handling  
❌ Inconsistent naming  
❌ No comments  
❌ Copy-paste code  
❌ Security issues  

---

## Conclusion

Effective AI-assisted development requires:
- **Clear communication** of requirements
- **Domain knowledge** to validate output
- **Iterative refinement** based on results
- **Human oversight** for quality and security

The prompts in this document generated 100% of the SQL code in this repository. With practice, you can achieve similar results for your own projects.

---

*Remember: AI is a powerful tool, but you're still the architect. Review, test, and validate everything.*
