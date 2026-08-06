#!/usr/bin/env python3
"""Valida contrato, cobertura y vínculos del snapshot PM (TEST-002)."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path


VALID_STATES = {"planned", "in_progress", "in_review", "blocked", "done"}


def fail(message: str, failures: list[str]) -> None:
    failures.append(message)


def main(root_value: str = ".") -> int:
    root = Path(root_value).resolve()
    data_path = root / "13_Reports/data/pm-dashboard.json"
    html_path = root / "13_Reports/TABLERO_CONTROL_PM.html"
    failures: list[str] = []
    if not data_path.exists() or not html_path.exists():
        print("❌ Ejecuta primero generate_pm_dashboard.py")
        return 1
    data = json.loads(data_path.read_text(encoding="utf-8"))
    if not re.fullmatch(r"[0-9a-f]{12}", data.get("meta", {}).get("source_fingerprint", "")):
        fail("Fingerprint de fuentes ausente o inválido", failures)
    stories = data.get("stories", [])
    ids = [story.get("id") for story in stories]
    if len(ids) != 87:
        fail(f"Se esperaban 87 US y hay {len(ids)}", failures)
    if len(ids) != len(set(ids)):
        fail("Hay US duplicadas en el snapshot", failures)
    for story in stories:
        if not re.fullmatch(r"US-\d{3}[a-z]?", story.get("id", "")):
            fail(f"ID inválido: {story.get('id')}", failures)
        if story.get("status") not in VALID_STATES:
            fail(f"Estado inválido: {story.get('id')}", failures)
        if story.get("status") == "blocked" and story.get("blocked_since") in {"", "—"}:
            fail(f"{story['id']} bloqueada sin fecha", failures)
        if story.get("status") == "done" and story.get("evidence") in {"", "—"}:
            fail(f"{story['id']} done sin evidencia", failures)
    if len(data.get("people", [])) != 21:
        fail(f"Se esperaban 21 personas y hay {len(data.get('people', []))}", failures)
    if len(data.get("sources", [])) != 8:
        fail(f"Se esperaban 8 fuentes y hay {len(data.get('sources', []))}", failures)
    if round(sum(item.get("points", 0) for item in data.get("rubric", [])), 2) != 10.0:
        fail("Los puntos de rúbrica no suman 10", failures)
    html = html_path.read_text(encoding="utf-8")
    if "__PM_DASHBOARD_DATA__" in html:
        fail("El HTML conserva el marcador sin reemplazar", failures)
    for tab in ["summary", "flow", "cells", "plans", "dependencies", "rubric", "sources", "risks", "governance", "explorer"]:
        if f'id="panel-{tab}"' not in html:
            fail(f"Falta panel {tab}", failures)
    if failures:
        print("❌ Tablero PM inválido:")
        for item in failures:
            print(f"   - {item}")
        return 1
    print("✅ TEST-002: snapshot y tablero PM válidos.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1] if len(sys.argv) > 1 else "."))
