# Feature Development Guidelines

This document provides guidelines for developing new features and leveraging existing functionality within projects.

## Feature Development Process

### Planning Phase

1. **Requirements Analysis**: Clearly define feature requirements and acceptance criteria
2. **Architecture Review**: Assess how the feature fits into existing architecture
3. **Conventions**: Follow naming and coding conventions from `convention.md`
4. **Technology Stack**: Reference implementation stack from `implementation.md` and understand **ONLY** relevant documentation.
5. **Design Patterns**: Identify appropriate design patterns from `code_design.md`

### Design Phase

1. **Feature Specification**: Create detailed feature specification
2. **API Design**: Design APIs following RESTful or GraphQL conventions
3. **Data Models**: Design data structures and database schemas
4. **User Interface**: Design user interfaces and user experience flows
5. **Integration Points**: Identify integration points with existing features

### Implementation Phase

1. **Development Environment**: Set up development environment using existing tools
2. **Code Structure**: Follow established project structure and patterns
3. **Testing Strategy**: Implement unit, integration, and end-to-end tests
4. **Documentation**: Create feature documentation and API documentation
5. **Code Review**: Conduct thorough code reviews following project standards

## Common Feature Patterns

### CRUD Operations

- **Create**: POST endpoints for resource creation
- **Read**: GET endpoints for resource retrieval
- **Update**: PUT/PATCH endpoints for resource updates
- **Delete**: DELETE endpoints for resource removal

### Authentication Features

- **User Registration**: Account creation with validation
- **Login/Logout**: Session management and authentication
- **Password Reset**: Secure passkey reset functionality
- **Multi-factor Authentication**: 2FA/MFA implementation
- **Role-based Access Control**: Permission management

### Data Processing Features

- **File Upload**: Secure file upload with validation
- **Data Import/Export**: EDN, CSV, JSON, XML processing
- **Batch Processing**: Background job processing
- **Real-time Processing**: Stream processing capabilities
- **Data Validation**: Input validation and sanitization

### Integration Features

- **API Clients**: External API integration
- **Webhook Handlers**: Incoming webhook processing
- **Message Queues**: Asynchronous message processing
- **Database Migrations**: Schema evolution management
- **Cache Management**: Caching strategies and invalidation

### User Interface Features

- **Forms**: Form validation and submission
- **Tables**: Data display with sorting and filtering
- **Search**: Search functionality with faceting
- **Pagination**: Large dataset pagination
- **Real-time Updates**: WebSocket or SSE implementation

## Existing Feature Identification

### Code Analysis

1. **Architecture Review**: Analyze existing code structure
2. **Pattern Recognition**: Identify existing design patterns
3. **Dependency Analysis**: Map feature dependencies
4. **API Inventory**: Catalog existing APIs and endpoints
5. **Database Schema**: Review existing data models

### Feature Catalog Template

```markdown
## Feature: [Feature Name]

### Description

Brief description of the feature's purpose and functionality.

### Components

- **Frontend**: List of UI components
- **Backend**: List of API endpoints and services
- **Database**: List of related tables/collections
- **External**: List of external integrations

### Usage Examples

- Example API calls
- Example UI interactions
- Example configuration

### Extension Points

- Ways this feature can be extended
- Integration opportunities
- Customization options

### Dependencies

- Required features
- Optional features
- External dependencies
```

## Feature Enhancement Strategies

### Incremental Development

- **Phase 1**: Core functionality implementation
- **Phase 2**: Additional features and refinements
- **Phase 3**: Advanced features and optimizations
- **Phase 4**: Integration and ecosystem features

### Backward Compatibility

- **API Versioning**: Maintain backward compatibility
- **Database Migrations**: Safe schema evolution
- **Configuration Changes**: Gradual configuration updates
- **Deprecation Strategy**: Graceful feature deprecation

### Feature Flags

- **Development**: Enable/disable features during development
- **Testing**: Control feature availability in test environments
- **Staging**: Gradual rollout to staging environments
- **Production**: Safe production feature rollouts

## Common Feature Categories

### Core Business Logic

- **Domain Models**: Business entity modeling
- **Business Rules**: Rule engine implementation
- **Workflow Management**: Process automation
- **Reporting**: Data analysis and reporting
- **Audit Logging**: Change tracking and compliance

### Infrastructure Features

- **Monitoring**: Application and system monitoring
- **Logging**: Structured logging and log management
- **Health Checks**: System health monitoring
- **Configuration Management**: Dynamic configuration
- **Secret Management**: Secure credential handling

### Performance Features

- **Caching**: Multi-level caching strategies
- **Database Optimization**: Query optimization and indexing
- **Async Processing**: Background job processing
- **Load Balancing**: Traffic distribution
- **CDN Integration**: Content delivery optimization

### Security Features

- **Authentication**: User identity verification
- **Authorization**: Access control and permissions
- **Encryption**: Data protection at rest and in transit
- **Input Validation**: Security input validation
- **Rate Limiting**: API protection against abuse

### Developer Experience Features

- **API Documentation**: Interactive API documentation
- **SDK Generation**: Client library generation
- **Testing Tools**: Testing utilities and fixtures
- **Development Tools**: Debugging and profiling tools
- **Code Generation**: Automated code generation

