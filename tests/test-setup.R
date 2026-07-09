#!/usr/bin/env Rscript

cat("Testing basic test setup...\n")

cwd <- getwd()
cat("Current directory:", cwd, "\n")

repo_root <- normalizePath(cwd)
cat("Calculated repo_root:", repo_root, "\n")

code_main <- file.path(repo_root, "code", "main.R")
code_run <- file.path(repo_root, "code", "run")
cat("code/main.R exists:", file.exists(code_main), "\n")
cat("code/run exists:", file.exists(code_run), "\n")
cat(
  "tests/testthat.R exists:",
  file.exists(file.path(repo_root, "tests", "testthat.R")),
  "\n"
)
