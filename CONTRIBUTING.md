# Contributing to Awesome Claude Agents

Thank you for your interest in contributing! This repository is a community-driven collection of Claude Code agents that help automate development workflows.

## How to Contribute

### 1. Fork and Clone

1. Fork this repository to your GitHub account
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/awesome-claude-agents.git
   cd awesome-claude-agents
   ```

### 2. Create a Branch

Create a new branch for your contribution:
```bash
git checkout -b add-my-agent-name
```

### 3. Add Your Agent

#### Agent File Requirements

- **Location**: Place your agent in the appropriate category folder (e.g., `tdd-suite/`, `code-review/`)
- **Naming**: Use lowercase, hyphenated filenames ending in `.md` (e.g., `my-cool-agent.md`)
- **Format**: Follow the standard agent format with proper frontmatter

#### Agent File Format

```markdown
---
name: my-agent-name
description: Brief description of what this agent does
color: blue
---

Your agent content here following Claude Code agent standards.
Include clear instructions, examples, and usage guidelines.
```

#### Quality Standards

Before submitting, ensure your agent:

- **Works with Claude Code**: Test your agent with Claude Code CLI to verify it functions correctly
- **Is specific**: Avoid generic agents - focus on a particular task or workflow
- **Has clear documentation**: Include usage examples and clear instructions
- **Follows naming conventions**: Use descriptive, lowercase, hyphenated filenames
- **Is well-organized**: Place in the correct category folder

### 4. Update Documentation

If you're adding a new category or significant functionality:

1. Update the main `README.md` if needed
2. Update the `agents.json` manifest file
3. Add your agent to the appropriate category documentation

### 5. Test Your Changes

1. **Test the agent**: Use it with Claude Code to ensure it works as expected
2. **Check the install script**: If you modified paths, test the installation process
3. **Verify documentation**: Ensure any documentation changes are accurate

### 6. Submit a Pull Request

1. Commit your changes with a clear message:
   ```bash
   git add .
   git commit -m "Add [agent-name] for [specific-purpose]"
   git push origin add-my-agent-name
   ```

2. Create a pull request with:
   - **Clear title**: "Add [agent-name] for [purpose]"
   - **Description**: Explain what the agent does and why it's useful
   - **Testing notes**: How you tested the agent
   - **Category**: Which category it belongs to

## Types of Contributions

### New Agents
- Development workflow automation
- Code quality and review tools
- Testing and deployment helpers
- Documentation generators
- Git workflow assistants

### Improvements
- Bug fixes to existing agents
- Documentation improvements
- Installation script enhancements
- New categories or organization improvements

### Not Accepted
- Agents that require external services without clear documentation
- Overly generic or duplicate functionality
- Agents that don't follow Claude Code standards
- Low-quality or untested submissions

## Agent Categories

Current categories include:
- **tdd-suite**: Test-Driven Development workflow agents
- **code-review**: Code review and quality analysis
- **git-workflow**: Git and version control helpers
- **documentation**: Documentation generation and maintenance

Propose new categories if your agent doesn't fit existing ones.

## Review Process

1. **Automated checks**: Basic validation of file format and structure
2. **Maintainer review**: Manual review for quality and usefulness
3. **Testing**: Verification that agents work with Claude Code
4. **Feedback**: We may request changes or improvements
5. **Merge**: Approved contributions are merged and become available

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). Please be respectful and inclusive in all interactions.

## Questions?

- **Issues**: Use GitHub issues for bug reports or feature requests
- **Discussions**: Use GitHub discussions for questions about contributing
- **Documentation**: Check the README and existing agents for examples

## License

By contributing, you agree that your contributions will be licensed under the MIT License.