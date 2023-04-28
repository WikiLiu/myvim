for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify(
      "Error setting up colorscheme: " .. astronvim.default_colorscheme,
      vim.log.levels.ERROR
    )
  end
end



vim.cmd([[colorscheme monokai-pro]])

-- 设置快捷键 Ctrl+q 退出
--vim.api.nvim_set_keymap('n', '<C-q>', ':q!<CR>', { noremap = true })
--vim.api.nvim_set_keymap('i', '<C-q>', '<Esc>:q!<CR>', { noremap = true })
--
-- 设置快捷键 Ctrl+s 保存
--vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w!<CR>a', { noremap = true })
--vim.api.nvim_set_keymap('n', '<C-s>', ':w!<CR>', { noremap = true })


require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)
