# Global claude.md Workflow Guidelines

This file provides global guidance for Claude Code across all projects and repositories.

## Security-First Development Principles

### Always Consider Security

- Run security scans before committing (use `gitleaks`, `testssl`, `ssh-audit` from your toolkit)
- Never commit secrets, API keys, or sensitive data
- Use `.gitignore` patterns for sensitive files
- Implement proper input validation and sanitization
- Follow least privilege principles

### Security Tools Integration

```sh
# Scan for secrets before commit
gitleaks detect --source . --verbose

# Audit SSH configurations
ssh-audit <host>

# Test SSL/TLS configurations
testssl <domain>
```

## File Naming and Organization

### Naming Conventions

- Use lowercase with underscores: `my_config_file.js`, unless it is against convention of language
- Prefer singular forms: `user.model.js` not `users.model.js`
- Be descriptive but concise: `auth_service.py` not `a.py`

### Directory Structure

- Group related files logically
- Use consistent folder naming across projects
- Separate configuration from source code
- Keep test files adjacent to source when possible

## Development Workflow Standards

### Code Quality

- Always run linters and formatters before committing, including markdown files
- Write tests for new functionality
- Document complex logic with clear comments
- Use TypeScript/type hints where available

### Git Practices

- Write descriptive commit messages
- Use conventional commit format when possible
- Always review changes before committing
- Keep commits atomic and focused

### Environment Management

- Use `mise` for language version consistency
- Document required tool versions
- Provide setup instructions in project README
- Use `.env` files for local configuration (never commit them)

## Common Commands and Shortcuts

### Quick Development Setup

```sh
# Install all language tools
mise install

# Install project dependencies (if applicable)
npm install  # or pip install -r requirements.txt, etc.

# Run security checks
gitleaks detect --source . --verbose
```

### Maintenance Tasks

```sh
# Update all tools
mise outdated && mise upgrade

# Clean up unused dependencies
npm prune  # or pip-autoremove, etc.

# Check for security vulnerabilities
npm audit  # or safety check, etc.
```

## Error Handling and Debugging

### Defensive Programming

- Always validate inputs
- Handle edge cases gracefully
- Provide meaningful error messages
- Log important events and errors
- Use appropriate error types and status codes

### Testing Strategy

- Write unit tests for critical functions
- Include integration tests for complex workflows
- Test error conditions and edge cases
- Maintain good test coverage

## Documentation Standards

### Code Documentation

- Document why, not just what
- Keep documentation close to code
- Update docs when changing functionality
- Use clear, concise language

### Project Documentation

- Provide clear setup instructions
- Document dependencies and requirements
- Include usage examples
- Maintain a changelog for significant changes

## Performance and Efficiency

### Optimization Guidelines

- Profile before optimizing
- Focus on algorithmic improvements first
- Consider memory usage in long-running processes
- Use appropriate data structures

### Resource Management

- Close file handles and connections
- Use connection pooling where appropriate
- Implement proper cleanup in error handlers
- Monitor resource usage in production

## Collaboration and Code Review

### Code Review Checklist

- Security implications reviewed
- Tests added/updated
- Documentation updated
- Performance impact considered
- Error handling adequate

### Communication

- Write clear commit messages
- Document breaking changes
- Provide context in pull requests
- Be constructive in code reviews
