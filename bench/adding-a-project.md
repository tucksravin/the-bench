# Adding a project to the bench

Brings an existing repo in under `projects/<name>/` with its history intact.
Each step exists because skipping it caused a real failure during the
octagonal-led-turn-counter migration.

## 1. Push the source first

    git -C <source> push origin main
    git -C <source> rev-list --left-right --count origin/main...main   # must be 0 0

Not optional. It is the pre-move backup, and it forces you to notice unpushed
work.

## 2. Subtree from the LOCAL path, never the remote URL

`git subtree add <url> main` is a plain fetch of whatever that repository has.
If local `main` is ahead of `origin/main`, the difference is **silently
dropped** — during the turn counter migration this would have imported 60 of 66
commits, losing an entire feature with no error.

    git remote add <name>-src /absolute/path/to/source
    git fetch <name>-src
    git log --oneline <name>-src/main | wc -l     # assert the expected count

## 3. Never pass `--squash`

`--squash` replaces the source tip with a synthetic parentless commit; the real
commits become unreachable. That is a fresh import wearing a subtree's clothes.

    git subtree add --prefix=projects/<name> <name>-src/main

The prefix must **not** already exist — subtree refuses otherwise. So this comes
before any hand-copying.

    git remote remove <name>-src

## 4. Hand-copy what git carries none of

`git subtree` moves tracked content only. Everything gitignored stays behind and
dies with the old checkout. Enumerate it first:

    git -C <source> status --ignored --short

Typical keepers: `secrets.h` (credentials — often exist nowhere else on disk),
recorded measurement data, `.claude/settings.local.json`. Typical discards:
`.venv`, `build/`, `__pycache__`, `.pytest_cache`.

Verify afterwards that a copied secret is still ignored at its new depth:

    git check-ignore -v projects/<name>/path/to/secrets.h   # must resolve
    git status --porcelain                                   # must stay empty

## 5. Recreate the venv — never copy it

A copied venv's interpreter survives relocation, but every console script in
`.venv/bin/` carries a shebang hard-coded to the old absolute path and becomes
`bad interpreter` once the old directory is gone.

    cd projects/<name>
    python3 -m venv .venv && .venv/bin/python3 -m pip install -r requirements.txt

## 6. Record what the merge does not

A subtree merge records the split sha but **never the source URL**. Add a row
here so provenance survives:

| Project | Source | Pre-merge tip | Imported |
|---|---|---|---|
| octagonal-led-turn-counter | `github.com/tucksravin/octagonal-led-turn-counter` (archived) | *(record at migration)* | 2026-09 |

## 7. Update the shared layer

Add the project to the root `README.md` and `CLAUDE.md` tables. Fold any
reusable parts into `inventory.md`, and any hard-won failure signatures into
`bench/lore.md`.
