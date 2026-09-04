---
name: consistency-check
description: >-
  Use this skill to check the app's consistency across code, architecture, UI texts (localization), and buttons/UI components.
  It helps enforce project rules, maintain a unified tech stack, and ensure uniform design patterns.
---

# Consistency Check Skill

This skill guides you through checking the Grow Guide app for consistency in various domains. When asked to perform a consistency check or when auditing the app, follow these guidelines and steps:

## 1. Code & Architecture Consistency
- **Tech Stack**: Ensure the code strictly uses Flutter, Riverpod (for State Management & DI), Drift (for local database), and GoRouter (for navigation).
- **State Management**: Verify that Riverpod best practices are followed. Business logic should be encapsulated in Notifiers/Providers, and UI should be reactive.
- **Time Traversal**: Ensure there is no usage of `DateTime.now()`. All time access must use `ref.watch(timeProvider)` or `ref.read(timeProvider)`.
- **Domain Structure**: Ensure files are correctly grouped by feature or domain (e.g., onboarding, germination, veg, flower, drying, curing) and layered correctly (UI, data, models).

## 2. Text & Localization (i18n) Consistency
- **No Hardcoded Strings**: Verify that no UI texts are hardcoded (e.g., `Text('Hello')`).
- **ARB Files**: Check that all user-facing strings are correctly defined in `.arb` files (e.g., `app_de.arb`, `app_en.arb`).
- **Usage**: Ensure texts are accessed via `AppLocalizations.of(context)!.stringName`.
- **Translation Parity**: If multiple language `.arb` files exist, ensure keys are synchronized across all of them.

## 3. UI, Buttons & Theming Consistency
- **Theming**: Ensure the app uses the global theme (`Theme.of(context)`) rather than hardcoded colors.
- **Dark Mode**: Verify the usage of the predefined dark mode palette (Scaffold: `#121212`, Cards: `#1E1E1E`, Primary: `#00E676`).
- **Component Reusability**: Ensure buttons, cards, and input fields use shared, reusable widget classes instead of redefining styles inline. 
- **Design Intent**: Check for aesthetic alignment (typography, padding, spacing) across different screens.

## Execution Steps for the Agent
When tasked with a consistency check:
1. **Analyze**: Use tools like `grep_search` to find common anti-patterns (e.g., `DateTime.now()`, `Text('`, hardcoded colors like `Color(0xFF...`).
2. **Review i18n**: Diff the `.arb` files or check for missing translations.
3. **Lint & Type Check**: Run `flutter analyze` to let the static analyzer find inconsistencies.
4. **Report / Fix**: If tasked with fixing, branch out and make the changes. If large structural changes are needed, present a plan (`implementation_plan.md`) to the user first.
