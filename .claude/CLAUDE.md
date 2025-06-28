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

- Use lowercase with underscores: `my_config_file.js`, unless it is against convention of language. This helps when selecting text and readability
- Prefer singular forms: `user.model.js` or `model/user/` not `users.model.js`
- Be descriptive but concise: `service/authentication.py` and `service/authorization.py` not `service/auth.py` or `auth_service.py`

### Directory Structure

- Group related files logically
- Use consistent folder naming across projects
- Separate configuration from source code
- Keep test files adjacent to source when possible

### Web Development Organization

- **Compartmentalization**: Each component/module has single responsibility
- **Extensibility**: Use composition patterns, implement plugin architecture
- **Semantic Naming**: Classes and functions clearly describe their purpose
- **Browser Compatibility**: Target features with 95%+ browser support
- **No External Dependencies**: Prefer vanilla implementations over libraries
- **File co-location**: CSS files and Unit tests should be co-located in same folder with JS/TS component, sharing the same name but different extensions ( *.css,*.test.ts)
- **Separate concerns**: HTML structure, CSS styling, JavaScript behavior into separate files
- **Use ES6 modules**: Proper import/export statements
- **Group related styles**: Logical CSS sections and comments
- **Consistent naming**: Implement consistent naming conventions across all file types

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
- Provide setup instructions in project `readme.md`
- Use `.env` files for local configuration (never commit them)

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

## Documentation Standards

### Code Documentation

- Document why, not just what
- Keep documentation in unit test files, and unit test files close to code in same folder
- Document integration testing, as well
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

## Error Handling, Testing and Debugging

### Defensive Programming

- Always validate inputs
- Handle edge cases gracefully
- Provide meaningful error messages
- add layers of error messages, focusing on end users 1st and api users 2nd and then developers
- Log all events and errors
- Use appropriate error types and status codes

### Testing Strategy

Testing should test the outputs of various inputs defined or undefined values.
Testing should not focus on the implementation within the function, as that can change over time

- Create an informative description of each test
- Include integration tests for complex workflows
- Test all error conditions
- Test all edge cases, including failing tests, prompt to fix code or rewrite test
- Maintain 100% test coverage
- Write unit tests for all functions

#### Frontend Testing

- use `testing-library` and the variation for the framework used
- Test user interactions in browsers using playwright
- Test accessibility
- Test internationalization left-to-right and right-to-left layout
- Take snapshot of before after and check pixel diff

## Language-Specific Standards

### JavaScript Standards (ES2022+)

- **Prefer named functions** over anonymous or arrow functions for better stack traces
- **Use modern syntax**: `const`/`let`, destructuring, template literals, optional chaining
- **Implement async/await** over Promise chains for readability
- **Use optional chaining** (`?.`) and nullish coalescing (`??`) operators
- **Leverage Array methods**: `map()`, `filter()`, `reduce()`, `find()`, `some()`, `every()`
- **Write semantic function names**: `calculateTotalPrice()`, `validateUserInput()`
- **Avoid `var` declarations** and use proper scoping with `const`/`let`
- **Handle errors explicitly** with try/catch blocks and meaningful error messages
- **Use modules**: ES6 imports/exports, avoid global variables
- **Implement proper event handling** with `addEventListener()` over inline handlers
- **Use Web APIs**: Fetch API, IntersectionObserver, ResizeObserver
- **Prefer immutable operations**: Use spread operator, avoid mutating arrays/objects

```javascript
// Prefer this functional approach
function calculateOrderTotal(items) {
  return items
    .filter(function(item) { return item.isActive && item.price > 0; })
    .reduce(function(total, item) { return total + (item.price * item.quantity); }, 0);
}

async function fetchUserData(userId) {
  try {
    const response = await fetch(`/api/users/${userId}`);
    if (!response.ok) {
      throw new Error(`Failed to fetch user: ${response.status}`);
    }
    return await response.json();
  } catch (error) {
    console.error('User fetch error:', error);
    throw new Error('Unable to load user data');
  }
}

// Use proper event handling
function handleFormSubmit(event) {
  event.preventDefault();
  const formData = new FormData(event.target);
  const userData = Object.fromEntries(formData.entries());
  processUserData(userData);
}

document.getElementById('user-form')
  ?.addEventListener('submit', handleFormSubmit);
```

### TypeScript Standards (5.0+)

