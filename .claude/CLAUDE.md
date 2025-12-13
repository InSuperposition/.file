# Global Claude Code Instructions

This file provides universal guidance for Claude Code across all projects.

## Universal Guidelines

### Plan mode

- Keep knowledge is up to date
- Use Simplicity and First principles skills
- Always ask questions if there are gaps in the plan
- Do not assume, ask questions

### Resources and Documentation

- Always use clickable URLs when providing references to links
- Prefer official documentation sources over third-party tutorials
- Reference implementation.md for tool-specific documentation URLs

### Code Generation Instructions

- Follow conventions from convention.md before generating code
- Apply security and performance practices from code_design.md
- Leverage existing patterns identified in feature.md
- Use appropriate tools and technologies from implementation.md
- **Use markdownlint-cli2** to lint and format `*.md` documents the have been edited by or created.
- **markdownlint rules** - https://raw.githubusercontent.com/markdownlint/markdownlint/refs/heads/main/docs/RULES.md
- **markdownlint rules configuration** - see config file at ~/.config/markdownlint/markdownlint.jsonc
