---
name: autonomous-qa
description: Master guide for Autonomous QA. Explains how agents must brainstorm edge cases, write test playbooks, validate UX/UI, and test logic autonomously before requesting user review.
---

# Autonomous QA & Edge Case Testing

Before marking any feature implementation as "done" or presenting it to the user, you MUST complete the Autonomous QA process. Do not rely solely on the user to find logic flaws or UX/UI bugs.

## The QA Workflow

The process consists of two distinct roles/phases. You should spawn specialized subagents to handle these, or explicitly adopt these personas yourself.

### Phase 1: The QA Strategist (Playbook Generation)
Analyze the new code and think like an attacker or a "Devil's Advocate".
1. **Identify Entry Points:** How does a user get to this new screen/feature? What if they use the hardware back button?
2. **State Variations:** What global states affect this feature? (e.g., Is the user offline? Is the plant a seedling vs. in flowering stage? Is this the first launch vs. an ongoing session?)
3. **Logic & Edge Cases:** What happens with extreme inputs, empty lists, or unexpected user behavior? Does the sequence of screens make logical sense?
4. **Create the Playbook:** Auto-generate a markdown file in `.agents/playbooks/<feature>_playbook.md`.

**Playbook Structure Example:**
```markdown
# Playbook: Watermasterclass

## Pre-requisites (Mocking)
- Use `lib/main_test_env.dart` to inject mock state: `PlantStage.flowering`.

## Test 1: Navigation & UX
- **Action:** Go to "Knowledge" -> "Watermasterclass".
- **Expectation:** Card is visible. UX check: Is the layout balanced? Are touch targets large enough? Is contrast accessible?

## Test 2: Edge Case - Interruption
- **Action:** Start lesson 1, then hit "Back".
- **Expectation:** Progress is saved or cleanly reset. No crash.
```

### Phase 2: The QA Tester (Execution & Validation)
Run the app locally and explicitly test the playbook. 
Use `flutter run -t lib/main_test_env.dart -d web-server --web-renderer html --web-port 8080`.

#### 1. Mocking State
If the playbook requires specific states (e.g., plant is flowering), modify `lib/main_test_env.dart` temporarily to override Riverpod providers before starting the app.

#### 2. Logic Validation (Speed & Reliability)
Do not rely exclusively on screenshots for finding buttons or reading text.
Use `puppeteer_evaluate` to extract the DOM text and interactable elements quickly.
Flutter Web creates an accessibility DOM (`<flt-semantics>`).
*Example snippet to read screen text:*
```javascript
() => Array.from(document.querySelectorAll('flt-semantics')).map(e => e.innerText).filter(t => t.trim() !== '')
```

#### 3. UX & UI Validation (Visual Checks)
The user explicitly wants you to check if the app "looks good" and is "usable".
For UX/UI checks, DO use `puppeteer_screenshot`. As an AI with vision capabilities, analyze the screenshot for:
- **Visual Glitches:** Text overflowing its container, clipping, awkward empty spaces.
- **Usability:** Are buttons too small? Are colors clashing (contrast)?
- **Sense & Logic:** Does this layout actually make sense for a human? (e.g., "The 'Next' button is hidden behind a floating action button").

### Phase 3: The Fix Loop
If the QA Tester finds a logical error, a crash, or an ugly UI, **DO NOT STOP**. Fix the issue in the code, hot reload (`r`), and run the test step again. 

Only when the entire Playbook passes (Logic + UX/UI), you may ask the user for approval.
