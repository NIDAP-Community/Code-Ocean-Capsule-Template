# Code-Ocean-Capsule-Template

Template to create new Code Ocean Capsules for NIDAP <!-- TODO replace this with a one-line description for your capsule -->

- [Code Ocean Capsule](https://poc-nci.codeocean.io/capsule/TODO/tree) | [Latest Release](https://poc-nci.codeocean.io/capsule/TODO/tree/latest) <!-- TODO edit these URLs with the actual ID for your capsule -->

<!-- start-template -->
## Using this template

### Initial setup

1. Create a new repo from this template.
1. Run the `init` workflow in github actions.

### On Code Ocean

  1. Import this repo into Code Ocean as a new capsule.
  1. Switch to the `dev` branch.
  1. Edit the capsule metadata with the capsule name and description, choose your starter environment if needed.
  1. Edit the README with the capsule URL and other info.
  1. Commit and push your changes from Code Ocean to GitHub.

### First Pull Request

1. On GitHub, open a Pull Request to merge the `dev` branch into `main`.
1. Ensure you have addressed all TODO comments in the repo, and delete the comments once complete.
1. Delete these template instructions from the README (everything between the `start-template` and `end-template` comments).
1. Review the PR and merge it if everything looks correct and the CI checks succeed.

### Develop your capsule

- Use GitHub Flow for contributing changes: make a branch, make your edits in the branch, then open a Pull Request to merge your branch with main.
- Edit the main script (`code/main.R`) and the app panel (`.codeocean/app-panel.json`). Ensure every parameter in the app panel is also a CLI argument in the main script.
- Write or edit tests in `tests/testthat/` to ensure the capsule functionality is covered. Always write tests when contributing bug fixes and new features.

<!-- end-template -->