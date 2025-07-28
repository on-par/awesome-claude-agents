# Awesome Claude Agents

A collection of Claude Code agents designed to automate software development workflows. Currently focused on Test-Driven Development automation with plans to expand into other areas.

## What's Included

This repository contains specialized agents that integrate with Claude Code's agent system. Each agent handles a specific development task, allowing you to build more complex workflows by combining them.

### Current Agent Categories

**TDD Suite** (`tdd-suite/`)
A complete set of agents for automating Test-Driven Development workflows:

- `tdd-orchestrator` - Coordinates the full TDD cycle
- `tdd-red` - Writes failing tests 
- `tdd-green` - Implements minimal code to pass tests
- `tdd-refactor` - Improves code quality while maintaining test coverage
- `tdd-git` - Handles version control operations

## Getting Started

### Requirements

- Claude Code CLI installed
- Git repository for your project

### Installation

#### Quick Install (Recommended)

Install agents directly without cloning this repository:

```bash
# Install complete TDD suite
curl -sSL https://raw.githubusercontent.com/on-par-dev/awesome-claude-agents/main/install.sh | bash -s tdd-suite

# Install specific agents
curl -sSL https://raw.githubusercontent.com/on-par-dev/awesome-claude-agents/main/install.sh | bash -s tdd-orchestrator tdd-red
```

#### Manual Installation

For individual agents, you can download them directly:

```bash
# Create agents directory
mkdir -p .claude/agents

# Download specific agents
curl -o .claude/agents/tdd-orchestrator.md https://raw.githubusercontent.com/on-par-dev/awesome-claude-agents/main/tdd-suite/tdd-orchestrator.md
curl -o .claude/agents/tdd-red.md https://raw.githubusercontent.com/on-par-dev/awesome-claude-agents/main/tdd-suite/tdd-red.md
```

#### Local Installation

If you've cloned this repository:

```bash
# Copy all TDD agents
cp tdd-suite/*.md /path/to/your/project/.claude/agents/

# Or copy specific agents
cp tdd-suite/tdd-orchestrator.md /path/to/your/project/.claude/agents/
```

### Verify Installation

Check that agents are available:

```bash
# List installed agents
claude "/agents"

# Should show your installed agents like tdd-orchestrator, tdd-red, etc.
```

### Basic Usage

Once installed, reference agents in your Claude conversations:

```bash
# Use the orchestrator for complete TDD workflows
claude "Use tdd-orchestrator to implement user registration with email validation"

# Use individual agents for specific phases
claude "Use tdd-red to write tests for a password strength validator"
```

## TDD Workflow Example

The TDD suite follows the standard Red-Green-Refactor cycle:

1. **Red Phase**: `tdd-red` writes failing tests that define the expected behavior
2. **Green Phase**: `tdd-green` implements minimal code to make tests pass  
3. **Refactor Phase**: `tdd-refactor` improves code structure without changing behavior
4. **Git Operations**: `tdd-git` handles commits and branching throughout the process

The `tdd-orchestrator` manages this entire workflow automatically.

## Directory Structure

```
.
├── README.md
└── tdd-suite/
    ├── ReadMe.md              # Detailed TDD suite documentation
    ├── tdd-orchestrator.md    # Main workflow coordinator
    ├── tdd-red.md            # Test writing agent
    ├── tdd-green.md          # Implementation agent  
    ├── tdd-refactor.md       # Code quality agent
    └── tdd-git.md            # Git workflow agent
```

Each folder contains a detailed README explaining the agents and their usage patterns.

## Alternative Installation

If the install script doesn't work, you can manually download and place the agent files:

### Manual Download

1. **Create a `.claude/agents` folder in your project root** (same level as your `.git` folder)

2. **Download the agent files you want** and save them directly into your `.claude/agents` folder

3. **That's it!** Claude Code will automatically find any `.md` files in that folder and make them available as agents

Agent files must be placed in `.claude/agents/` in your project root for Claude Code to find them.

## Contributing

Contributions are welcome. If you have agents that would be useful to others:

1. Fork this repository
2. Add your agents in an appropriate category folder
3. Include clear documentation and usage examples
4. Submit a pull request

For bug reports or feature requests, please use the GitHub issue tracker.

## License

MIT License - see LICENSE file for details.

## Acknowledgments

Inspired by [awesome-copilot](https://github.com/github/awesome-copilot) and built for the Claude Code community.