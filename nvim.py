import os

# 创建目录
directory = os.path.expanduser("~/.config/nvim/lua/plugins")
os.makedirs(directory, exist_ok=True)

# 写入配置文件
with open(os.path.join(directory, "monokai-pro.lua"), "w") as f:
    f.write("""return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
    branch = "master",
    priority = 1000,
    config = function()
      local monokai = require("monokai-pro")
      monokai.setup({
        transparent_background = false,
        devicons = true,
        filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
        day_night = {
          enable = false,
          day_filter = "classic",
          night_filter = "spectrum",
        },
        inc_search = "background", -- underline | background
        background_clear = { "toggleterm" },
        plugins = {
          bufferline = {
            underline_selected = true,
            underline_visible = false,
            bold = false,
          },
          indent_blankline = {
            context_highlight = "pro", -- default | pro
            context_start_underline = true,
          },
        },
        override = function(c)
          return {
            ColorColumn = { bg = c.base.dimmed3 },
            -- Mine
            DashboardRecent = { fg = c.base.magenta },
            DashboardProject = { fg = c.base.blue },
            DashboardConfiguration = { fg = c.base.white },
            DashboardSession = { fg = c.base.green },
            DashboardLazy = { fg = c.base.cyan },
            DashboardServer = { fg = c.base.yellow },
            DashboardQuit = { fg = c.base.red },
          }
        end,
      })
      monokai.load()
    end,
  },
}
""")
print("Configuration file written at ~/.config/nvim/lua/monokai-pro.lua")


# 获取 init.lua 文件路径
nvim_dir = os.path.expanduser("~/.config/nvim")
init_lua_path = os.path.join(nvim_dir, "init.lua")

# 判断文件是否存在，如果不存在则创建
if not os.path.exists(init_lua_path):
    with open(init_lua_path, "w") as f:
        f.write("")

# 在文件末尾添加一行
with open(init_lua_path, "a") as f:
    f.write("""
vim.cmd([[colorscheme monokai-pro]])
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })
""")


# 获取 init.lua 文件路径
nvim_dir = os.path.expanduser("~/.config/nvim/lua/plugins")
init_lua_path = os.path.join(nvim_dir, "alpha.lua")


# 在文件末尾添加一行
with open(init_lua_path, "w") as f:
    f.write("""
    return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
"                    🟩🟩🟩🟩🟩",
"              🟩🟩🟩🟩🟩🟩🟩🟩⬛⬛⬛⬛⬛⬛",
"            🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟨🟨⬛",
"          🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟨🟨🟨⬛",
"      🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟨🟨🟨⬛",
"  🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟧🟨🟨⬛",
"🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟨🟨🟫🟫",
"⬛🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟨🟧🟨🟨⬛",
"  ⬛⬛⬛⬛🟩🟩🟩🟩🏻🟨🟩🟨🟨🟨🟨🏻🟨⬛",
"          ⬛⬛🟩🟩🏻🏻🟨⬛🟧🟨🏻⬛🟫⬛",
"          ⬛🟧⬛⬛🟧🏻🟨⬛🟨🟧🏻⬜🟦🟨⬛",
"          ⬛🟧🟫⬛⬛🟧⬛⬛🟨🟫🏻⬜🟦🟨⬛",
"          ⬛🟧🟫⬛⬛🟧⬛🟨🟨🟫🏻🏻🟨⬛",
"          ⬛🟧🟫⬛⬛⬛⬛🟨🟫🟧🟨🟨⬛      ⬛",
"          ⬛🟧🟧🟧⬛🟩⬛🟨⬛⬛⬛⬛⬜🟫🟫⬛🟦⬛🟦🟦🟦🟦🟦🟦",
"            ⬛🟧⬛⬛🟩🟩⬛🟩🟩🟩🟩🟩🏻🏻⬛🟦⬛🏽🏽🏽🏽🏽🏽🟦",
"              ⬛⬛⬛🟩🟩🟩🟩🟩🟩🟩🟩🏻🏻⬛🟦⬛🏽🏽🏽🏽🏽🏽🟦",
"              🟫⬛🟩⬛🟩🟩🟩🟩🟩🟩🟩⬛⬛⬛🟦⬛🟦🟦🟦🟦🟦🟦",
"            ⬛🟫⬛🟩🟩⬛⬛⬛⬛⬛🟩🟩⬛    ⬛⬛",
"            ⬛🟫⬛🟩🟩🟩🟩🟩🟩🟩🟩⬛⬛⬛",
"            ⬛⬛🟫⬛🟩🟩🟩🟩🟩🟩⬛🟥🟥🟥⬛",
"              ⬛⬛⬛⬛⬛⬛⬛⬛⬛🟥🟥🟥🟥🟥⬛",
"                                ⬛⬛⬛⬛⬛",
	}
    dashboard.section.header.opts.hl = "DashboardHeader"

    local button = require("astronvim.utils").alpha_button
    dashboard.section.buttons.val = {
      button("LDR n", "  New File  "),
      button("LDR f f", "  Find File  "),
      button("LDR f o", "  Recents  "),
      button("LDR f w", "  Find Word  "),
      button("LDR f '", "  Bookmarks  "),
      button("LDR S l", "  Last Session  "),
    }

    dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
    dashboard.config.layout[3].val = 5
    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
  config = require "plugins.configs.alpha",
}
    """)













