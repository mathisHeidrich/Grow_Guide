# Agent Guidelines & Rules

> [!CAUTION]
> **CRITICAL INITIAL STEPS - YOU MUST EXECUTE THESE IN ORDER:**
> 1. **CHECK BRANCH:** Run `git status`. If you are on `master` or `main`, YOU MUST CREATE A NEW BRANCH using `git checkout -b <branch-name>` BEFORE DOING ANYTHING ELSE.
> 2. **PLANNING:** If the user requests app changes (UI, UX, features), you MUST create a markdown plan in `.agents/plans/` and then **STOP CALLING TOOLS**. You are FORBIDDEN from modifying Dart files until the user explicitly says "Plan approved".

## 1. Git Workflow & Branching
- **NEVER COMMIT TO MASTER:** Direct code changes on the `master` or `main` branch are strictly forbidden.
- **ALWAYS CREATE A BRANCH FIRST:** E.g., `feature/ui-update`, `fix/login-bug`.
- **COMMIT FREQUENTLY:** Make a commit immediately after each logical step. Do not batch everything at the end.
- **TEAMWORK / SUBAGENTS:** Use `branch` or `share` workspaces to parallelize subagents.

## 2. Planning & Approval (MANDATORY FOR APP CHANGES)
When the user requests changes to the App itself (UI, UX, features, logic):
- **PLAN FIRST:** Create or update a detailed markdown plan in `.agents/plans/`.
- **WAIT FOR APPROVAL:** You MUST stop executing tools and explicitly ask the user for approval. 
- **NO CODING BEFORE APPROVAL:** Do not modify Dart code until the plan is confirmed.
- **EXCEPTIONS:** Changes to meta-files, docs (like `AGENTS.md`), or project config do *not* require a plan. You can implement these directly on your feature branch.

## 3. Localization (i18n)
- **NO HARDCODED STRINGS:** Texts meant for the UI must never be hardcoded (e.g., `Text('Hello')`).
- **USE .ARB FILES:** Place strings in `.arb` files (e.g., `app_de.arb`).
- **USE AppLocalizations:** Access via `AppLocalizations.of(context)!.stringName`.
- **UPDATE MULTIPLE LANGUAGES:** Add new strings to all available language `.arb` files, or at least the default.

## 4. Testing & Time Travel
- **NO DATETIME.NOW():** Never use `DateTime.now()`. Use `ref.watch(timeProvider)` or `ref.read(timeProvider)`.
- **TESTING ENVIRONMENT:** Production entry: `lib/main.dart`. Testing entry: `lib/main_test_env.dart`. Do not mix test/mock code into production.
- **NEW SCENARIOS:** Add a `TestScenario` in `lib/testing/scenarios.dart` for complex features.

## 5. Project Knowledge & Architecture
- **TECH STACK:** Flutter, Riverpod, Drift (SQLite), GoRouter.
- **DOMAIN:** "Grow Guide" - step-by-step tutorial app for cannabis cultivation (DWC).
- **UI/THEMING:** Dark mode by default (Scaffold: `#121212`, Cards: `#1E1E1E`, Primary: `#00E676`). Use `Theme.of(context)`.

## 6. Implementation & Teamwork
- **USE SUB-AGENTS:** Do not implement everything yourself. Delegate parallel tasks to sub-agents.
- **QUALITY CHECKS:** Run lint, type check, and build after features are done.
- **AUTOMATED TESTING:** Test autonomously using Puppeteer MCP (`flutter run -t lib/main_test_env.dart -d web-server --web-renderer html --web-port 8080`). Use hot reload ('r').
- **CODE REVIEW:** Search for dead code or unneeded complexity with a sub-agent.

## 7. Responses
- Keep responses concise and to the point.
