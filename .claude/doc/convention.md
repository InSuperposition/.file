# Coding and Naming Conventions

This document establishes consistent conventions for code structure, naming, and organization across projects.

## Universal Conventions

### File and Directory Naming

- **Files**: Use `snake_case` for all files
  - ✅ `user_profile.py`, `api_client.js`
  - ❌ `UserProfile.py`, `apiClient.js`
- **Directories**: Use `snake_case` for directories
  - ✅ `web_automation/`, `user_management/`
  - ❌ `WebAutomation/`, `userManagement/`
- **Pluralization**: Use singular forms for directories
  - ✅ `user/`, `product/`, `order/`
  - ❌ `users/`, `products/`, `orders/`

### Container Conventions

- **Containerfile naming convention**: Use `Containerfile` instead of `Dockerfile`, or `Containerfile.api`, etc. if specificity is required
- **Container names**: Use descriptive names with hyphens
  - ✅ `my-app:development`, `api-server:v1.0`
  - ❌ `myapp:dev`, `server:latest`

### Configuration Files

- **Format preference**: TOML > YAML > JSON for configuration
- **Naming**: Use descriptive names
  - ✅ `database.toml`, `logging.yaml`
  - ❌ `config.toml`, `settings.yaml`

## Code Structure Conventions

### Function and Method Naming

- **Functions**: Use `snake_case` for function names
  - ✅ `calculate_total()`, `process_user_data()`
  - ❌ `calculateTotal()`, `processUserData()`
- **Methods**: Follow language conventions (may override universal)
- **Descriptive names**: Use clear, descriptive names
  - ✅ `validate_email_format()`, `fetch_user_profile()`
  - ❌ `validate()`, `fetch()`

### Variable Naming

- **Variables**: Use `snake_case` for variables
  - ✅ `user_id`, `api_response`, `connection_timeout`
  - ❌ `userId`, `apiResponse`, `connectionTimeout`
- **Constants**: Use `UPPER_SNAKE_CASE` for constants
  - ✅ `MAX_RETRY_COUNT`, `DEFAULT_TIMEOUT`
  - ❌ `maxRetryCount`, `defaultTimeout`
- **Boolean variables**: Use descriptive prefixes
  - ✅ `is_active`, `has_permission`, `can_edit`
  - ❌ `active`, `permission`, `edit`

### Class Naming

- **Classes**: Use `PascalCase` for class names
  - ✅ `UserProfile`, `ApiClient`, `DatabaseConnection`
  - ❌ `user_profile`, `api_client`, `database_connection`
- **Descriptive names**: Use clear, descriptive class names
  - ✅ `EmailValidator`, `PaymentProcessor`
  - ❌ `Validator`, `Processor`

## Language-Specific Conventions

### Python

- **Style Guide**: Follow PEP 8
- **Functions**: `snake_case`
- **Classes**: `PascalCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **Private members**: Prefix with underscore `_private_method`
- **Modules**: `snake_case`
- **Packages**: `snake_case`

### JavaScript/TypeScript

- **Style Guide**: Follow Airbnb or Standard style
- **Functions**: `camelCase`
- **Classes**: `PascalCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **Files**: `snake_case` (override camelCase convention)
- **Interfaces** (TS): `PascalCase` with optional 'I' prefix
- **Types** (TS): `PascalCase`

### Java

- **Style Guide**: Follow Google Java Style
- **Methods**: `camelCase`
- **Classes**: `PascalCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **Packages**: `lowercase.with.dots`
- **Files**: Match class names (`PascalCase`)

### Go

- **Style Guide**: Follow Go conventions
- **Functions**: `camelCase` (public: `PascalCase`)
- **Variables**: `camelCase`
- **Constants**: `PascalCase`
- **Packages**: `lowercase`
- **Files**: `snake_case`

### Rust

- **Style Guide**: Follow Rust conventions
- **Functions**: `snake_case`
- **Types**: `PascalCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **Modules**: `snake_case`
- **Files**: `snake_case`

### CSS/SCSS

- **Classes**: `snake_case`
- **IDs**: `snake_case`
- **Variables**: `snake_case`
- **Files**: `snake_case`

### Clojure/ClojureScript

- **Functions**: `kebab-case`
- **Variables**: `kebab-case`
- **Namespaces**: `kebab-case`
- **Files**: `snake_case`

## Database Conventions

### Table Naming

- **Tables**: Use `snake_case` and singular form
  - ✅ `user`, `product`, `order_item`
  - ❌ `users`, `Products`, `orderItems`

