# Global Claude Code Instructions

This file provides universal guidance for Claude Code across all projects.

## Documentation Structure

Claude should read documentation files in the following order for optimal understanding:

1. **convention.md** - Coding and naming conventions
2. **implementation.md** - Technology stack and tool references
3. **code_design.md** - Security, performance, and design best practices
4. **feature.md** - Feature development guidelines and patterns

### Global Documentation

- Global templates available in `/Users/fgalloway/.claude/doc/`
- Provides universal patterns and best practices
- Reference for new project setup

### Project-Specific Documentation

- Project-specific files located in `{project}/.claude/doc/`
- Overrides global templates with project-specific details
- Combines global and project documentation for complete context

## Universal Guidelines

### Resources and Documentation

- Always use clickable URLs when providing references to links
- Prefer official documentation sources over third-party tutorials
- Reference implementation.md for tool-specific documentation URLs

### Container and Build Configuration

- Use `Containerfile` instead of `Dockerfile` for container definitions
- Format complex build commands using arrays for improved readability:

  ```json
  "initializeCommand": [
    "bash -c",
    "podman rmi -f transcript:development 2>/dev/null || true &&",
    "podman build",
    "--target base --tag transcript:base",
    "--target shared --tag transcript:shared",
    "--target development --tag transcript:development",
    "-f containers/Containerfile ."
  ]
  ```

### Code Generation Instructions

- Follow conventions from convention.md before generating code
- Apply security and performance practices from code_design.md
- Leverage existing patterns identified in feature.md
- Use appropriate tools and technologies from implementation.md
- **Use markdownlint-cli2** to lint and format `*.md` documents the have been edited by or created.
- **markdownlint rules** - https://raw.githubusercontent.com/markdownlint/markdownlint/refs/heads/main/docs/RULES.md
- **markdownlint rules configuration** - see config file at ~/.config/markdownlint/markdownlint.jsonc

## Important Reminders

- make sure knowledge is up to date
- value simplicity over easy - keep it simple stupid
- Read all documentation files in both global and project .claude/doc folders for complete context
- ALWAYS read .gitignore first before editing to avoid adding duplicate references folders or files, (e.g. \*\*/.claude/settings.local.json)
