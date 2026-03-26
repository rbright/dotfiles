local lint = require("lint")

lint.linters_by_ft = {
  dockerfile = { "hadolint" },
  terraform = { "tflint" },
}
