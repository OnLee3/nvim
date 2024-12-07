vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")

vim.keymap.set('n', '<leader>pp', function()
  vim.cmd.EslintFixAll()
  vim.cmd.Prettier()
end)

-- vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

-- vim.keymap.set('n', '<leader>pf', function()
--   builtin.find_files(themes.get_dropdown({ winblend = 10 }))
-- end, { desc = 'Telescope find files' })
--
-- vim.keymap.set('n', '<leader>ps', function()
--   builtin.grep_string(themes.get_dropdown({
--     search = vim.fn.input("Grep > "),
--     winblend = 10
--   }))
-- end)
--
-- vim.keymap.set('n', '<C-p>', function()
--   builtin.git_files(themes.get_dropdown({ winblend = 10 }))
-- end, { desc = 'Telescope find git files' })
--
vim.keymap.set('n', '<leader>pf', function()
  builtin.find_files()
end, { desc = 'Telescope find files' })

-- vim.keymap.set('n', '<leader>ps', function()
--   builtin.grep_string({
--     search = vim.fn.input("Grep > "),
--   })
-- end)

vim.keymap.set('n', '<leader>ps', function()
  builtin.live_grep()
end)

vim.keymap.set('n', '<C-p>', function()
  builtin.git_files()
end, { desc = 'Telescope find git files' })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>gs", function()
  vim.cmd.Git()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>o", true, false, true), "n", true)
end)

vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.setqflist()
end)

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

local toggle_opts = {
  border = "rounded",
  title_pos = "center",
  ui_width_ratio = 1,
}
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts) end)

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<C-6>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<C-7>", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<C-8>", function() harpoon:list():select(8) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

vim.cmd("command W w")
vim.cmd("command Q q")

-- 현재 파일이름을 클립보드에 복사.
vim.keymap.set('n', '<leader>fn', function()
  vim.fn.setreg('+', vim.fn.expand('%:t'))
end, { noremap = true, silent = true })


-- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end
--
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })
