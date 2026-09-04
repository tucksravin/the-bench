# Bench conventions

## Project layout

Every project under `projects/` is **self-contained**. It owns its `Makefile`,
`.venv`, `requirements.txt`, `firmware/`, `scripts/`, `tests/`, `doc-src/`, and
its own `docs/superpowers/{specs,plans}/`. Nothing at the bench root is required
for a project to build.

That is deliberate: the tooling is validated against real hardware, and a
project that depends on root-level state can't be verified in isolation or
lifted back out.

## What belongs at the bench root

Only what is genuinely shared across builds: the parts inventory, bench lore,
these conventions, and the adding-a-project procedure. When in doubt, it goes in
the project.

## Paths and cwd

Bench scripts are cwd-sensitive by design — they write next to the project, not
next to themselves. Always drive them through make:

    make test                     # default project
    make PROJ=<name> test
    make -C projects/<name> test

Running a script by path from the bench root will scatter its output into the
monorepo root, outside the reach of the project's `.gitignore`.

## History

Projects are brought in with `git subtree`, so their commits are preserved.
One consequence to know: **`git log --follow` returns nothing** for files inside
a subtree, and `git log -- projects/<name>/<file>` shows only the merge.
`git blame` still works. To read a file's real history, use the pre-merge tip
recorded in `adding-a-project.md`:

    git log <pre-merge-tip> -- firmware/<file>

## Secrets

Credentials live in a gitignored `secrets.h` (or equivalent) inside the project,
never in a tracked file. The tracked `secrets.example.h` documents the shape.
Because these files are ignored, **they are not carried by any git operation** —
they must be hand-copied when a project moves, and they are the first thing to
check when a migrated project's radio comes up dead.
