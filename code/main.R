#!/usr/bin/env Rscript

library(argparse)

# if you add a package to this repo, source it using devtools. e.g.:
# devtools::load_all("/code/MOSuite")

results_dir <- file.path("..", "results")
plots_dir <- file.path(results_dir, "figures")

# Log installed packages & versions
pkg_versions <- tibble::as_tibble(utils::installed.packages())
readr::write_csv(pkg_versions, file.path(results_dir, "r-packages.csv"))

parser <- ArgumentParser(
  description = "Minimal template entrypoint for a Code Ocean capsule"
)
parser$add_argument(
  "--output_subdir",
  type = "character",
  required = FALSE,
  default = "output",
  help = "Subdirectory under results/ where summary output is written"
)
parser$add_argument(
  "--summary_filename",
  type = "character",
  required = FALSE,
  default = "run-summary.txt",
  help = "Filename for the generated run summary"
)

args <- parser$parse_args()
output_dir <- file.path(results_dir, args$output_subdir)
summary_path <- file.path(output_dir, args$summary_filename)

dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)

writeLines(
  c(
    "# Template run output",
    paste("timestamp:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z")),
    paste("output_subdir:", args$output_subdir),
    paste("summary_filename:", args$summary_filename)
  ),
  summary_path
)

message("Wrote ", summary_path)
