# Work Item Relationships

```yaml
work_item:
  id: "<type>s/<slug>"
  type: <feature|fix|task|spike|chore|project|knowledge>
  title: "<short title>"
  status: <active|done|archived>

relationships:
  - type: <depends-on|implements|relates-to|supersedes|blocked-by|references|promotes-to>
    target: "<path to work item, knowledge entry, or file>"
    description: "<why they are related>"
```

## Relationship Types

| Type | Direction | Meaning |
|------|-----------|---------|
| `depends-on` | → | This item requires the target to be done first |
| `implements` | → | This item implements functionality described by the target |
| `relates-to` | ↔ | Conceptually related — useful context for both |
| `supersedes` | → | This item replaces or deprecates the target |
| `blocked-by` | → | This item is currently blocked by the target |
| `references` | → | This item references the target for additional context |
| `promotes-to` | → | Knowledge was promoted from this item to the target |

## Examples

```yaml
relationships:
  - type: depends-on
    target: "features/user-auth"
    description: "Need auth before building the dashboard"
  - type: relates-to
    target: "fixes/login-error"
    description: "Same login flow, different bug"
  - type: references
    target: "knowledge/decisions/ADR-001-auth-strategy.md"
    description: "Auth strategy decision that shapes this work"
  - type: promotes-to
    target: "knowledge/patterns/repository-pattern.md"
    description: "Extracted repository pattern used here"
```
