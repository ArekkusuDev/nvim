local ok, project_nvim = pcall(require, "project_nvim")

if not ok then
  return
end

local root_patterns = {
  ".git",
  "_darcs",
  ".hg",
  ".bzr",
  ".svn",
  "Makefile",
  "package.json",
  ".stylua.toml",
}

project_nvim.setup {
  detection_methods = { "lsp", "pattern" },
  patterns = root_patterns,
  silent_chdir = true,
}
