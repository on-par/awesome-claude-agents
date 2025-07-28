# TDD Agents

This folder contains a suite of specialized agents designed to automate and streamline the Test-Driven Development (TDD) workflow using Claude Code. Each agent focuses on a specific phase of the TDD cycle, ensuring a disciplined, repeatable process for building high-quality software.

## Agents Overview

- **tdd-orchestrator**: Coordinates the entire TDD cycle and manages git workflow.
- **tdd-red**: Writes failing tests that define new features or behaviors.
- **tdd-green**: Implements the minimal code needed to make failing tests pass.
- **tdd-refactor**: Cleans up and improves code quality while keeping all tests green.
- **tdd-git**: Handles all git operations (branching, commits, etc.) for each TDD phase.

## How to Use with Claude Code

1. **Start with tdd-orchestrator**  
    Describe your feature or task. The orchestrator will guide the process, invoking the right agent at each step.

2. **Red Phase**  
    The tdd-red agent writes failing tests for your new feature.

3. **Green Phase**  
    The tdd-green agent implements the minimal code to pass those tests.

4. **Refactor Phase**  
    The tdd-refactor agent improves the code without changing behavior.

5. **Git Management**  
    All git operations are handled by tdd-git, coordinated by the orchestrator.

## Example Workflows

**Example 1: Adding a Login Feature**
```
User: I want to add login functionality that validates email and password.
Claude: I'll use the tdd-orchestrator agent to manage this. First, tdd-red will write failing tests for login. Then, tdd-green will implement the minimal code to pass them. Finally, tdd-refactor will clean up the code, and tdd-git will handle all commits.
```

**Example 2: Building a Calculator**
```
User: Please add a multiply function to my calculator class.
Claude: Starting a new TDD cycle. tdd-red writes failing tests for multiply, tdd-green implements the minimal code, tdd-refactor cleans up, and tdd-git manages the git workflow.
```

## Tips

- Always let the orchestrator manage the process.
- Each agent has a focused responsibility—don’t mix their roles.
- All git operations are automated; no manual git commands needed.

---

For more details, see the individual agent markdown files in this folder.