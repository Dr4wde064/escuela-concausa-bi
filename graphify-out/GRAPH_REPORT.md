# Graph Report - .  (2026-08-03)

## Corpus Check
- cluster-only mode — file stats not available

## Summary
- 6 nodes · 8 edges · 2 communities (1 shown, 1 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `c826afa8`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- vault_lint.py
- strip_code

## God Nodes (most connected - your core abstractions)
1. `main()` - 4 edges
2. `strip_code()` - 3 edges
3. `find_md()` - 2 edges
4. `stem()` - 2 edges
5. `Quita bloques y spans de código para no leer links de ejemplo.` - 1 edges

## Surprising Connections (you probably didn't know these)
- `main()` --calls--> `strip_code()`  [EXTRACTED]
  _Meta/scripts/vault_lint.py → _Meta/scripts/vault_lint.py  _Bridges community 1 → community 0_

## Import Cycles
- None detected.

## Communities (2 total, 1 thin omitted)

### Community 0 - "vault_lint.py"
Cohesion: 0.83
Nodes (3): find_md(), main(), stem()

## Knowledge Gaps
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `strip_code()` connect `strip_code` to `vault_lint.py`?**
  _High betweenness centrality (0.400) - this node is a cross-community bridge._
- **Why does `main()` connect `vault_lint.py` to `strip_code`?**
  _High betweenness centrality (0.250) - this node is a cross-community bridge._