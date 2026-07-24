# Global Claude Code Instructions

Universal guidance for Claude Code across all projects.

## Unified Design & Programming Principles for Planning

### Guiding Principles

- Research and confirm knowledge base is up to date
- find hidden seams
- KISS, DRY
- negative space, YAGNI
- Use a Dynamic programming (DP) lens as an algorithmic optimization technique
- suggest innovation combining legacy knowledge, with modern approaches

### Operating Principles

Mental models to apply while working. Each is a trigger → action, not trivia.

#### Deciding & Prioritizing

- **The Law of the Instrument** (psychology, "Maslow's Hammer") — Don't force
  your favorite pattern, library, or the approach you just used onto the next
  problem; pick the tool the problem asks for, not the one you're holding.
- **The Law of Triviality / Bikeshedding** (organizational) — Spend attention
  in proportion to impact; don't burn effort perfecting a variable name or a
  trivial choice while the hard, high-stakes part goes unexamined.
- **Sunk Cost Fallacy** (behavioral economics) — Judge an approach by whether
  it will work from here, not by how much effort you've already sunk into it;
  be willing to scrap a failing path and restart clean.

#### When Scoping the Work

- **Pareto Principle (80/20)** — Find the ~20% of the change that delivers
  most of the value and do that first; flag the rest as follows, rather than
  gold-plating.
- **Parkinson's Law** — Constrain scope deliberately; work expands to fill the
  space you give it, so define "done" narrowly up front.
- **Hick's Law** — Fewer choices = faster, better decisions. When you present
  options (or design an interface), narrow to the few that matter instead of
  dumping every possibility.

#### Building & Changing Code

- **Gall's Law** (systems theory) — A working complex system grows from a
  working simple one; build the minimal version, verify it runs, then add
  complexity — never scaffold the whole elaborate thing before anything works.
- **Kernighan's Law** (software) — Debugging is harder than writing, so if you
  write the cleverest code you can, you won't be able to debug it; prefer the
  clear solution over the impressive one.
- **The Boy Scout Rule / Entropy** (physics as metaphor) — Codebases decay
  toward disorder by default; leave each file you touch slightly cleaner than
  you found it, but don't launch unrequested refactors mid-task.
- **Postel's Law** (network engineering) — Be strict in what you produce and
  lenient in what you accept: validate and tightly format your own output,
  but handle messy inputs and edge cases gracefully.

#### Before You Change Anything

- **Chesterton's Fence** — Don't delete or "simplify" code, config, or a
  guardrail until you understand why it exists; if you can't explain its
  purpose, investigate before removing it.
- **Occam's Razor** — When debugging, test the explanation with the fewest
  assumptions first (a typo, a null, a stale cache) before reaching for
  exotic causes.
- **Hanlon's Razor** — Assume a failing system reflects a bug, oversight, or
  edge case, not deliberate design; look for the mistake, not the intent.

#### Guarding Against Your Own Failure Modes

- **Goodhart's Law** — Don't game the metric: never hardcode a value to pass a
  test, tweak output to satisfy a linter without fixing the cause, or optimize
  a number at the expense of the actual goal.
- **Dunning-Kruger Effect** — Assume you may be wrong in unfamiliar areas;
  verify APIs, run the code, and read the source rather than trusting your
  first-pass confidence.
- **Hofstadter's Law** — Tasks run longer and deeper than they look; when a
  "quick fix" keeps expanding, stop, and replan instead of pushing through.

#### Understanding & Verifying

- **The Principle of Charity** (philosophy) — Interpret an ambiguous request
  as its most sensible version, and if two readings genuinely diverge on cost
  or intent. **Ask rather than guess.**
- **Map Is Not the Territory** (general semantics) — Comments, docs, and
  variable names describe intent, not guaranteed reality; when they conflict
  with the running code, trust what executes and verify against it. **Suggest fixes** for the outdated comments, docs or naming conventions.
- **Second-Order Thinking** (strategy, "and then what?") — Before a change,
  trace its downstream effects — callers, tests, dependents, side effects —
  rather than optimizing only the line in front of you.

### Naming Conventions

- files, folders, functions = correct and descriptive names
- use language conventions for naming, data structures and functions.
- semantic action-based names for functions.

### Docstrings and Comments

- **MANDATORY**, The **behavior-in-place** is the correct approach in code and tests.
- source code and tests should **NEVER** contain text about planning reference to other files, etc.

### Code Verification

- schemas are required for core functionality
- Types can be used if language appropriate but prefer schemas and dynamic behaviors over static analysis.
- use interactive shell, REPL to confirm work, find bugs in code
- interactively verify how changes affect downstream areas of codebase
- create new tests and logs for code changes
- unit, integration and e2e testing are a good idea

### Commit Structure

- bisect safe - commit related changes - keep them logical, simple, tested and verified.
- detailed, organized and formatted commit messages, written for a junior developer
- verification (lint, format) before commit-ing; OR implement git hooks for pre commit and possibly pre push

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
6. **Currying and Partial Application** – Preload functions with some arguments; create specific functions from general ones.
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

---

### Output Format

** use for all Markdown output ** - plans, CLAUDE.md. README.md, etc

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

### Plan Mode

- Simplicity + First principles
- Ask questions if context missing. No assumptions.
- Options: explanation, benefit, drawbacks with mitigations.
- Up-to-date info
- Order + group by logical phases
- Break into tasks + subtasks

### Resources and Documentation

- Clickable URLs for all link references
- Prefer official docs and source code over third-party tutorials

## Multi-PR Merge Protocol

When merging ≥2 open PRs, serialize. Never parallel-rebase, never
batch-push, never merge while another PR is in flight.

For each PR in agreed order:

1. `git fetch origin` + `git pull` on local main
2. `git fetch origin` in PR's worktree
3. `git rebase origin/main` (or `git rebase --rebase-merges origin/main`
   if branch absorbed any merged-in stacked PRs — default rebase
   silently drops second-parent commits of merge nodes)
4. Local verify: lint clean, format clean, tests green for touched modules
5. `git push --force-with-lease`
   - Pre-push safety: if `ahead N behind M`, diff `git log HEAD..origin/<br>`
     vs `git log origin/<br>..HEAD` by author+subject. Matching = rebase
     churn (safe). Divergent = STOP, ask user.
6. Wait for **all** PR CI checks green on GitHub
7. User merges PR via GitHub UI (do not auto-merge)
8. Wait for post-merge main CI green
9. Proceed to next PR

Sanity-check after each rebase: `gh pr diff <N> --name-only` matches
expected file list. Especially important when a PR carries cherry-picked
content from a formerly-stacked merged PR.

Anti-patterns to refuse:

- parallel rebases of multiple PRs ahead of merging
- pushing without `--force-with-lease`
- "mass-rebase all PRs now, merge later" — invites stale-base churn
- batched force-push without per-PR CI verify
- naive `git rebase` on a branch that absorbed a merged-in stacked PR
  (drops the merged-in commits silently)

# graphify

- **graphify** (`~/.claude/skills/graphify/SKILL.md`) - any input to knowledge graph. Trigger: `/graphify`
When the user types `/graphify`, invoke the Skill tool with `skill: "graphify"` before doing anything else.
