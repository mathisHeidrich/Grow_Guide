# Plan: Migration to Drift

## 1. Goal
Migrate the entire local database from Isar to Drift (SQLite) to fix Web compilation limitations and achieve stable, cross-platform persistence (macOS, iOS, Android, and Web).

## 2. Dependencies
- **Remove**: `isar`, `isar_flutter_libs`, `isar_generator`
- **Add**: `drift`, `sqlite3_flutter_libs`, `path_provider`, `path`
- **Add (Dev)**: `drift_dev`, `build_runner`

## 3. Database Schema (Drift)
### Tables
We will convert `lib/models/plant.dart` and `lib/models/app_settings.dart` into Drift tables.
- **PlantsTable**:
  - Store enums as integers (`IntEnum`).
  - Store fields like `waterVolumeLiters`, `nutrientBrand`, `lampWattage`, `rootsReachedWater`, etc.
  - Generates a `Plant` data class.
- **LogEntriesTable**:
  - Replaces the `@embedded` `LogEntry` list.
  - Columns: `id`, `plantId` (References `PlantsTable`), `timestamp`, `ph`, `ec`, `ppfd`.
- **AppSettingsTable**:
  - Columns: `id` (Always 1), `hasCompletedOnboarding`, `hasCompletedTentSetup`.
  - Generates an `AppSetting` data class.

## 4. Implementation Steps
1. **Update pubspec.yaml**: Remove Isar, add Drift.
2. **Create Database Class (`lib/services/database.dart`)**:
   - Define `AppDatabase` extending `_$AppDatabase`.
   - Setup native connection (`NativeDatabase`) and web connection fallback.
3. **Refactor Models**:
   - Rewrite `Plant` and `AppSettings` as Drift `Table`s.
   - Run `build_runner` to generate `database.g.dart`.
4. **Refactor Repositories & UI**:
   - Change `db.plants.put(...)` to `db.into(db.plantsTable).insert(...)`.
   - Update `router.dart`, `dashboard_screen.dart`, `germination_wizard_screen.dart`, etc., to use the new Drift queries (`db.select(...)`).
   - Rewrite `MockDatabaseService` to use `NativeDatabase.memory()`.
5. **Testing**:
   - Verify web-server compilation.
   - Run `scenario_launcher` via native macOS to ensure the UI behaves correctly.

## 5. Subagents Strategy
- **Coordinator (Me)**: Scaffolds the Drift Database connection, updates `pubspec.yaml`, and generates the schema.
- **Subagent (UI/Queries Refactor)**: Refactors all UI files (`dashboard_screen`, `checkin_screen`, `router.dart`, `germination_wizard_screen`, `add_plant_screen`, `tent_setup_screen`) to use Drift instead of Isar.
