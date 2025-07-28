# 🤖 Awesome Claude Agents

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

A curated collection of Claude Code agents, prompts, and configurations to supercharge your development workflow. This repository provides ready-to-use agents for Test-Driven Development, code review, refactoring, and more.

> 💡 **What are Claude Agents?** Specialized AI assistants that handle specific development tasks with focused expertise, from writing tests to managing git workflows.

## ✨ Features

- 🔄 **Test-Driven Development Suite** - Complete TDD workflow automation
- 🛠️ **Specialized Agents** - Each agent focuses on one task exceptionally well
- 🔗 **Seamless Integration** - Works with Claude Code's agent system
- 📚 **Well-Documented** - Clear examples and usage instructions
- 🚀 **Production-Ready** - Battle-tested in real development workflows

## 📋 Agent Directory

#### Directory Structure

Agents are organized by category in subfolders, each with its own README for details and usage examples.

```
/
├── tdd-suite/           # Test-Driven Development agents
│   └── README.md
├── code-review/         # Code review and analysis agents
│   └── README.md
├── refactoring/         # Refactoring and code quality agents
│   └── README.md
├── git-workflow/        # Git and version control agents
│   └── README.md
└── ...
```

- **Browse each folder** for agent descriptions, setup, and usage.
- **See each README** for best practices and integration tips.
- **Choose agents** based on your workflow needs—combine them as needed!

> 💡 **Tip:** Start with the `tdd-suite` for end-to-end TDD automation, or explore other folders for specialized tasks.

A complete TDD workflow system with specialized agents for each phase:

| Agent | Purpose | Phase | Description |
|-------|---------|-------|-------------|
| **tdd-orchestrator** | Coordination | All | Manages the complete TDD cycle and agent coordination |
| **tdd-red** | Test Writing | Red | Writes failing tests that define expected behavior |
| **tdd-green** | Implementation | Green | Implements minimal code to make tests pass |
| **tdd-refactor** | Code Quality | Refactor | Improves code structure while maintaining test coverage |
| **tdd-git** | Version Control | All | Handles all git operations with proper TDD commit messages |

### 🎯 How the TDD Suite Works

1. **tdd-orchestrator** creates a feature branch via **tdd-git**
2. **tdd-red** writes failing tests
3. **tdd-git** commits the red phase
4. **tdd-green** implements minimal code to pass tests
5. **tdd-git** commits the green phase
6. **tdd-refactor** improves code quality
7. **tdd-git** commits the refactor phase
8. Repeat until feature is complete

> 💡 **Pro Tip**: Use `tdd-orchestrator` to automatically coordinate the entire TDD workflow, or use individual agents for specific phases.

## 🚀 Quick Start

### Prerequisites
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed
- Git repository for your project

### Installation

1. **Copy agents to your project:**
   ```bash
   # Copy the entire .claude/agents directory to your project
   cp -r .claude/agents /path/to/your/project/.claude/
   ```

2. **Use individual agents:**
   ```bash
   # For complete TDD workflow
   claude "Use the tdd-orchestrator to implement user authentication"
   
   # For specific phases
   claude "Use tdd-red to write tests for the login function"
   claude "Use tdd-green to implement the login function"
   claude "Use tdd-refactor to clean up the login code"
   ```

3. **Verify installation:**
   ```bash
   claude "/agents" # Should show your installed agents
   ```

## 📖 Usage Examples

### Complete TDD Workflow
```bash
# Let the orchestrator handle everything
claude "I need to implement a shopping cart with add, remove, and total calculation methods using TDD"
```

### Manual TDD Phases
```bash
# Write failing tests first
claude "Use tdd-red to create tests for a password validation function"

# Implement minimal code
claude "Use tdd-green to make the password validation tests pass"

# Refactor for quality
claude "Use tdd-refactor to improve the password validation code"
```

## 📝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

- 🐛 **Bug Reports**: Found an issue? [Open an issue](../../issues)
- 💡 **Feature Requests**: Have an idea? [Start a discussion](../../discussions)
- 🔧 **Pull Requests**: Ready to contribute? [Submit a PR](../../pulls)

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- Inspired by [awesome-copilot](https://github.com/github/awesome-copilot)
- Built for the [Claude Code](https://claude.ai/code) community
- Maintained by [On PAR Dev](https://github.com/on-par-dev)

---

<div align="center">
  <sub>⭐ Star this repo if it helped you! ⭐</sub>
</div>