- **Use strict mode** with `strict: true` in tsconfig.json
- **Define explicit types** for all function parameters and return values
- **Use interfaces** for object shapes, types for unions/primitives
- **Leverage utility types**: `Partial<T>`, `Required<T>`, `Pick<T, K>`, `Omit<T, K>`
- **Use enums sparingly**, prefer union types or const assertions
- **Implement proper error types** with discriminated unions
- **Use generic constraints** to create flexible, type-safe functions
- **Avoid `any`**, use `unknown` when type is truly unknown
- **Use type guards** for runtime type checking
- **Implement branded types** for domain-specific values
- **Prefer named functions** over arrow functions for better debugging

```typescript
// Prefer this approach
interface User {
  readonly id: string;
  name: string;
  email: string;
  createdAt: Date;
}

type UserCreateInput = Omit<User, 'id' | 'createdAt'>;

type Result<T, E = Error> = 
  | { success: true; data: T }
  | { success: false; error: E };

async function createUser(input: UserCreateInput): Promise<Result<User>> {
  try {
    const user: User = {
      id: crypto.randomUUID(),
      ...input,
      createdAt: new Date()
    };
    
    const savedUser = await userRepository.save(user);
    return { success: true, data: savedUser };
  } catch (error) {
    return { 
      success: false, 
      error: error instanceof Error ? error : new Error('Unknown error') 
    };
  }
}

// Type guard example
function isUser(value: unknown): value is User {
  return typeof value === 'object' && 
         value !== null && 
         'id' in value && 
         'name' in value && 
         'email' in value;
}

// Generic with constraints
function sortByProperty<T, K extends keyof T>(
  items: T[], 
  key: K
): T[] {
  return [...items].sort(function(a, b) {
    const aVal = a[key];
    const bVal = b[key];
    return aVal < bVal ? -1 : aVal > bVal ? 1 : 0;
  });
}
```

### CSS Standards (Modern Browser Compatible)

- **Use CSS Grid and Flexbox** for layouts (avoid floats and tables)
- **Implement CSS Custom Properties** for consistent theming and design tokens
- **Write semantic class names** using BEM methodology when appropriate
- **Use nested selectors and CSS Layers** for organization and cascade control
- **Use logical properties**: `margin-inline-start` instead of `margin-left`
- **Utilize modern CSS functions**: `clamp()`, `min()`, `max()` for responsive design
- **Implement CSS container queries** for component-based responsiveness
- **Use `@supports`** for progressive enhancement
- **Dynamically update classList** in JavaScript, avoid inline styles
- **Group related styles** with logical CSS sections and comments
- **Use `@layer`** to control cascade and specificity
- **Avoid CSS frameworks like Tailwind** - write custom, maintainable CSS

```css
/* Prefer this approach */
@layer base, components, utilities;

@layer base {
  :root {
    --color-primary: hsl(220 90% 50%);
    --color-surface: hsl(0 0% 98%);
    --space-xs: clamp(0.25rem, 1vw, 0.5rem);
    --space-sm: clamp(0.5rem, 2vw, 1rem);
    --space-md: clamp(1rem, 3vw, 2rem);
    --size-content: min(65ch, 90vw);
    --font-base: system-ui, sans-serif;
  }
  
  html {
    color-scheme: light dark;
  }
  
  body {
    font-family: var(--font-base);
    line-height: 1.5;
    margin: 0;
  }
}

@layer components {
  .navigation {
    display: grid;
    grid-template-columns: auto 1fr auto;
    gap: var(--space-sm);
    padding-inline: var(--space-sm);
    background: var(--color-surface);
    
    &__item {
      text-decoration: none;
      padding: var(--space-xs) var(--space-sm);
      border-radius: 0.25rem;
      
      &:is(:hover, :focus-visible) {
        color: var(--color-primary);
        background: color-mix(in srgb, var(--color-primary) 10%, transparent);
      }
      
      &[aria-current="page"] {
        font-weight: 600;
        background: var(--color-primary);
        color: white;
      }
    }
  }
}

@layer utilities {
  .sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
  }
}
```

### HTML Standards (Semantic HTML5)

- **Use semantic HTML elements** for meaning, not appearance
- **Implement proper heading hierarchy** (h1-h6)
- **Use ARIA attributes** for accessibility when semantic HTML isn't sufficient
- **Validate HTML** using W3C validator
- **Use meaningful alt text** for images
- **Implement proper form labels** and fieldsets
- **Use landmark elements**: `main`, `nav`, `aside`, `header`, `footer`
- **Write accessible forms** with proper error handling

