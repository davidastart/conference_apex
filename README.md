# Building APEX Without the Builder

> **An AI-Driven Development Experiment**

This repository contains a complete Oracle APEX application built entirely through SQL scripts—**without ever opening the APEX Builder interface**. This is the companion code for the conference presentation *"Building APEX Without the Builder: An AI-Driven Development Experiment."*

## 🎯 Project Overview

**Can you build and deploy a production-ready APEX business application without ever opening the APEX Builder?**

Yes! This project demonstrates:

- ✅ Complete APEX application generated via AI (Claude)
- ✅ Built using APEX API (`wwv_flow_api`)
- ✅ Fully functional with forms, reports, dashboards
- ✅ Business logic with PL/SQL packages
- ✅ Real-world features (conflict detection, QR codes, registration)
- ✅ Version controlled in Git
- ✅ Reproducible deployment

## 📋 What's Included

### The Application: Conference Session Tracker

A real-world conference management system with:

- **Dashboard** - Real-time view of today's sessions
- **Session Catalog** - Searchable interactive report
- **Session Management** - Forms with validation
- **Speaker Directory** - Speaker profiles
- **Room Scheduling** - Conflict detection
- **Attendee Registration** - Capacity management
- **QR Code Generation** - Session check-in
- **(Bonus) Session Ratings** - Added live during demo!

### Tech Stack

- **Oracle Database 26ai** (or 19c+)
- **Oracle APEX** (21.2+)
- **PL/SQL** for business logic
- **AI Tools** (Claude) for code generation
- **Git/GitHub** for version control
- **SQLcl** for deployment
- **Podman/Docker** (optional) for containers

## 🚀 Quick Start

### Deployment Options

**We recommend two approaches:**

1. **Autonomous Database + Cloud Shell** ⭐ **RECOMMENDED FOR DEMOS**
   - Setup time: 5-10 minutes
   - Cost: $0 (Always Free tier)
   - Perfect for: Presentations, live demos, learning
   - See: [`DEPLOYMENT_GUIDE.md`](DEPLOYMENT_GUIDE.md) for full comparison

2. **VM + Docker/Podman** (Alternative)
   - Setup time: 30-60 minutes
   - Cost: ~$50-100/month
   - Perfect for: DevOps demos, infrastructure talks
   - See: [`DEPLOYMENT_GUIDE.md`](DEPLOYMENT_GUIDE.md) for details

📖 **Read [`DEPLOYMENT_GUIDE.md`](DEPLOYMENT_GUIDE.md) for a comprehensive architecture comparison, cost analysis, and detailed setup instructions.**

### Prerequisites

- Oracle Database with APEX installed
- APEX Workspace created
- Database user with APEX development privileges
- SQLcl or SQL*Plus

