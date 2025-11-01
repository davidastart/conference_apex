# Contributing to Building APEX Without the Builder

First off, thank you for considering contributing to this project! 🎉

This project demonstrates AI-driven APEX development, and we welcome contributions that help expand, improve, or clarify this approach.

## 🤝 How to Contribute

### Types of Contributions

We welcome many types of contributions:

- 🐛 **Bug Reports** - Found an issue? Let us know!
- 💡 **Feature Suggestions** - Have an idea for improvement?
- 📝 **Documentation** - Help make the docs clearer
- 🔧 **Code Contributions** - Fix bugs or add features
- 🧪 **Testing** - Try it out and share your experience
- 📊 **Examples** - Share how you've used this approach
- 🎓 **Tutorials** - Create guides or videos

### Getting Started

1. **Fork the repository**
   ```bash
   # Click the "Fork" button on GitHub
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/conference_apex.git
   cd conference_apex
   ```

3. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

4. **Make your changes**
   - Write code
   - Update documentation
   - Add tests if applicable

5. **Commit your changes**
   ```bash
   git add .
   git commit -m "Description of your changes"
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create a Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Describe your changes

## 📋 Contribution Guidelines

### Code Style

**SQL Scripts:**
- Use consistent indentation (4 spaces)
- Include comments explaining complex logic
- Follow Oracle naming conventions
- Keep line length reasonable (< 120 characters)
- Add headers to files explaining purpose

**Documentation:**
- Write in clear, concise English
- Use markdown formatting
- Include code examples where helpful
- Add screenshots for UI-related docs

**Commit Messages:**
- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit first line to 72 characters
- Reference issues/PRs when applicable

Example:
```
Add session capacity validation

- Check attendee count against max_attendees
- Display warning when session is nearly full
- Prevent registration when at capacity

Fixes #123
```

### Testing

Before submitting a pull request:

1. **Test your SQL scripts**
   ```sql
   -- Deploy to a test database
   @sql/00-deploy-all.sql
   
   -- Verify tables exist
   SELECT table_name FROM user_tables;
   
   -- Test application functionality
   ```

2. **Verify documentation**
   - Check all links work
   - Ensure code examples are accurate
   - Spell check your changes

3. **Check for sensitive data**
   - No passwords or connection strings
   - No wallet files
   - No production data

### Pull Request Process

1. **Update documentation** if needed
   - README.md for user-facing changes
   - DEPLOYMENT_GUIDE.md for setup changes
   - Add comments to code

2. **Add to CHANGELOG** (if we have one)
   - What changed?
   - Why did it change?
   - Who might be affected?

3. **Request review**
   - Tag relevant maintainers
   - Be patient (we're volunteers!)
   - Be responsive to feedback

4. **After approval**
   - Squash commits if requested
   - Ensure CI/CD passes (if configured)
   - Maintainers will merge

## 🐛 Reporting Bugs

### Before Submitting

1. **Check existing issues** - Bug may already be reported
2. **Test with latest version** - May already be fixed
3. **Verify it's reproducible** - Can you make it happen again?

### Submitting a Bug Report

Create an issue with:

**Title:** Short, descriptive summary

**Environment:**
- Oracle Database version
- APEX version
- Operating system
- Browser (if UI-related)

**Description:**
- What you expected to happen
- What actually happened
- Steps to reproduce

**Code/Screenshots:**
- SQL that causes the error
- Error messages
- Screenshots if relevant

**Example:**
```markdown
## Bug: Session form fails to save

### Environment
- Oracle Database 19c
- APEX 24.1
- macOS Sonoma
- Chrome 120

### Description
When creating a new session, clicking Save shows error:
"ORA-02291: integrity constraint violated"

### Steps to Reproduce
1. Navigate to Session Form (Page 20)
2. Fill in all required fields
3. Click Save button
4. Error appears

### Expected Behavior
Session should save and redirect to catalog

### Actual Behavior
Error message displayed, no session created

### Screenshot
[Attach screenshot of error]
```

## 💡 Suggesting Features

We love feature ideas! Before suggesting:

1. **Check existing issues** - May already be planned
2. **Consider scope** - Does it fit the project goals?
3. **Think about implementation** - How might it work?

### Feature Request Template

**Title:** Brief description of feature

**Problem:** What problem does this solve?

**Proposed Solution:** How should it work?

**Alternatives:** Other ways to solve this?

**Additional Context:** Anything else relevant?

**Example:**
```markdown
## Feature: Export session schedule to calendar

### Problem
Attendees want to add sessions to their personal calendars

### Proposed Solution
Add "Export to Calendar" button that generates:
- iCal/ICS file
- Google Calendar link
- Outlook link

### Implementation Ideas
- Use PL/SQL to generate ICS format
- Add download link to session details page
- Include QR code that links to ICS

### Alternatives
- Email schedule to attendee
- Integrate with external calendar APIs

### Additional Context
Common feature in conference apps
Would improve attendee experience
```

## 📝 Documentation Contributions

Documentation is super important! You can help by:

### Improving Existing Docs
- Fix typos or grammar
- Clarify confusing sections
- Add missing information
- Update outdated content

### Adding New Docs
- Tutorial for specific use case
- Video walkthrough
- Troubleshooting guide
- Example applications

### Documentation Structure
```
docs/
├── DEPLOYMENT_GUIDE.md    # Setup and deployment
├── PROMPTS.md             # AI prompt examples
├── FILE_MANIFEST.md       # File reference
├── START_HERE.md          # Getting started
└── DEMO_DAY_REFERENCE.md  # Presentation guide
```

## 🧪 Testing Contributions

Help us test by:

1. **Trying different environments**
   - Various database versions
   - Different APEX versions
   - Multiple browsers
   - Different operating systems

2. **Reporting results**
   - What worked?
   - What didn't work?
   - Any warnings or errors?

3. **Performance testing**
   - Large datasets
   - Many concurrent users
   - Complex queries

## 🎓 Educational Contributions

Share your knowledge:

- **Blog posts** about using this approach
- **Videos** showing deployment
- **Conference talks** based on this work
- **Case studies** from real projects
- **Lessons learned** from using it

Let us know and we'll link to your content!

## ⚖️ Code of Conduct

### Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone, regardless of:
- Age
- Body size
- Disability
- Ethnicity
- Gender identity and expression
- Level of experience
- Nationality
- Personal appearance
- Race
- Religion
- Sexual identity and orientation

### Our Standards

**Positive behavior:**
- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what's best for the community
- Showing empathy towards other community members

**Unacceptable behavior:**
- Trolling, insulting/derogatory comments, personal attacks
- Public or private harassment
- Publishing others' private information
- Other conduct which could reasonably be considered inappropriate

### Enforcement

Instances of unacceptable behavior may be reported by contacting the project team. All complaints will be reviewed and investigated promptly and fairly.

## 📞 Questions?

- 💬 **GitHub Issues** - For bug reports and features
- 📧 **Email** - For private inquiries
- 🐦 **Twitter** - For general discussion

## 🙏 Recognition

All contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Appreciated by the community! ❤️

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for helping make APEX development more accessible and innovative!** 🚀

*Remember: Every expert was once a beginner. Your contribution, no matter how small, makes a difference.*
