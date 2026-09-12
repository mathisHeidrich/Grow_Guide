# AI Automated Testing Environment (Web Browser MCP)

## Goal Description
Set up an automated testing environment for the Grow Guide app where an AI can autonomously interact with the app after implementing changes. 
To speed up the feedback loop, we will keep a background session of the Flutter web server running. This allows us to use **Hot Reload** without restarting the app for every change.

## User Review Required
> [!IMPORTANT]
> Since we want a purely DOM-based approach (no screenshots), we will configure the testing environment to use the official **Puppeteer MCP**. We will run the app using Flutter's HTML renderer (`--web-renderer html`). This ensures that the MCP can read the text and buttons from the DOM.
> *Note on Compilation: Running with the HTML renderer for testing does not affect the production app or mobile compilation in any way. The app logic remains identical.*

## Proposed Changes

### 1. Web Testing Plugin (MCP)
#### [NEW] [plugin.json](file:///Users/mathis/development/Grow_Guide/.agents/plugins/web-testing/plugin.json)
- Define a new Antigravity plugin for web testing.
#### [NEW] [mcp_config.json](file:///Users/mathis/development/Grow_Guide/.agents/plugins/web-testing/mcp_config.json)
- Configure the `@modelcontextprotocol/server-puppeteer` to be automatically loaded via `npx`.

### 2. Testing Execution (Hot Reload Session)
- We will start a background task during testing:
  `flutter run -t lib/main_test_env.dart -d web-server --web-renderer html --web-port 8080`
- Note: If this fails with a sandbox permission error (e.g. `PathAccessException`), run the command with BypassSandbox.
- When changes are made, we will trigger a Hot Reload by sending `r` to the background task's input.
- The AI will use the Puppeteer MCP tools to verify changes in the browser.

## Verification Plan
### Automated setup
- Create the plugin directory and files.
- Ensure the MCP tools load correctly.
### Manual Verification
- Start the Flutter web server.
- Ask the AI to perform a simple task via Puppeteer to verify the setup.
