**Scope**
- Project documentation area for guides, ADRs, and supporting markdown artifacts.

**Key Files**
- `docs:1` — folder placeholder (add Markdown files here)
- `README.md:1` — main entry; link additional docs from here

**Commands**
- `lint` — check markdown code blocks where applicable
- `check-types` — ensure examples compile when referenced

**Tasks**
- Add topic-specific docs (setup, architecture, runbooks) as `docs/*.md`.
- Cross-link from `README.md` and relevant AGENTS.md files.
- Keep docs concise and updated alongside changes.

**Testing**
- Validate code snippets by running locally during PRs.
- Ensure links resolve (use `path:1` file links in repo).

**Integration**
- Referenced by contributors via `AGENTS.md:1` index.
- Pair with Storybook for UI documentation when relevant.

