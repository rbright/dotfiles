vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
    mdx = "markdown.mdx",
    tfvars = "terraform-vars",
  },
  filename = {
    [".gitlab-ci.yml"] = "yaml.gitlab",
    ["Chart.lock"] = "helm",
    ["Chart.yaml"] = "helm",
    ["go.work"] = "gowork",
  },
  pattern = {
    [".*docker%-compose[^/]*%.ya?ml"] = "yaml.docker-compose",
    [".*%.tfvars%.json"] = "terraform-vars",
    [".*/templates/.*%.ya?ml"] = "helm",
    [".*/values[^/]*%.ya?ml"] = "yaml.helm-values",
  },
})