### Column Naming

- **Columns**: Use `snake_case`
  - ✅ `user_id`, `created_at`, `email_address`
  - ❌ `userId`, `createdAt`, `emailAddress`

### Foreign Keys

- **Pattern**: `{table_name}_id`
  - ✅ `user_id`, `product_id`
  - ❌ `userId`, `productId`

## API Conventions

### Endpoint Naming

- **URLs**: Use `kebab-case` for paths, this if for SEO compatibility
  - ✅ `/api/user-profiles`, `/api/order-history`
  - ❌ `/api/userProfiles`, `/api/order_history`
- **Resources**: Use plural nouns
  - ✅ `/api/users`, `/api/products`
  - ❌ `/api/user`, `/api/product`

### HTTP Methods

- **GET**: Retrieve data
- **POST**: Create new resources
- **PUT**: Update entire resources
- **PATCH**: Partial updates
- **DELETE**: Remove resources

## Git Conventions

### Branch Naming

- **Pattern**: `{type}/{description}`
  - ✅ `feature/user_authentication`, `bugfix/login_error`
  - ❌ `feature_user_auth`, `fix-login`

### Commit Messages

- **Format**: `{type}: {description}`
  - ✅ `feat: add user authentication`, `fix: resolve login timeout`
  - ❌ `Added user auth`, `Login fix`

## Documentation Conventions

### File Naming

- **Documentation**: Use `snake_case` for documentation files
  - ✅ `api_documentation.md`, `setup_guide.md`
  - ❌ `APIDocumentation.md`, `SetupGuide.md`

### Code Comments

- **Inline comments**: Use sparingly, focus on "why" not "what"
- **Function docstrings**: Document parameters, return values, and exceptions
- **Class docstrings**: Document purpose, attributes, and usage

## Environment and Configuration

### Environment Variables

- **Naming**: Use `UPPER_SNAKE_CASE`
  - ✅ `DATABASE_URL`, `API_SECRET_KEY`
  - ❌ `databaseUrl`, `api_secret_key`

### Configuration Keys

- **Naming**: Use `snake_case` in configuration files
  - ✅ `database_host`, `log_level`
  - ❌ `databaseHost`, `logLevel`

## Linting and Formatting

### Code Formatting

- **Python**: Use `black` and `ruff`
- **JavaScript/TypeScript**: Use `prettier` and `eslint`
- **Go**: Use `gofmt` and `golint`
- **Rust**: Use `rustfmt` and `clippy`
- **Java**: Use `google-java-format`

### Enforcement

- **Pre-commit hooks**: Use `pre-commit` to enforce formatting
- **CI/CD**: Include linting checks in build pipeline
- **Editor integration**: Configure editors to format on save
- **NEVER use inline comments to disable linter**

## Convention Conflicts

### Handling Conflicts

1. **Language-specific overrides**: Language conventions take precedence
2. **Framework requirements**: Framework conventions override general rules
3. **Team consensus**: Document and communicate any project-specific overrides
4. **Notification**: Claude should notify users of convention conflicts

### Resolution Process

1. Identify the conflict
2. Determine the appropriate convention hierarchy
3. Document the decision
4. Update project-specific `convention.md`
5. Communicate changes to team

## Best Practices

### Consistency

- **Within files**: Maintain consistent style within individual files
- **Within projects**: Follow project-wide conventions
- **Across projects**: Use these universal conventions as defaults

### Readability

- **Descriptive names**: Use clear, descriptive names over short abbreviations
- **Consistent patterns**: Follow established patterns within the codebase
- **Logical grouping**: Group related functions and classes together

### Maintainability

- **Documentation**: Keep conventions documented and up-to-date
- **Reviews**: Include convention adherence in code reviews
- **Automation**: Use tools to enforce conventions automatically

## Claude Instructions

### Before Code Generation

1. **Review conventions**: Check both global and project-specific conventions
2. **Identify conflicts**: Note any conflicting conventions
3. **State plan**: Clearly communicate which conventions will be used
4. **Follow existing patterns**: Prioritize consistency with existing code

### During Code Generation

1. **Apply conventions**: Follow the established conventions consistently
2. **Use formatters**: Apply appropriate formatting tools
3. **Document decisions**: Note any convention choices made
4. **Maintain consistency**: Ensure all generated code follows the same patterns

### After Code Generation

1. **Review compliance**: Check that generated code follows conventions
2. **Run formatters**: Apply automated formatting if available
3. **Update documentation**: Note any new patterns or conventions used
