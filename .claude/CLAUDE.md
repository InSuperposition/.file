# Global Claude Code Instructions

Universal guidance for Claude Code across all projects.

## Unified Design & Programming Principles for planning

### Negative Space Software Architecture and Design

*Absence, emptiness, intentional omission as architectural principles*

1. **The "No-Code" Feature** – Most robust part of system = feature you chose not to build; zero maintenance, zero bugs, infinite reliability via deliberate absence.
2. **Explicit Boundary Gaps** – Treat space between microservices as formal architectural entity (API contract, network gap), not just connection point.
3. **The "Nothing" Response** – Less is more, declarative and semantically correct naming, helps with reusability, composability. DRY and KISS. this applies to tests, styles and code
4. **Backpressure as Breathing Room** – Buffers and queues create expandable "room" when systems overwhelmed; elastic space between requests = shock absorber.
5. **Minimal Viable Surface Area** – Shrink public APIs for protective "empty space" around modules; internal refactor without breaking consumers; exposure minimalism.
6. **Dead Code Elimination** – Remove stale logic to restore architectural clarity; prune to reveal essential structure.
7. **Deferred Initialization** – Resources and services exist only when invoked; intentional gaps in memory and runtime until necessity calls them.
8. **Statelessness** – Components hold no memory between interactions; space between calls stays clean, no hidden coupling.
9. **Asynchronous Gaps** – Wait time handled by architecture (queues, promises, futures), not blocking; pause = feature, not bug.
10. **Feature Deprecation as Sculpting** – Hollow out legacy systems to make room for modern implementations; architecture by subtraction.
11. **Sparse Data Protocols** – Formats (Protocol Buffers, JSON) skip null/default fields, save bandwidth, send only what exists.
12. **The Golden Path Strategy** – Harden one workflow, leave negative space (no support) for edge cases that add complexity.
13. **Circuit Breakers** – Deliberate disconnection holes in network protect system during failures; intentional severing = defensive architecture.
14. **Inversion of Control Voids** – Empty interfaces and hooks in frameworks users must fill; architecture defined by what it deliberately doesn't do.
15. **Side-Effect Isolation at Edges** – Push messy interactions (I/O, state, randomness) to boundaries; functional core stays empty of impurity.
16. **The Unix Philosophy Gap** – Small tools do one thing, compose rest; pipes (`|`) manage architectural space between components.
17. **Whitespace Data Signaling** – Pipelines where absence of data carries meaning, triggers distinct control paths; empty stream = information.
18. **Constraint-Driven Composition** – What you *don't* allow defines relationships; negative constraints create positive structure via bounded freedom.

### Strict Types

*Move logic into type system; catch errors at compile time, enforce correctness*

1. **Algebraic Data Types (ADTs)** – Sum types (enums with data) represent state; impossible states cannot be represented.
2. **The Newtype Pattern** – Wrap primitives in unique structs; can't pass UserId where ProductId expected; branded types prevent domain confusion.
3. **Zero-Cost Abstractions** – Types give compile-time safety, disappear in final compiled code.
4. **Exhaustiveness Checking** – Compiler forces every case in switch/match; Never type marks impossible cases.
5. **Immutability by Default** – Data constant unless marked otherwise; readonly/immutable types prevent unintentional mutation.
6. **Ownership and Borrowing** – Types track which code "owns" memory, prevent data races; temporal/linear types track resource state changes.
7. **Generic Constraints (Traits/Interfaces)** – Define exactly what a type must do before use; generics with constraints = reusable bounded abstractions.
8. **Option and Result Types** – Force explicit null/error handling before value access; strict null checks avoid undefined pitfalls.
9. **Phantom Types** – Types hold no data, act as markers tracking object state (e.g., Request<Unauthenticated> vs Request<Authenticated>).
10. **Compile-Time Validation** – Type checker ensures units of measurement or domains never mixed.
11. **Nominal Typing** – Differentiate types by unique symbols, not structural shape.
12. **Literal Types** – Restrict values to exact strings, numbers, booleans for precision.
13. **Union and Intersection Types** – Capture multiple valid shapes, enforce constraints across type boundaries.
14. **Conditional Types** – Dynamic behavior based on other type parameters; encode logic in type system.
15. **Type Guards and Assertions** – Narrow types safely at runtime when compile-time info insufficient.
16. **Satisfies Operator** – Check values meet type contract without coercion or transformation.
17. **Causal Types** – Encode system events and dependencies in types; prevent invalid sequences, enforce ordering.
18. **Effect Types** – Track side effects in type system; impurity explicit and controllable.

### Functional Programming Approach

*Computation = evaluation of mathematical functions; avoid changing state*

1. **Pure Functions** – Same input → same output, no side effects; referential transparency lets calls be replaced with values.
2. **First-Class and Higher-Order Functions** – Functions = data; pass into or return from other functions.
3. **Declarative vs. Imperative** – Describe what (map, filter), not how to loop; point-free style emphasizes transformations over arguments.
4. **Function Composition** – Build complex logic by piping output of one small function into input of another; composable services designed like functions.
5. **Persistent Data Structures** – Return new versions when modified, leave original intact; immutable structures prevent in-place modification.
6. **Currying and Partial Application** – Pre-load functions with some arguments; create specific functions from general ones.
7. **Lazy Evaluation** – Delay calculation until needed; enables infinite streams and performance optimization.
8. **Pattern Matching** – Deconstruct data by shape; extract values cleanly, act accordingly.
9. **Recursion over Iteration** – Self-referencing functions process data instead of for/while loops; maintains functional purity.
10. **Monads/Functors** – Containers wrap values, apply transformations, abstract side effects (I/O, state); Option/Result handle absence and failure composably.
11. **Type-Safe Effects** – Model side effects explicitly via effect systems or algebraic effects, not hidden.
12. **Referential Transparency** – Replace function call with result value without changing program behavior.
13. **Function Pipeline Architecture** – Systems = data flowing through composed transformations.
14. **Immutability as Default** – All data immutable unless marked otherwise; prevents unexpected side effects.
15. **Declarative Patterns** – What should happen, not how; raises abstraction.
16. **Composable Abstractions** – Complex behaviors from simple, reusable, composable pieces.
17. **Expression-Oriented Programming** – Everything = expression returning value; statements become expressions.
18. **Functional Core, Imperative Shell** – Core logic pure and functional; side effects at boundaries.

### Naming conventions

- files, folders, functions = correct and descriptive names
- semantic action-based names for functions.

---

### Output format

** use for all markdown output ** - plans, CLAUDE.md. README.md, etc

- Abstract at beginning of output
- set goals
- define constraints

### Context

- MUST: Ask questions when Claude needs more info. NEVER assume.
- MUST: Search for errors, omissions, contradictions between user messages and code or plan files.
- Questions MUST have:
  - why asking, with specificity
  - 2 - 5 options
  - Options SHOULD be innovative and simple, even if large refactor
  - each option MUST include - benefits, drawbacks, mitigations
  - recommendation with reasoning

### Plan mode

- Simplicity + First principles
- Ask questions if context missing. No assumptions.
- Options: explanation, benefit, drawbacks with mitigations.
- Up-to-date info
- Order + group by logical phases
- Break into tasks + sub tasks

### Resources and Documentation

- Clickable URLs for all link references
- Prefer official docs and source code over third-party tutorials