### Installation (5 minutes)

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/apex-without-builder.git
   cd apex-without-builder
   ```

2. **Update configuration**
   Edit `04-apex-app.sql` and replace:
   - `YOUR_WORKSPACE` with your APEX workspace name
   - `YOUR_SCHEMA` with your database schema

3. **Deploy the application**
   ```bash
   sql username/password@database
   @00-deploy-all.sql
   ```

4. **Access your application**
   ```
   https://your-apex-url/ords/r/conf_tracker/dashboard
   ```

That's it! 🎉

## 📁 Repository Structure

```
apex-without-builder/
│
├── 00-deploy-all.sql           # Master deployment script
├── 01-schema.sql               # Database tables and constraints
├── 02-supporting-objects.sql   # PL/SQL packages, triggers, views
├── 03-sample-data.sql          # Test data (speakers, sessions, etc.)
├── 04-apex-app.sql             # APEX application (API-generated)
├── 05-ratings-feature.sql      # Additional feature (live demo)
│
├── docs/
│   ├── PROMPTS.md              # AI prompts used to generate code
│   ├── ARCHITECTURE.md         # Technical architecture
│   ├── DEMO_SCRIPT.md          # Conference presentation guide
│   └── DEPLOYMENT_GUIDE.md     # Setup: ADB vs VM comparison
│
├── deployment/
│   ├── Containerfile           # Podman/Docker setup
│   └── setup.sh                # Automated environment setup
│
└── README.md                   # This file
```

## 🎭 Live Demo Flow

### For Conference Presentations

**Setup (Pre-demo)**
1. Have database ready with APEX
2. Git repo initialized
3. Terminal, AI chat, and browser visible
4. APEX Builder **deliberately not open**

**Part 1: Initial Build (30 min)**
1. Describe requirements to AI
2. AI generates schema SQL
3. Execute → tables created
4. AI generates APEX app SQL
5. Execute → app deployed
6. Access running app
7. Demonstrate features

**Part 2: The Reveal (5 min)**
1. Open APEX Builder for **first time**
2. Show app exists with all components
3. Prove Builder was never used

**Part 3: Live Feature Add (10 min)**
1. Request new feature (ratings)
2. AI generates code in real-time
3. Execute → feature added
4. Refresh app → new feature works
5. Commit to Git

**Part 4: Discussion (10 min)**
- Q&A on approach
- Limitations and realities
- When to use vs. traditional Builder
- Future of AI-assisted development

## 🤖 How AI Was Used

### The AI Prompts

Every SQL script in this repo was generated by AI. See [`docs/PROMPTS.md`](docs/PROMPTS.md) for the exact prompts used.

**Example Initial Prompt:**
> "Create a complete Oracle database schema for a conference session management system with speakers, rooms, sessions, and attendees. Include conflict detection for double-booked rooms and validation for speaker schedules. Generate professional-quality SQL with comments."

### What AI Generated

- ✅ Database DDL (tables, constraints, indexes)
- ✅ PL/SQL packages with business logic
- ✅ Triggers for validation
- ✅ Views for reporting
- ✅ Complete APEX application using wwv_flow_api
- ✅ Sample data
- ✅ Deployment scripts

### What Required Human Input

- 🧑 Requirements definition
- 🧑 Code review and testing
- 🧑 Workspace/schema configuration
- 🧑 Architecture decisions
- 🧑 Deployment orchestration

## 🎓 Key Learnings

### ✅ What Works Well

1. **Speed** - Generated complete app in minutes vs. days
2. **Quality** - Code follows Oracle best practices
3. **Consistency** - Uniform naming, structure, comments
4. **Documentation** - Self-documenting code
5. **Version Control** - Everything in Git from day one
6. **Reproducibility** - Perfect for CI/CD pipelines

### ⚠️ Limitations

1. **Complex UX** - Builder better for pixel-perfect layouts
2. **Dynamic Actions** - Some interactions easier visually
3. **Debugging** - Builder tools helpful for troubleshooting
4. **Learning Curve** - Need APEX API knowledge
5. **AI Accuracy** - Still requires validation and testing
6. **Iteration** - Some things faster with point-and-click

### 🤔 When to Use This Approach

**Great For:**
- CRUD applications with standard patterns
- Forms over data with validation
- Report-heavy applications
- API/backend-focused apps
- Teams wanting version control
- DevOps/CI-CD workflows
- Rapid prototyping
- Learning APEX internals

**Not Ideal For:**
- Complex custom UX/UI
- Heavy JavaScript interactions
- Apps requiring Builder plugins
- When team prefers visual development
- One-off prototypes

## 🔮 Future Possibilities

**Short Term:**
- AI that generates Builder-quality UX
- Hybrid approach (AI + Builder)
- AI-powered code review
- Automated testing generation

**Long Term:**
- Natural language → deployed app
- AI understanding business context
- Self-healing applications
- Conversational development

## 📚 Additional Resources

### Documentation
- [Oracle APEX API Reference](https://docs.oracle.com/en/database/oracle/apex/)
- [APEX Installation Guide](https://docs.oracle.com/en/database/oracle/apex/latest/htmig/)
- [SQLcl Documentation](https://docs.oracle.com/en/database/oracle/sql-developer-command-line/)

### Community
- [Oracle APEX Forum](https://community.oracle.com/hub/modev/database/apex)
- [APEX.world](https://apex.world)
- [APEX Office Hours](https://www.thatjeffsmith.com/office-hours/)

### Related Projects
- [APEX Export/Import Utilities](https://github.com/OraOpenSource/apex-export-import)
- [APEX CI/CD Examples](https://github.com/OraOpenSource/apex-ci-cd)

## 👥 Contributing

This is a demonstration project, but contributions are welcome!

**Ways to Contribute:**
- 🐛 Report issues or bugs
- 💡 Suggest improvements
- 📝 Improve documentation
- 🔧 Submit pull requests
- 🗣️ Share your experience using this approach

## 📜 License

MIT License - feel free to use this code for learning, presentations, or as a starting point for your own projects.

## 🙏 Acknowledgments

- **Anthropic** for Claude AI
- **Oracle** for APEX and Database
- **APEX Community** for inspiration and knowledge
- **Conference Attendees** for engaging with these ideas

## ✉️ Contact

**Questions? Feedback? Want to discuss AI-driven development?**

- Open an issue on GitHub
- Reach out on Twitter/X: [@yourhandle]
- Email: your.email@example.com

---

## 🎤 About the Presentation

This repository accompanies the conference session:

**"Building APEX Without the Builder: An AI-Driven Development Experiment"**

**Abstract:**
Can you build and deploy a production-ready APEX business application without ever opening the APEX Builder? Not only is it possible—it's happening right now. This provocative session challenges conventional development workflows and explores what happens when we combine AI-assisted coding with Oracle's proven technology stack. Attendees will witness firsthand how generative AI and modern tooling can complement existing workflows, lower barriers to entry, and potentially open new pathways for Oracle development.

**Key Takeaways:**
- Real-world application of AI in code-first APEX development
- Practical integration of AI with Oracle 26ai and APEX
- Modern DevOps practices for APEX deployments
- New perspectives on accessibility for non-traditional APEX developers

---

**⭐ If this project helped you or sparked ideas, please star the repo!**

---

*Generated with assistance from Claude AI | Built without opening APEX Builder | Deployed in minutes*
