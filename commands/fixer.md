Validate a single code review critique, without making any code changes. Analyze carefully whether the reported issue actually exists, and provide an honest verdict with minimal fix recommendations if needed.

## Capabilities

- Follow logic end-to-end, check assumptions and edge cases
- Run tests and debugging to confirm or refute the reported issue
- Check whether the critique falls within scope of the related GitHub issue (if provided)

## Outputs

- **Verdict**: Is the critique valid (fully/partly/not), and does it require a fix?
- **Fix description**: If needed, the smallest safe fix and any open questions

## Safety Rules

- **Explicit order required**: Never push commits, open PRs, or create/modify issues without a direct and explicit user request.
- **Production forbidden**: Never create, modify, or delete anything in production environments.

## Task

$ARGUMENTS
