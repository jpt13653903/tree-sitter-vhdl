--------------------------------------------------------------------------------
--
-- Minimal Neovim configuration for the indent tests.
--
-- Loads the parser and queries staged by run.sh rather than anything from
-- the user's own configuration, so the result does not depend on what the
-- person running the tests happens to have installed.
--
--------------------------------------------------------------------------------

local work = assert(vim.env.NVIM_TS_WORK, "NVIM_TS_WORK is not set")
local plugin = assert(vim.env.NVIM_TS_PLUGIN, "NVIM_TS_PLUGIN is not set")

vim.opt.runtimepath:prepend(work)
vim.opt.runtimepath:prepend(plugin)

vim.treesitter.language.add("vhdl", { path = work .. "/parser/vhdl.so" })

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.cmd("filetype on")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "vhdl",
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.expandtab = true
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-- Abort the query if the indent queries are not what is being measured.
function _G.indent_test_guard()
    local query = vim.api.nvim_get_runtime_file("queries/vhdl/indents.scm", false)[1]
    local expr = vim.bo.indentexpr

    if not query or not expr:find("nvim%-treesitter") then
        io.stderr:write(("setup check failed: indents.scm=%s indentexpr=%s\n")
            :format(tostring(query), tostring(expr)))
        vim.cmd("cquit 3")
    end
end
