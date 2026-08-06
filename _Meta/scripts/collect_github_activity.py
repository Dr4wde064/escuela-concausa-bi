#!/usr/bin/env python3
"""Recopila actividad agregada de GitHub para el tablero PM sin exponer tokens.

Requiere GITHUB_TOKEN y GITHUB_REPOSITORY. Está pensado para GitHub Actions.
La salida complementa el tablero; nunca cambia el estado canónico de una US.
"""

from __future__ import annotations

import json
import os
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path


def api(url: str, token: str) -> object:
    request = urllib.request.Request(
        url,
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {token}",
            "X-GitHub-Api-Version": "2022-11-28",
            "User-Agent": "faro-pm-dashboard",
        },
    )
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.load(response)


def main() -> int:
    token = os.environ.get("GITHUB_TOKEN", "")
    repository = os.environ.get("GITHUB_REPOSITORY", "")
    if not token or not repository:
        print("GITHUB_TOKEN/GITHUB_REPOSITORY no disponibles; se conserva modo local.")
        return 0
    base = f"https://api.github.com/repos/{repository}"
    try:
        pulls = api(f"{base}/pulls?state=all&per_page=100&sort=updated&direction=desc", token)
        runs = api(f"{base}/actions/runs?per_page=20", token)
    except (urllib.error.URLError, TimeoutError) as error:
        print(f"No se pudo consultar GitHub: {error}", file=sys.stderr)
        return 1
    pr_items = []
    for pull in pulls if isinstance(pulls, list) else []:
        text = f"{pull.get('title', '')} {pull.get('body', '')}"
        pr_items.append(
            {
                "number": pull.get("number"),
                "title": pull.get("title"),
                "state": "merged" if pull.get("merged_at") else pull.get("state"),
                "author": (pull.get("user") or {}).get("login"),
                "created_at": pull.get("created_at"),
                "merged_at": pull.get("merged_at"),
                "url": pull.get("html_url"),
                "story_ids": sorted(set(re.findall(r"US-\d{3}[a-z]?", text))),
            }
        )
    output = {
        "available": True,
        "repository": repository,
        "prs": pr_items,
        "ci": [
            {
                "name": run.get("name"),
                "status": run.get("status"),
                "conclusion": run.get("conclusion"),
                "url": run.get("html_url"),
            }
            for run in (runs.get("workflow_runs", []) if isinstance(runs, dict) else [])
        ],
        "note": "Actividad agregada; no determina Done ni se usa como ranking individual.",
    }
    path = Path("13_Reports/data/github-activity.json")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"✅ Actividad GitHub recopilada: {len(pr_items)} PR.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
