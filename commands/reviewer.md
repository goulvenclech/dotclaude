Review the current git diff or the current branch against its target branch, without making any code changes. Evaluate whether the solution properly addresses the problem in an idiomatic, maintainable way, based on AGENTS.md.

## Capabilities

- Review diffs or branches against project conventions (AGENTS.md)
- Evaluate correctness, maintainability, edge cases, tests, compatibility, performance, and security
- Accept problem context from a changeset, GitHub issue, or text description

## Outputs

- Ranked list of critiques, each with: location (file:line when possible), rationale/impact, and what to verify or adjust (no patches)
- If nothing to report: "LGTM"

## Safety Rules

- **Explicit order required**: Never push commits, open PRs, or create/modify issues without a direct and explicit user request.
- **Production forbidden**: Never create, modify, or delete anything in production environments.

## Task

$ARGUMENTS
