# Alfred Bashly Template

A minimal template that connects a Bashly CLI to an Alfred Script Filter. Type `hello` in Alfred to see **Hello Alfred**.

## Initial setup

After creating a repository from this template, use **case-sensitive Replace All** in your editor for each name below. For example, to name the workflow “My Workflow”:

| Capitalization | Find | Replace with |
| --- | --- | --- |
| Lowercase repository slug | `alfred-workflow-template-sh` | `my-workflow` |
| Lowercase CLI name | `template-cli` | `my-workflow-cli` |
| Title case display name | `Alfred Bashly Template` | `My Workflow` |
| Bundle ID | `com.example.alfred-bashly-template` | `com.example.my-workflow` |

The CLI name appears in `src/bashly.yml`, both sync and package scripts, the Alfred entry script, `.gitignore`, and this README. The display name appears in both READMEs, `alfred_workflow/info.plist`, and the package script. Choose a unique bundle ID for your workflow. Rename the repository directory separately.

If you add other forms of the CLI name, replace each capitalization separately: `TEMPLATE_CLI` → `MY_WORKFLOW_CLI` (all uppercase), `template_cli` → `my_workflow_cli` (all lowercase), `Template-cli` → `My-workflow-cli` (first letter uppercase), and `TemplateCli` → `MyWorkflowCli` (Pascal case). These forms are examples; the current scripts use `template-cli`.

After replacing the names, run `bashly generate` to create the CLI.

Running the workflow requires macOS, [Alfred](https://www.alfredapp.com/) Powerpack, Bash, and `jq`. For example, install `jq` with Homebrew:

```bash
brew install jq
```

## Dependencies and installation

Developing the CLI also requires [Bashly](https://bashly.dev/). For example:

```bash
brew install bashly
./script/sync-cli.sh
```

`sync-cli.sh` runs `bashly generate` and copies the generated `template-cli` into `alfred_workflow/`. The installed workflow needs Bash and `jq`; Bashly is only needed during development.

## Usage

Run `./script/package.sh`, import the resulting `.alfredworkflow` file, and type `hello` in Alfred. See the [workflow README](alfred_workflow/README.md) for usage instructions. You can also try the CLI and entry script directly:

```bash
./alfred_workflow/template-cli hello
./alfred_workflow/entries/alfred/hello.sh
```

## Development

Define commands in `src/bashly.yml`, implement them in `src/*_command.sh`, and put shared Bashly functions in `src/lib/`. After making changes, run:

```bash
./script/sync-cli.sh
./script/sync-readme.sh
./script/package.sh
```

`alfred_workflow/info.plist` configures the Script Filter. It calls `entries/alfred/hello.sh`, which calls the CLI. Run the entry script directly to check its JSON output, or use Alfred's workflow debugger. `package.sh` packages the workflow directory as an importable file.

Edit [alfred_workflow/README.md](alfred_workflow/README.md) for Alfred's workflow description, then run the sync script. Packaging also syncs it. Follow the [Alfred Gallery Workflow Style Guide](https://alfred.app/submit/styleguide/) when writing the description. The bundled [Bashly project skill](.agents/skills/bashly/SKILL.md) comes from the [official Bashly AI Kit](https://github.com/bashly-framework/bashly-ai-kit).
