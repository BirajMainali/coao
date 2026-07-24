# Research: COAO Improvement Analysis

## Summary

Comprehensive audit of the COAO project itself — its rules, agents, scripts, templates, documentation, and infrastructure — to catalog every gap, bug, and improvement opportunity. 15 areas identified across 5 categories: structural defects, infrastructure, governance, content, and documentation.

---

## Methodology

1. Read every file in `.opencode/` (rules, agents, skills, templates, scripts, config)
2. Read every file in `.coao/` (existing work items, context graph)
3. Read `install.sh`, `README.md`, `knowledge/`
4. Ran `git log` to understand project history
5. Classified findings by: category, severity (critical/major/minor), effort (S/M/L/XL), impact (H/M/L)

---

## Findings

### Category A: Structural Defects (Bugs)

| # | Finding | File | Severity | Effort | Impact | Detail |
|---|---------|------|----------|--------|--------|--------|
| A1 | `project` type not accepted by scaffold.sh | `.opencode/scripts/scaffold.sh:15` | Critical | S | H | Type validation rejects `project`; plural mapping and role assignment both silently skip it. Using scaffold.sh with type `project` produces an error. Workaround: manual setup. |
| A2 | `project` has no role mapping in scaffold.sh | `.opencode/scripts/scaffold.sh:31-37` | Critical | S | H | Project should include all 4 agents (PO, SA, SE, QA) like feature. Falls through with no roles. |
| A3 | validate.sh does not check `research.md` | `.opencode/scripts/validate.sh` | Major | S | M | Research spike workspaces need `research.md` but validator only checks context.md, decisions.md, relationships.md. |
| A4 | validate.sh does not check `research-brief.md` | `.opencode/scripts/validate.sh` | Major | S | M | When True Researcher is consulted, a research-brief.md should exist but isn't validated. |
| A5 | No root `.gitignore` | repo root | Minor | S | L | `.opencode/.gitignore` exists but only covers node_modules. No root `.gitignore` for OS files, IDE files, etc. |
| A6 | README workspace layout out of date | `README.md:54-61` | Major | S | M | Shows old layout (without relationships.md, research-brief.md). Doesn't reflect context.md cross-ref sections. |
| A7 | generate-context-graph.sh YAML parsing fragile | `.opencode/scripts/generate-context-graph.sh:41-66` | Minor | S | L | Line-by-line grep/sed parsing breaks on multi-line values, quoted strings with colons, or indentation inconsistencies. |

### Category B: Infrastructure & CI/CD

| # | Finding | Current state | Severity | Effort | Impact | Detail |
|---|---------|---------------|----------|--------|--------|--------|
| B1 | No CI pipeline | No `.github/` directory | Major | M | H | No automated validation on push/PR. Changes to rules, agents, scripts can break silently. No guard against regressions. |
| B2 | No automated context-graph regeneration | Manual step only | Major | M | M | Context graph requires agent to remember running generator. CI could regenerate on merge to main. |
| B3 | No install verification | No checksum, no signature | Minor | M | M | Users can't verify they got the intended version. No protection against man-in-the-middle. |
| B4 | No shellcheck/linting on scripts | Scripts are bash-only | Minor | S | M | shellcheck could catch portability and safety issues in validate.sh, scaffold.sh, generate-context-graph.sh, install.sh. |

### Category C: Self-Governance & Process

| # | Finding | Current state | Severity | Effort | Impact | Detail |
|---|---------|---------------|----------|--------|--------|--------|
| C1 | No COAO evolution process | No rules for changing COAO itself | Major | M | H | COAO defines work item types, agents, and rules for user projects but has no meta-process for evolving itself. Changes to `.opencode/` are ungoverned. |
| C2 | No versioning or changelog | No releases, no tags, no CHANGELOG | Major | M | H | install.sh downloads `master` branch HEAD. Users get whatever is latest with no predictability. No way to roll back. |
| C3 | No contribution guidelines | No CONTRIBUTING.md, no issue/PR templates | Minor | M | M | External contributors have no guidance on how to propose changes. |
| C4 | No test coverage for COAO itself | No tests | Major | L | H | No way to verify that a change to rules/agents/scripts produces correct behavior. validate.sh checks structure, not semantics. |

### Category D: Knowledge Bootstrap

| # | Finding | Current state | Severity | Effort | Impact | Detail |
|---|---------|---------------|----------|--------|--------|--------|
| D1 | Knowledge store completely empty | All `knowledge/` subdirs empty except `candidates/README.md` | Major | M | H | Knowledge Steward agent exists but has never been exercised. No ADRs, standards, patterns, runbooks, or lessons. The promotion pipeline is untested. |
| D2 | Existing decisions not promoted to ADRs | Context-graph and elicitation have decisions.md but nothing in `knowledge/decisions/` | Major | S | M | D-001 through D-004 from both features are organizational-quality decisions ready for ADR promotion. |
| D3 | No patterns extracted from COAO patterns | COAO's own architecture (workspace pattern, consultation model, artifact communication) could be documented as reusable patterns | Minor | S | M | The patterns COAO uses are good candidates for `knowledge/patterns/`. |

