# Global Claude Code Instructions

This file provides universal guidance for Claude Code across all projects.

## Unified Design & Programming Principles

### Negative Space Software Architecture and Design

*Using absence, emptiness, and intentional omission as fundamental architectural principles*

1. **The "No-Code" Feature** – The most robust part of a system is the feature you chose not to build; zero maintenance, zero bugs, infinite reliability through deliberate absence.
2. **Explicit Boundary Gaps** – Treating the space between microservices as a formal architectural entity (the API contract, the network gap) rather than just a connection point.
3. **The "Nothing" Response** – Using for example TypeScript's `never`, `satisfies`, `unknown` types to explicitly model absence of value, making the void a first-class citizen in your type system and logic.
4. **Backpressure as Breathing Room** – Using buffers and queues to create expandable "room" when systems are overwhelmed; the elastic space between requests becomes a shock absorber.
5. **Minimal Viable Surface Area** – Reducing public APIs to create protective "empty space" around modules, allowing internal refactoring without breaking consumers; exposure minimalism.
6. **Dead Code Elimination** – The active pursuit of removing stale logic to restore architectural clarity; pruning to reveal the essential structure beneath.
7. **Deferred Initialization** – Resources and services exist only when invoked, leaving intentional gaps in memory and runtime until necessity calls them into being.
8. **Statelessness** – Creating components that hold no memory between interactions, leaving the space between calls clean and free of hidden coupling.
9. **Asynchronous Gaps** – Designing systems where wait time is handled by architecture (queues, promises, futures) rather than blocking; the pause becomes a feature, not a bug.
10. **Feature Deprecation as Sculpting** – The intentional hollowing out of legacy systems to make room for modern implementations; architecture through subtraction.
11. **Sparse Data Protocols** – Leveraging formats (Protocol Buffers, JSON) that don't transmit null or default fields, saving bandwidth by sending only what exists.
12. **The Golden Path Strategy** – Hardening one specific workflow while leaving negative space (no support) for edge cases that introduce unnecessary complexity.
13. **Circuit Breakers** – Creating deliberate disconnection holes in the network to protect the system during failures; intentional severing as defensive architecture.
14. **Inversion of Control Voids** – Leaving empty interfaces and hooks in frameworks that users must fill, defining architecture by what it deliberately doesn't do.
15. **Side-Effect Isolation at Edges** – Pushing all messy interactions (I/O, state, randomness) to system boundaries, keeping the functional core empty of impurity.
16. **The Unix Philosophy Gap** – Building small tools that do one thing and leave the rest to composition; relying on pipes (`|`) to manage the architectural space between components.
17. **Whitespace Data Signaling** – Designing pipelines where absence of data carries meaning and triggers distinct control paths; the empty stream as information.
18. **Constraint-Driven Composition** – Let what you *don't* allow define relationships between components; negative constraints create positive structure through bounded freedom.

### Strict Types

*Moving logic into the type system to catch errors at compile time and enforce correctness*

1. **Algebraic Data Types (ADTs)** – Using sum types (enums with data) to represent state so impossible states cannot be represented.
2. **The Newtype Pattern** – Wrapping primitives in unique structs so you can't accidentally pass a UserId into a function expecting a ProductId; branded types preventing domain confusion.
3. **Zero-Cost Abstractions** – Defining types that provide safety at compile time but disappear in final compiled code.
4. **Exhaustiveness Checking** – Ensuring the compiler forces handling of every possible case in switch/match statements; the Never type marking impossible cases.
5. **Immutability by Default** – Treating data as constant unless explicitly marked otherwise; readonly and immutable types preventing unintentional mutation.
6. **Ownership and Borrowing** – Using types to track which code "owns" memory, preventing data races; temporal/linear types tracking resource state changes.
7. **Generic Constraints (Traits/Interfaces)** – Defining exactly what a type must do before use; generic types with constraints creating reusable bounded abstractions.
8. **Option and Result Types** – Forcing explicit handling of null or error cases before accessing underlying values; strict null checks avoiding undefined pitfalls.
9. **Phantom Types** – Using types that hold no data but act as markers to track object state (e.g., Request<Unauthenticated> vs Request<Authenticated>).
10. **Compile-Time Validation** – Using the type checker to ensure units of measurement or domains are never mixed.
11. **Nominal Typing** – Differentiate types by unique symbols rather than just structural shape.
12. **Literal Types** – Restrict values to exact strings, numbers, or booleans for precision.
13. **Union and Intersection Types** – Capture multiple valid shapes while enforcing constraints across type boundaries.
14. **Conditional Types** – Define dynamic behavior based on other type parameters, encoding logic in the type system.
15. **Type Guards and Assertions** – Narrow types safely at runtime when compile-time information is insufficient.
16. **Satisfies Operator** – Check that values meet a type contract without coercion or transformation.
17. **Causal Types** – Encode system events and dependencies in types to prevent invalid sequences and enforce ordering.
18. **Effect Types** – Track side effects in the type system itself, making impurity explicit and controllable.

### Functional Programming Approach

*Treating computation as evaluation of mathematical functions while avoiding changing state*

1. **Pure Functions** – Functions that always return the same output for the same input with no side effects; referential transparency allowing replacement of calls with values.
2. **First-Class and Higher-Order Functions** – Treating functions as data that can be passed into or returned from other functions.
3. **Declarative vs. Imperative** – Describing what to do (e.g., map, filter) rather than how to loop; point-free style emphasizing transformations over arguments.
4. **Function Composition** – Building complex logic by piping output of one small function into input of another; functionally composable services designed like functions.
5. **Persistent Data Structures** – Using data structures that return new versions when modified, leaving the original intact; immutable data structures preventing in-place modification.
6. **Currying and Partial Application** – Pre-loading functions with some arguments to create more specific functions from general ones.
7. **Lazy Evaluation** – Delaying calculation of values until actually needed, allowing for infinite data streams and performance optimization.
8. **Pattern Matching** – Deconstructing data structures based on their shape to extract values cleanly and act accordingly.
9. **Recursion over Iteration** – Using self-referencing functions to process data instead of for or while loops, maintaining functional purity.
10. **Monads/Functors** – Using containers to wrap values and apply transformations while abstracting away side effects (like I/O or state); Option/Result types handling absence and failure composably.
11. **Type-Safe Effects** – Model side effects explicitly via effect systems or algebraic effects rather than hiding them.
12. **Referential Transparency** – The ability to replace a function call with its resulting value without changing program behavior.
13. **Function Pipeline Architecture** – Design entire systems as data flowing through composed transformations.
14. **Immutability as Default** – Make all data immutable unless explicitly marked otherwise, preventing unexpected side effects.
15. **Declarative Patterns** – Focus on what should happen rather than how to achieve it, raising the level of abstraction.
16. **Composable Abstractions** – Build complex behaviors from simple, reusable, composable pieces.
17. **Expression-Oriented Programming** – Everything is an expression that returns a value; statements become expressions.
18. **Functional Core, Imperative Shell** – Keep the core logic pure and functional, pushing side effects to the boundaries of the system.

### Output format

** use for all markdown output ** - plans, CLAUDE.md. README.md, etc

- Provide an abstract at the beginning of output
- set goals
- define constraints

### Plan mode

- Use Simplicity and First principles
- Ask questions where context is missing. Do not assume context.
- Use up to date information
- Group by logical phases
- Break down to tasks and sub tasks

### Resources and Documentation

- Always use clickable URLs when providing references to links
- Prefer official documentation and source code over third-party tutorials
