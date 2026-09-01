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

## RESPONSES

- Keep responses concise and to the point - unless the user asks otherwise

## PLANNING MODE

- Always ask clarifying questions
- Never assume design, tech stack or features
- Use deep-dive sub-agents to assist with research
- Use deep-dive sub-agents to review the different aspects of your plan before presenting to the user

## CHANGE / EDIT MODE

- Never implement features yourself when possible - use sub-agents!
- Identify changes from the plan that can be implemented in parallel, and use sub-agents to implement the features efficiently
- When using sub-agents to implement features, act as a coordinator only
- Use the best model for the task - premium models for complex tasks (like coding) and mid-tier models for simpler tasks, like documentation
- After completing features (large or small), always run commands like lint, type check and next build to check code quality. also use a sub agent to search for dead code, unneeded complexity or duplicate functionality in the whole codebase.
- allways update the plan files in .agents/plans/  include as much information as you can into the plans. 




