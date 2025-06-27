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

## Web Development Standards

### JavaScript Standards (ES2022+)

- Use modern syntax: `const`/`let`, arrow functions, destructuring, template literals
- Implement async/await over Promise chains for better readability
- Use optional chaining (`?.`) and nullish coalescing (`??`) operators
- Utilize Array methods: `map()`, `filter()`, `reduce()`, `find()`
- Write semantic function names: `calculateTotalPrice()`, `validateUserInput()`
- Avoid `var` declarations and use proper scoping
- Handle errors with try/catch blocks and meaningful error messages

### CSS Standards (Modern Browser Compatible)

- Use CSS Grid and Flexbox for layouts (avoid floats and tables)
- Implement CSS Custom Properties for consistent theming
- Write semantic class names, uses selectors in CSS files for styling `.navigation_item.active:focus`, dynamically update classList
- write using nested selector and CSS Layers
- Use logical properties: `margin-inline-start` instead of `margin-left`
- Utilize modern CSS functions: `clamp()`, `min()`, `max()` for responsive design
- Implement CSS container queries for component-based responsiveness
- **Avoid CSS frameworks like Tailwind** - write custom, maintainable CSS

### Code Organization Principles

- **Compartmentalization**: Each component/module has single responsibility
- **Extensibility**: Use composition patterns, implement plugin architecture
- **Semantic Naming**: Classes and functions clearly describe their purpose
- **Browser Compatibility**: Target features with 95%+ browser support
- **No External Dependencies**: Prefer vanilla implementations over libraries

### File Structure Guidelines

- Separate concerns: HTML structure, CSS styling, JavaScript behavior
- Use ES6 modules and proper import/export statements
- Group related styles with logical CSS sections and comments
- Implement consistent naming conventions across all file types

## Functional Programming Principles (Simple Made Easy)

### Simplicity Over Ease

- **Simple**: One concept, one responsibility, few interleaved parts
- **Easy**: Familiar, near at hand, but potentially complex underneath
- Choose simple solutions even if they require more initial learning
- Avoid complecting (intertwining) unrelated concepts

### Functional Approaches Over Object-Oriented

- **Prefer pure functions**: Same input always produces same output, no side effects
- **Immutability by default**: Use `const`, avoid mutation, create new data structures
- **Data transformation pipelines**: Chain operations like `map()`, `filter()`, `reduce()`
- **Separate data from behavior**: Pass data to functions rather than methods on objects
- **Avoid stateful classes**: Use modules with functions operating on plain data

### Data-Centric Design

- **Plain data structures**: Use objects, arrays, primitives over custom classes
- **Transform, don't mutate**: `const newArray = oldArray.map(transform)`
- **Composition over inheritance**: Combine simple functions to build complex behavior
- **Value-oriented programming**: Focus on values and transformations, not identity

### Practical Functional Patterns

```javascript
// Prefer this (functional)
const calculateOrderTotal = (items) => 
  items
    .filter(item => item.active)
    .map(item => item.price * item.quantity)
    .reduce((sum, amount) => sum + amount, 0);

// Over this (object-oriented)
class Order {
  constructor(items) { this.items = items; }
  calculateTotal() { /* mutating methods */ }
}
```

### Simplicity Guidelines

- **Make it work, then make it simple**: Resist premature abstraction
- **Favor explicit over implicit**: Clear data flow over hidden complexity
- **One thing at a time**: Functions should do one thing well
- **Data is code**: Treat configuration and state as first-class values
- **Avoid temporal coupling**: Don't require specific ordering of operations

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