```html
<!-- Prefer this semantic approach -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Dashboard - MyApp</title>
</head>
<body>
  <header>
    <nav aria-label="Main navigation">
      <ul>
        <li><a href="/" aria-current="page">Dashboard</a></li>
        <li><a href="/users">Users</a></li>
      </ul>
    </nav>
  </header>
  
  <main>
    <h1>User Dashboard</h1>
    
    <section aria-labelledby="recent-users">
      <h2 id="recent-users">Recent Users</h2>
      <ul>
        <li>
          <article>
            <h3>John Doe</h3>
            <p>Last active: <time datetime="2024-01-15">January 15, 2024</time></p>
          </article>
        </li>
      </ul>
    </section>
  </main>
  
  <footer>
    <p>&copy; 2024 MyApp. All rights reserved.</p>
  </footer>
</body>
</html>
```

### Python Standards (3.11+)

- Use type hints for all function parameters and return values
- Follow PEP 8 style guide with black formatter
- Prefer dataclasses over traditional classes for data containers
- Use pathlib for file operations instead of os.path
- Implement context managers for resource management
- Use f-strings for string formatting
- Leverage list/dict comprehensions for data transformations
- Handle exceptions specifically, avoid bare `except:`

```python
# Prefer this
from pathlib import Path
from dataclasses import dataclass

@dataclass
class User:
    name: str
    email: str

def process_file(file_path: Path) -> list[str]:
    with file_path.open() as f:
        return [line.strip() for line in f if line.strip()]
```

### Go Standards (1.21+)

- Use gofmt and golint for consistent formatting
- Follow effective Go principles: clear, simple, readable
- Use interfaces for abstraction, concrete types for implementation
- Implement proper error handling with explicit error returns
- Use context.Context for cancellation and timeouts
- Prefer composition over inheritance
- Write table-driven tests
- Use meaningful package names and avoid generic names

```go
// Prefer this
type UserService interface {
    GetUser(ctx context.Context, id string) (*User, error)
}

func (s *service) GetUser(ctx context.Context, id string) (*User, error) {
    if id == "" {
        return nil, errors.New("user ID cannot be empty")
    }
    // implementation
}
```

### Rust Standards (Stable)

- Use cargo fmt and clippy for code quality
- Leverage ownership system to prevent memory issues
- Prefer `Result<T, E>` for error handling over panics
- Use pattern matching extensively with `match` statements
- Implement traits for shared behavior
- Use lifetimes explicitly when needed
- Write comprehensive unit tests with `#[cfg(test)]`
- Prefer iterators over manual loops

```rust
// Prefer this
fn calculate_total(items: &[Item]) -> Result<f64, CalculationError> {
    items
        .iter()
        .filter(|item| item.is_active())
        .map(|item| item.price * item.quantity)
        .try_fold(0.0, |acc, price| Ok(acc + price?))
}
```

### Clojure Standards

- Use consistent indentation (2 spaces)
- Prefer pure functions and immutable data structures
- Use threading macros `->` and `->>` for data transformations
- Leverage destructuring for function parameters
- Use `let` bindings to make intermediate values clear
- Prefer `map`, `filter`, `reduce` over loops
- Use namespaces to organize code logically
- Write tests using `clojure.test` with descriptive test names

```clojure
;; Prefer this
(defn calculate-order-total
  "Calculates total price for active items in an order."
  [items]
  (->> items
       (filter :active)
       (map #(* (:price %) (:quantity %)))
       (reduce +)))

(defn process-user-data
  "Processes user data with validation."
  [{:keys [name email age] :as user}]
  (when (and name email (pos? age))
    (-> user
        (assoc :processed-at (java.time.Instant/now))
        (update :name clojure.string/trim))))
```

### ClojureScript Standards

- Follow same Clojure conventions for consistency
- Use core.async for asynchronous operations
- Prefer reagent/re-frame for React-based UIs
- Use transit for data serialization
- Leverage Google Closure Compiler optimizations
- Use shadow-cljs for modern build tooling
- Write frontend tests using cljs.test
- Use proper interop with JavaScript libraries

```clojure
;; Prefer this
(ns app.components.user-list
  (:require [reagent.core :as r]
            [re-frame.core :as rf]))

(defn user-item [{:keys [name email]}]
  [:div.user-item
   [:h3 name]
   [:p email]])

(defn user-list []
  (let [users @(rf/subscribe [:users/all])]
    [:div.user-list
     (for [user users]
       ^{:key (:id user)}
       [user-item user])]))
```


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
