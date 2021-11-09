UXI = {}
local fn = vim.fn
DATA = fn.stdpath("data")
CONFIG = fn.stdpath("config")
CACHE = fn.stdpath("cache")

pcall(require, "impatient")
local loader = require("plugin_loader")
local plugins = require("plugins")
loader.init(plugins)

vim.cmd("colorscheme onedarker")
require("setting")()
require("lsp")()
require("keymapping")()
