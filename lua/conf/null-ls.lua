local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- python dependencies
        -- pip install mypy yapf pydocstyle vulture
        -- scoop installs
        -- scoop install stylua
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.diagnostics.mypy, -- static code check
        null_ls.builtins.formatting.yapf, -- code formatting
        null_ls.builtins.diagnostics.pydocstyle, -- docstring check
        -- null_ls.builtins.diagnostics.vulture, -- look for unused code
        null_ls.builtins.formatting.stylua, -- lua formatting
        null_ls.builtins.diagnostics.hadolint, -- dockerfile linting
    },
})
