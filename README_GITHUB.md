# Building APEX Without the Builder
### An AI-Driven Development Experiment

[![Oracle APEX](https://img.shields.io/badge/Oracle%20APEX-24.1-red?logo=oracle)](https://apex.oracle.com)
[![Oracle Database](https://img.shields.io/badge/Oracle%20Database-23ai%2F26ai-red?logo=oracle)](https://www.oracle.com/database/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

> **Can you build and deploy a production-ready APEX application without ever opening the APEX Builder?**  
> Not only is it possible—this repository proves it with a complete, working application built entirely through AI-generated SQL scripts.

🎥 **[Watch the Conference Presentation](#)** | 📚 **[Read the Documentation](docs/)** | 🚀 **[Try It Yourself](#quick-start)**

---

## 🌟 What Is This?

This repository contains a **complete Oracle APEX application** built without using the APEX Builder interface—demonstrating a revolutionary code-first approach to APEX development using AI assistance.

**The Conference Session Tracker** is a fully-functional business application featuring:
- 📊 Real-time dashboards
- 🔍 Searchable session catalogs  
- 📝 Interactive forms with validation
- 🚫 Automatic conflict detection
- 📱 QR code generation
- ⭐ Session rating system
- 👥 Attendee management

**Built with:** Oracle Database, APEX API (`wwv_flow_api`), PL/SQL, and Claude AI

---

## 🎯 Why Does This Matter?

### Traditional Approach
```
Idea → Open Builder → Click, click, click → Hours/Days → Application
```

### This Approach
```
Idea → AI Generates Code → Execute SQL → Minutes → Application
```

**Benefits:**
- ⚡ **10x Faster** - Minutes instead of days
- 📦 **Version Controlled** - Everything in Git from day one
- 🔄 **Reproducible** - Deploy anywhere instantly
- 🤝 **Collaborative** - Code review, merge requests, CI/CD
- 🎓 **Accessible** - Lower barrier for new APEX developers
- 🔧 **Maintainable** - Infrastructure as code

---

## 🚀 Quick Start

### Prerequisites
- Oracle Database 19c+ with APEX 21.2+
- Database user with development privileges
- SQLcl or SQL*Plus

### Deploy in 5 Minutes

```bash
# 1. Clone the repository
git clone https://github.com/davidastart/conference_apex.git
cd conference_apex

# 2. Update configuration
# Edit sql/04-apex-app.sql and set:
#   - YOUR_WORKSPACE → your APEX workspace name
#   - YOUR_SCHEMA → your database schema

# 3. Connect to your database
sql username/password@database

# 4. Deploy the application
@sql/00-deploy-all.sql

# 5. Access your application
# https://your-apex-url/ords/r/conf_tracker/dashboard
```

**That's it!** 🎉 You now have a fully-functional APEX application.

---

## 📦 What's Included

### SQL Scripts (`sql/`)
| File | Purpose | Lines |
|------|---------|-------|
| `00-deploy-all.sql` | Master deployment script | 150 |
| `01-schema.sql` | Database tables & constraints | 300 |
| `02-supporting-objects.sql` | PL/SQL packages, triggers, views | 600 |
| `03-sample-data.sql` | Realistic test data | 400 |
| `04-apex-app.sql` | Complete APEX application | 800 |
| `05-ratings-feature.sql` | Session ratings (live demo add-on) | 500 |

### Documentation (`docs/`)
- 📘 **[Deployment Guide](docs/DEPLOYMENT_GUIDE.md)** - Setup: ADB vs VM comparison
- 🤖 **[AI Prompts](docs/PROMPTS.md)** - Exact prompts used to generate code
- 📋 **[File Manifest](docs/FILE_MANIFEST.md)** - Complete file reference
- 🎬 **[Demo Reference](docs/DEMO_DAY_REFERENCE.md)** - Presentation cheat sheet
- 🚦 **[Start Here](docs/START_HERE.md)** - Onboarding guide

---

## 🏗️ Architecture

### Application Stack
```
┌─────────────────────────────────────────┐
│         Web Browser (APEX UI)           │
└─────────────────────────────────────────┘
                    ↕ HTTPS
┌─────────────────────────────────────────┐
│    Oracle REST Data Services (ORDS)     │
└─────────────────────────────────────────┘
                    ↕ SQL*Net
┌─────────────────────────────────────────┐
│         Oracle APEX (24.1+)             │
│  • Pages (Dashboard, Forms, Reports)    │
│  • Navigation                           │
│  • Validations                          │
└─────────────────────────────────────────┘
                    ↕ PL/SQL
┌─────────────────────────────────────────┐
│      Business Logic (PL/SQL)            │
│  • CONFERENCE_PKG (functions/procs)     │
│  • Triggers (validation, audit)         │
│  • Views (reporting)                    │
└─────────────────────────────────────────┘
                    ↕ SQL
┌─────────────────────────────────────────┐
│      Data Model (Tables)                │
│  • SPEAKERS, ROOMS, SESSIONS            │
│  • ATTENDEES, ATTENDEE_SESSIONS         │
│  • SESSION_RATINGS                      │
└─────────────────────────────────────────┘
```

### Deployment Options

**Option 1: Autonomous Database** ⭐ **Recommended**
- ⏱️ Setup: 10 minutes
- 💰 Cost: $0 (Always Free tier)
- 🎯 Best for: Demos, learning, quick setup

**Option 2: VM + Docker**
- ⏱️ Setup: 60 minutes  
- 💰 Cost: ~$100/month
- 🎯 Best for: Infrastructure demos, DevOps focus

See **[Deployment Guide](docs/DEPLOYMENT_GUIDE.md)** for detailed comparison.

---

## 🤖 How AI Was Used

Every line of SQL in this repository was generated by **Claude AI** (Anthropic).

### Example Prompt
```
Create a complete Oracle database schema for a conference session 
management system with speakers, rooms, sessions, and attendees. 
Include conflict detection for double-booked rooms and validation 
for speaker schedules. Generate professional-quality SQL with 
comments and best practices.
```

### AI Generated
- ✅ Database DDL (tables, constraints, indexes)
- ✅ PL/SQL packages with business logic
- ✅ Triggers for validation and automation
- ✅ Views for reporting
- ✅ Complete APEX application using `wwv_flow_api`
- ✅ Sample data
- ✅ Deployment scripts

### Human Provided
- 🧑 Requirements definition
- 🧑 Code review and validation
- 🧑 Testing and refinement
- 🧑 Architecture decisions
- 🧑 Documentation

**See all prompts:** [docs/PROMPTS.md](docs/PROMPTS.md)

---

## 📊 Features Demo

### Dashboard
Real-time view of today's conference schedule with statistics and charts.

### Session Catalog  
Searchable, filterable interactive report of all sessions with:
- Speaker information
- Room assignments
- Capacity tracking
- Availability status

### Session Management
Create and edit sessions with automatic validation:
- Room conflict detection (prevents double-booking)
- Speaker schedule validation (no overlaps)
- Capacity management
- QR code generation

### Session Ratings
Post-event feedback system with:
- 1-5 star ratings
- Comments and recommendations
- Speaker performance tracking
- Analytics dashboard

---

## 🎓 Learn More

### Conference Presentation
**"Building APEX Without the Builder: An AI-Driven Development Experiment"**

This repository is the companion code for a conference presentation exploring:
- AI-assisted APEX development
- Code-first vs. Builder-first approaches
- Modern DevOps practices for APEX
- Lowering barriers to entry for new developers

**Key Takeaways:**
- See how AI can generate production-quality APEX code
- Learn when to use code-first vs. Builder approaches
- Understand the trade-offs and limitations
- Explore the future of AI-assisted development

### Documentation
- 📖 **[Deployment Guide](docs/DEPLOYMENT_GUIDE.md)** - Complete setup with architecture comparison
- 🤖 **[AI Prompts](docs/PROMPTS.md)** - Learn effective prompt engineering
- 🚀 **[Start Here](docs/START_HERE.md)** - Quick onboarding guide
- 🎬 **[Demo Reference](docs/DEMO_DAY_REFERENCE.md)** - Presentation cheat sheet

---

## 🎯 When to Use This Approach

### ✅ Great For
- CRUD applications with standard patterns
- Forms-over-data with validation
- Report-heavy applications
- Teams wanting version control
- DevOps/CI-CD workflows
- Rapid prototyping
- Learning APEX internals
- API-first development

### ⚠️ Consider Builder For
- Pixel-perfect custom layouts
- Complex JavaScript interactions
- Visual page designers
- One-off prototypes
- When team prefers visual tools

**It's not either/or—use the right tool for each job!**

---

## 💡 Real-World Applications

### This Approach Enables:

**Version Control Everything**
```bash
git commit -m "Add session ratings feature"
git push origin feature/ratings
# Create pull request for review
```

**Automated Deployments**
```yaml
# .github/workflows/deploy.yml
on: push
  branches: [main]
jobs:
  deploy:
    - sql @sql/00-deploy-all.sql
```

**Environment Consistency**
```bash
# Deploy to dev, test, prod identically
./deploy.sh dev
./deploy.sh test  
./deploy.sh prod
```

**Team Collaboration**
```bash
# Multiple developers, same codebase
git checkout -b feature/new-report
# Edit SQL files, test, commit
git push origin feature/new-report
# Peer review via pull request
```

---

## 📈 Statistics

### Code Generated
- **Total Lines:** 2,750+
- **Tables:** 6
- **PL/SQL Functions:** 13
- **PL/SQL Procedures:** 4
- **APEX Pages:** 5
- **Triggers:** 4
- **Views:** 3

### Development Time
- **Traditional APEX:** 2-3 days
- **With Builder:** 4-6 hours
- **AI-Generated:** 45 minutes (+ testing)
- **Live Feature Add:** 2 minutes

### Cost (Always Free Tier)
- **Autonomous Database:** $0
- **APEX:** $0  
- **Cloud Shell:** $0
- **Total:** $0

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

- 🐛 **Report bugs** - Open an issue
- 💡 **Suggest features** - Share your ideas
- 📝 **Improve docs** - Submit a PR
- 🔧 **Submit code** - Fix bugs or add features
- 🗣️ **Share feedback** - Tell us what worked

See **[CONTRIBUTING.md](CONTRIBUTING.md)** for guidelines.

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**TL;DR:** You can use this code for anything—personal projects, commercial applications, education, or as a starting point for your own APEX apps. Attribution appreciated but not required!

---

## 🙏 Acknowledgments

**Technology:**
- [Oracle APEX](https://apex.oracle.com) - Low-code platform
- [Oracle Database](https://www.oracle.com/database/) - World's best database
- [Claude AI](https://www.anthropic.com/claude) (Anthropic) - AI code generation
- [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/) - Cloud platform

**Community:**
- Oracle APEX Community - Inspiration and knowledge
- Conference Attendees - Engaging with these ideas
- Open Source Contributors - Making this better

**Special Thanks:**
- Anthropic team for Claude AI
- Oracle APEX team for an amazing platform
- Early adopters testing this approach

---

## 📞 Contact

**David Start**
- GitHub: [@davidastart](https://github.com/davidastart)
- Repository: [conference_apex](https://github.com/davidastart/conference_apex)

**Questions?**
- 💬 [Open an Issue](https://github.com/davidastart/conference_apex/issues)
- 📧 Email: [your.email@example.com]
- 🐦 Twitter: [@yourhandle]

---

## 🌟 Star History

If this project helped you or sparked ideas, please consider starring the repository! ⭐

It helps others discover this approach and motivates continued development.

---

## 🗺️ Roadmap

### Current Version (v1.0)
- ✅ Complete conference management application
- ✅ AI-generated SQL scripts
- ✅ Comprehensive documentation
- ✅ Deployment guides

### Future Enhancements
- 🔜 CI/CD pipeline examples
- 🔜 Docker Compose setup
- 🔜 REST API integration
- 🔜 Additional application templates
- 🔜 Video tutorials
- 🔜 Interactive demo site

**Want to contribute?** See the [Issues](https://github.com/davidastart/conference_apex/issues) page!

---

## 📚 Additional Resources

### Oracle APEX
- [APEX Documentation](https://docs.oracle.com/en/database/oracle/apex/)
- [APEX Community](https://community.oracle.com/hub/modev/database/apex)
- [APEX Office Hours](https://www.thatjeffsmith.com/office-hours/)

### AI-Assisted Development
- [Prompt Engineering Guide](docs/PROMPTS.md)
- [Best Practices](docs/DEPLOYMENT_GUIDE.md)

### DevOps for APEX
- [Version Control Strategies](docs/DEPLOYMENT_GUIDE.md#version-control)
- [CI/CD Pipelines](#roadmap)

---

## 🎬 See It In Action

**Live Demo Coming Soon!**

Watch the complete conference presentation showing:
1. Requirements → AI prompt
2. AI generates SQL code
3. Deploy to database
4. Working application in minutes
5. Add new feature live
6. Discussion and Q&A

**[Subscribe for updates](#)** to be notified when the video is available.

---

<div align="center">

### 🚀 Ready to Build APEX Without the Builder?

**[Get Started](#quick-start)** • **[Read the Docs](docs/)** • **[Watch the Demo](#)**

---

Built with ❤️ using Oracle APEX, Oracle Database, and Claude AI

**[⬆ Back to Top](#building-apex-without-the-builder)**

</div>