## Feature Reuse and Extension

### Composition Patterns

- **Mixin Pattern**: Reusable functionality components
- **Decorator Pattern**: Behavior extension without modification
- **Strategy Pattern**: Pluggable algorithm implementations
- **Observer Pattern**: Event-driven feature interactions
- **Factory Pattern**: Dynamic feature instantiation

### Plugin Architecture

- **Plugin Interface**: Standardized plugin contracts
- **Plugin Discovery**: Automatic plugin detection
- **Plugin Configuration**: Dynamic plugin configuration
- **Plugin Dependencies**: Plugin dependency management
- **Plugin Lifecycle**: Plugin initialization and cleanup

### Microservices Integration

- **Service Discovery**: Automatic service registration
- **Load Balancing**: Service-to-service load balancing
- **Circuit Breakers**: Fault tolerance mechanisms
- **Distributed Tracing**: Cross-service request tracing
- **API Gateway**: Unified API access point

## Testing Strategies for Features

### Unit Testing

- **Component Testing**: Individual component testing
- **Service Testing**: Business logic testing
- **Repository Testing**: Data access testing
- **Utility Testing**: Helper function testing
- **Mock Testing**: External dependency mocking

### Integration Testing

- **API Testing**: End-to-end API testing
- **Database Testing**: Database integration testing
- **External Service Testing**: Third-party integration testing
- **Message Queue Testing**: Async communication testing
- **Cache Testing**: Caching behavior testing

### End-to-End Testing

- **User Journey Testing**: Complete user workflow testing
- **Browser Testing**: Cross-browser compatibility testing
- **Mobile Testing**: Mobile device testing
- **Performance Testing**: Load and stress testing
- **Security Testing**: Security vulnerability testing

## Documentation Requirements

### Feature Documentation

- **Overview**: Feature purpose and benefits
- **Installation**: Setup and configuration instructions
- **Usage**: Examples and use cases
- **API Reference**: Detailed API documentation
- **Troubleshooting**: Common issues and solutions

### Technical Documentation

- **Architecture**: Technical architecture overview
- **Database Schema**: Data model documentation
- **Configuration**: Configuration options and defaults
- **Dependencies**: Required dependencies and versions
- **Deployment**: Deployment instructions and considerations

### User Documentation

- **User Guide**: Step-by-step user instructions
- **FAQ**: Frequently asked questions
- **Tutorials**: Guided learning materials
- **Best Practices**: Recommended usage patterns
- **Examples**: Real-world usage examples

## Performance Considerations

### Scalability Planning

- **Horizontal Scaling**: Multi-instance deployment
- **Vertical Scaling**: Resource allocation optimization
- **Database Scaling**: Database performance optimization
- **Cache Scaling**: Distributed caching strategies
- **CDN Usage**: Content delivery optimization

### Monitoring and Observability

- **Metrics Collection**: Feature usage metrics
- **Performance Monitoring**: Response time and throughput
- **Error Tracking**: Error rate and error analysis
- **User Experience Monitoring**: User interaction tracking
- **Business Metrics**: Feature impact measurement

### Optimization Strategies

- **Code Optimization**: Algorithm and data structure optimization
- **Database Optimization**: Query and index optimization
- **Network Optimization**: Bandwidth and latency optimization
- **Resource Optimization**: Memory and CPU optimization
- **User Experience Optimization**: UI/UX performance optimization

## Maintenance and Evolution

### Version Management

- **Semantic Versioning**: Version numbering strategy
- **Release Notes**: Change documentation
- **Migration Guides**: Upgrade instructions
- **Deprecation Notices**: Feature retirement planning
- **Support Lifecycle**: Feature support timeline

### Continuous Improvement

- **User Feedback**: Feature usage feedback collection
- **Performance Analysis**: Ongoing performance monitoring
- **Security Updates**: Security vulnerability patching
- **Feature Requests**: New feature request management
- **Technical Debt**: Code quality improvement

### Knowledge Management

- **Code Documentation**: Inline code documentation
- **Architecture Decisions**: Decision record maintenance
- **Lessons Learned**: Development experience documentation
- **Best Practices**: Evolving best practice documentation
- **Team Knowledge**: Knowledge sharing and transfer

## Claude Instructions

### Feature Analysis Process

1. **Read Documentation**: Review all documentation files in order
2. **Analyze Codebase**: Examine existing code structure and patterns
3. **Identify Patterns**: Recognize reusable components and patterns
4. **Map Dependencies**: Understand feature relationships
5. **Document Findings**: Create feature inventory and analysis

### Feature Development Process

1. **Apply Conventions**: Follow established naming and coding conventions
2. **Use Existing Patterns**: Leverage existing design patterns and components
3. **Maintain Consistency**: Ensure consistency with existing codebase
4. **Include Testing**: Implement comprehensive testing strategy
5. **Document Changes**: Update documentation with new features

### Feature Enhancement Process

1. **Identify Opportunities**: Look for enhancement opportunities
2. **Assess Impact**: Evaluate potential impact on existing features
3. **Plan Implementation**: Create detailed implementation plan
4. **Implement Changes**: Execute changes following best practices
5. **Validate Results**: Test and validate feature enhancements
