local status, null_ls = pcall(require, "null-ls")
if not status then return end

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then return end

local capabilities = cmp_nvim_lsp.default_capabilities()

null_ls.setup({
    capabilities = capabilities,
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.completion.tags,
        -- Lua
        null_ls.builtins.formatting.stylua,
        -- Go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
        -- Python
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.pylint.with({
            diagnostics_postprocess = function(diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
        }),
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        -- bash/zsh
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.zsh,
        -- Terraform
        null_ls.builtins.formatting.terraform_fmt,
        -- Dockerfile
        null_ls.builtins.diagnostics.hadolint,
        -- yaml
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.diagnostics.yamllint,
    },
    debug = false,
})
