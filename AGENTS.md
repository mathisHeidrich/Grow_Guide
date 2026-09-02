# Agent Guidelines & Rules

## Localization (i18n)
- **NO HARDCODED STRINGS:** Texts meant for the user interface must never be hardcoded directly into Dart files (e.g., `Text('Hello')`).
- **USE .ARB FILES:** All strings must be placed in the respective `.arb` files (e.g., `app_de.arb`).
- **USE AppLocalizations:** Access texts in the UI using `AppLocalizations.of(context)!.stringName`.
- **UPDATE MULTIPLE LANGUAGES:** When adding a new string, make sure to add it to all available language `.arb` files if multiple are present, or at least the default language file.

## Testing & Time Travel
- **NO DATETIME.NOW():** Never use `DateTime.now()` directly in the code. Always use `ref.watch(timeProvider)` (in widgets) or `ref.read(timeProvider)` (in methods/callbacks) to allow time travel.
- **TESTING ENVIRONMENT:** The production entry is `lib/main.dart`. The testing entry is `lib/main_test_env.dart`. Do not mix test/mock code into production.
- **NEW SCENARIOS:** When building complex features, add a `TestScenario` in `lib/testing/scenarios.dart`.

## Git Workflow & Branching
- **NEVER COMMIT TO MASTER:** Agents must never make direct code changes on the `master` or `main` branch.
- **CREATE FEATURE BRANCHES:** Before making any code changes, always create a new branch (e.g., `feature/new-ui` or `fix/bug`).
- **COMMIT AFTER EVERY CHANGE:** Make a commit immediately after each logical change or step. Do not wait until the very end to batch all changes into one commit.
- **TEAMWORK / SUBAGENTS:** If a task can be parallelized, invoke subagents using the `branch` or `share` workspace mode so they can work on separate branches simultaneously.

## Project Knowledge & Architecture
- **TECH STACK:** Flutter, Riverpod (State Management & Dependency Injection), Isar (Local Database), GoRouter (Navigation).
- **DOMAIN:** "Grow Guide" - A highly guided, step-by-step tutorial app for cannabis cultivation (specifically Deep Water Culture / DWC). The app actively guides users through all life cycle phases: onboarding, germination, veg, flower, drying, curing, and archived.
- **UI/THEMING:** Dark mode by default (Scaffold: `#121212`, Cards: `#1E1E1E`, Primary: `#00E676`). Use `Theme.of(context)` rather than hardcoded colors where possible.
  
# CRITICAL RULES - MUST FOLLOW

## 1. BRANCHING (MANDATORY INITIAL STEP)
- **NEVER COMMIT TO MASTER:** Agents must never make direct code changes on the `master` or `main` branch.
- **ALWAYS CREATE A BRANCH FIRST:** Before doing *any* work (planning, coding, or fixing), you must create a new branch (e.g., `feature/ui-update`, `fix/login-bug`, `chore/update-docs`).

## 2. APP FEATURES & UI/UX (PLANNING REQUIRED)
When the user requests changes or additions to the App itself (UI, UX, new features, screens, database models):
- **PLAN FIRST:** You must create or update a markdown plan in `.agents/plans/` detailing the exact changes. Include as much information as possible.
- **WAIT FOR APPROVAL:** You must pause and explicitly ask the user for approval on the plan.
- **IMPLEMENT AFTER APPROVAL:** Only after the user confirms the plan are you allowed to modify Dart files or implement the code.
- **Never assume design, tech stack or features.** Always ask clarifying questions.

## 3. PROJECT STUFF (NO PLAN REQUIRED)
When the user requests changes to meta-project files, documentation (like `AGENTS.md`), or simple configuration tweaks:
- You do **NOT** need to create a plan in `.agents/plans/`.
- You can implement these changes directly on your feature branch without asking for prior plan approval.

## 4. IMPLEMENTATION & TEAMWORK
- **USE SUB-AGENTS:** Never implement features yourself when possible. Identify changes from the plan that can be implemented in parallel, and use sub-agents to implement the features efficiently. Act as a coordinator only.
- **COMMIT FREQUENTLY:** Make a commit immediately after each logical change or step. Do not wait until the very end.
- **QUALITY CHECKS:** After completing features (large or small), always run commands like lint, type check and build to check code quality.
- **AUTOMATED UI TESTING:** Always test UI/App changes autonomously using the web-testing plugin (Puppeteer MCP). Run a background session (`flutter run -d web-server --web-renderer html --web-port 8080`) and trigger hot reload ('r') between code changes instead of restarting the server.
- **CODE REVIEW:** Use a sub-agent to search for dead code, unneeded complexity, or duplicate functionality in the whole codebase.

## 5. RESPONSES
- Keep responses concise and to the point - unless the user asks otherwise.