### Category E: Documentation & Onboarding

| # | Finding | Current state | Severity | Effort | Impact | Detail |
|---|---------|---------------|----------|--------|--------|--------|
| E1 | README doesn't cover new features | No mention of elicitation discipline or context graph | Major | S | M | README is the user's first impression. Missing recent additions makes COAO look less capable than it is. |
| E2 | No quick-start tutorial | README has "How It Works" but no step-by-step walkthrough | Minor | M | M | A concrete example (e.g., "build a todo API") showing each agent and the full workflow would reduce onboarding friction. |
| E3 | No example project | No reference implementation using COAO | Minor | XL | L | An example repo consuming COAO would demonstrate real usage patterns. High effort, lower priority. |
| E4 | AGENTS.md skills list incomplete | Doesn't list all skills from system prompt | Minor | S | M | Skills like `diagnose`, `grill-me`, `grill-with-docs`, `handoff`, `improve-codebase-architecture`, `tdd`, `to-issues`, `to-prd`, `triage`, `zoom-out`, `find-skills` exist in the agent runtime but aren't documented. |

### Category F: Skill Gaps

| # | Finding | Current state | Severity | Effort | Impact | Detail |
|---|---------|---------------|----------|--------|--------|--------|
| F1 | No "start work item" skill | Users manually follow initiation.md | Minor | M | M | A skill that wraps the initiation sequence: classify, scaffold, create relationships.md, prompt for confirmation. |
| F2 | No "complete work item" skill | Users manually follow agent completion steps | Minor | M | M | A skill that runs validate.sh, promotes knowledge, rebuilds context-graph, archives workspace. |
| F3 | No "knowledge review" workflow | Knowledge Steard triggered manually | Minor | M | M | A scheduled or event-driven workflow for triaging knowledge/candidates/. |

---

## Recommendations

### Quick Wins (S effort, H/M impact)

| Priority | Item | Action |
|----------|------|--------|
| P0 | A1, A2 | Fix scaffold.sh: add `project` to type validation, plural mapping, and role mapping |
| P1 | A3, A4 | Fix validate.sh: check for research.md, research-brief.md |
| P2 | A6 | Update README workspace layout to match current `.opencode/rules/operations/workspace.md` |
| P3 | D2 | Promote feature decisions to ADRs in `knowledge/decisions/` |
| P4 | E1 | Update README to mention elicitation culture and context graph |
| P5 | E4 | Sync AGENTS.md skills list with available skills from system prompt |
| P6 | A7 | Harden generate-context-graph.sh YAML parsing (use grep -A patterns or awk) |

### Strategic Investments (M-L effort, H impact)

| Priority | Item | Action |
|----------|------|--------|
| P0 | C4 | Add test suite for COAO — shellcheck scripts, validate YAML front-matter, verify template rendering |
| P1 | B1 | Set up GitHub Actions: run validate.sh + shellcheck on PR, auto-generate context-graph on merge to main |
| P2 | C1 | Write meta-governance rule: "how COAO itself evolves" — use its own work item types for changes |
| P3 | C2 | Set up versioned releases with CHANGELOG.md; update install.sh to support version pinning |
| P4 | D1 | Run Knowledge Steward to triage knowledge/candidates/ and bootstrap initial knowledge base |
| P5 | B2 | Add CI step to regenerate context-graph.md and commit if changed |

### Nice-to-Haves (M-XL effort, M impact)

| Priority | Item | Action |
|----------|------|--------|
| P1 | F1, F2 | Build COAO workflow skills (start work item, complete work item) |
| P2 | C3 | Add CONTRIBUTING.md, issue/PR templates |
| P3 | E2 | Write quick-start tutorial |
| P4 | B3 | Add checksum verification to install.sh |

---

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| COAO evolves without governance, rules drift | High | High | Write meta-governance rule (C1) as P0 strategic item |
| Script bugs cause workspace corruption | Low | High | Add shellcheck + tests (C4, B1) as P0 strategic |
| Knowledge store stays empty, Steward atrophies | Medium | Medium | Bootstrap knowledge (D1/D2) as quick wins |
| Users confused by stale README | Medium | Low | Update README (A6, E1) as quick wins |
| Install.sh breaks on branch rename | Low | Medium | Pin to tag, not branch (C2) in strategic |

---

## Sources

- Full source audit of `.opencode/` (all 25+ files)
- Full source audit of `.coao/context-graph.md`
- Full source audit of `install.sh`, `README.md`, `knowledge/`
- Git log: 20 commits analyzed for project trajectory
