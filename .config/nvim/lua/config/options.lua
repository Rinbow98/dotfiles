-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Setting cursor style
opt.guicursor = {
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- Setting scroll border
opt.scrolloff = 6

-- A TAB character looks like 4 spaces
opt.tabstop = 2
-- Pressing the TAB key will insert spaces instead of a TAB character
opt.expandtab = true
-- Number of spaces inserted instead of a TAB character
opt.softtabstop = 2
-- Number of spaces inserted when indenting
opt.shiftwidth = 2

-- check os
local uname = vim.loop.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == "Darwin"
_G.IS_LINUX = OS == "Linux"
_G.IS_WINDOWS = OS:find("Windows") and true or false
_G.IS_WSL = IS_LINUX and uname.release:find("Microsoft") and true or false

if _G.IS_WINDOWS then
	--Setting shell
	vim.o.shell = "powershell"

	-- Setting shell command flags
	vim.o.shellcmdflag =
		"-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"

	-- Setting shell redirection
	vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'

	-- Setting shell pipe
	vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'

	-- Setting shell quote options
	vim.o.shellquote = ""
	vim.o.shellxquote = ""
end
