---
description: Read-only review cycle on a pull or merge request URL, including triage of its open review threads.
argument-hint: <PR or MR URL> [issue URLs]
---

The `analyst` builds the brief: description and metadata, every review thread (author, file, line, body, resolved or not), linked issue requirements, project conventions. The `reviewer` reviews the diff against that brief and checks that it addresses the linked issues.

Then one `fixer` per reviewer critique and per unresolved thread, in parallel. With the branch checked out locally, fixers reproduce. Otherwise the verification is diff-only, and the report says so. A thread the current diff already handles is `Invalid`, reason « addressed ».

Report:

```markdown
## PR review: <title>

Verification: branch checked out locally | diff-only

### Critiques
| Severity | File | Line | Critique | Verdict |

### Threads
| Author | Thread | Verdict |

### Verdict
Approve / Approve with nits / Request changes / Needs discussion, and two sentences why.
```

No comments, approvals, or thread resolutions on the PR, and no file changes beyond fixer reproduction tests. One sentence per critique unless it needs more.

## Task

$ARGUMENTS
