local health = vim.health or require("health")
local start = health.start or health.report_start
local ok = health.ok or health.report_ok
local error = health.error or health.report_error

local required_binaries = {
	"curl",
	"jq",
}

local check_binary_installed = function(binary)
	if vim.fn.executable(binary) == 1 then
		ok(binary .. " installed.")
	else
		error(("%s: not found: %s"):format(binary, "curl.nvim will not function without this package installed."))
	end
end

local M = {}

M.check = function()
	start("Checking external dependencies")
	for _, binary in ipairs(required_binaries) do
		check_binary_installed(binary)
	end
end

return M
