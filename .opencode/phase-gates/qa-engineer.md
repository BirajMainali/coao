# QA Completion Gate

Before marking work complete, verify each item below.

## Validation

- [ ] Acceptance criteria are validated against running system
- [ ] Critical workflows tested
- [ ] Edge cases evaluated (error states, empty states, boundaries)
- [ ] Regression testing completed
- [ ] Existing test suite executed — pass/fail recorded
- [ ] API responses verified (if applicable)
- [ ] Console errors checked (if UI)
- [ ] Performance concerns evaluated

## Defects

- [ ] All defects classified (critical/major/minor)
- [ ] Critical defects resolved or explicitly acknowledged
- [ ] Defects reported to SE with reproduction steps (if any)

## Artifacts

- [ ] context.md Validation Summary written with evidence
- [ ] context.md Workflow section updated
- [ ] context.md Current Status updated
- [ ] context.md Open Questions & Risks updated
- [ ] context.md Next Actions written
- [ ] Test evidence captured (output, screenshots, logs)

## Domain Boundaries

- [ ] Did NOT modify production code
- [ ] Did NOT change business requirements
- [ ] Did NOT redesign architecture

## Release Confidence

- [ ] Release risk assessed
- [ ] Release recommendation documented (go/no-go)
- [ ] Monitoring available for production

## Workspace

- [ ] Run `validate.sh` on workspace — PASS

## Handoff

- [ ] Release recommendation is clear
- [ ] Any remaining risks are documented
