setup_cli_workspace <- function(prefix = "template_capsule_test_") {
  workspace <- tempfile(prefix)
  dir.create(workspace)

  code_dir <- file.path(workspace, "code")
  results_dir <- file.path(workspace, "results")
  dir.create(code_dir, recursive = TRUE)
  dir.create(file.path(results_dir, "figures"), recursive = TRUE)

  repo_root <- normalizePath(
    file.path(testthat::test_path(), "..", ".."),
    mustWork = TRUE
  )

  file.copy(
    file.path(repo_root, "code", "main.R"),
    file.path(code_dir, "main.R"),
    overwrite = TRUE
  )
  file.copy(
    file.path(repo_root, "code", "run"),
    file.path(code_dir, "run"),
    overwrite = TRUE
  )

  Sys.chmod(file.path(code_dir, "run"), mode = "0755")

  list(
    workspace = workspace,
    code_dir = code_dir,
    results_dir = results_dir,
    repo_root = repo_root
  )
}

expect_outputs_created <- function(
  results_dir,
  output_subdir = "output",
  summary_filename = "run-summary.txt"
) {
  summary_path <- file.path(results_dir, output_subdir, summary_filename)

  expect_true(
    file.exists(summary_path),
    info = paste("Summary output should exist at", summary_path)
  )
  expect_true(
    file.info(summary_path)$size > 0,
    info = "Summary output should be non-empty"
  )

  summary_lines <- readLines(summary_path, warn = FALSE)
  expect_true(
    any(grepl("^# Template run output$", summary_lines)),
    info = "Summary output should include the template header"
  )
  expect_true(
    any(grepl("^output_subdir:", summary_lines)),
    info = "Summary output should include the output_subdir field"
  )
  expect_true(
    any(grepl("^summary_filename:", summary_lines)),
    info = "Summary output should include the summary_filename field"
  )
}

common_cli_args <- c(
  "--output_subdir=output",
  "--summary_filename=run-summary.txt"
)
