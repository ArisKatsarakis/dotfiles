local l = require("logging-term")
local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local job_id = 0
function PostingTerm()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = l.OpenCenteredBuffer({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
			vim.cmd("setlocal nobuflisted")
			job_id = vim.bo.channel
			vim.fn.chansend(job_id, { "pipx run posting \r\n" })
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

local buildState = {
	floating = {
		buf = -1,
		win = -1,
	},
}
local buildFiles = {
	docker = {
		buildFile = "docker-compose.yaml",
		command = "docker compose up \r\n",
	},
	angular = {
		buildFile = "angular.json",
		command = "ng serve \r\n",
	},
	go = {
		buildFile = "go.mod",
		command = "go run . \r\n",
	},
	goScratch = {
		buildFile = "main.go",
		command = "go run main.go \r\n",
	},
	springBoot = {
		buildFile = "pom.xml",
		command = "mvn spring-boot:run \r\n",
	},
}

function FindProjectCommand()
	local dir = vim.fn.getcwd()
	if dir == "" then
		vim.notify("Dir not found \n", vim.log.levels.ERROR)
		return nil
	end
	local cwdFiles = vim.fn.readdir(dir)
	local found = false
	for _, file in ipairs(cwdFiles) do
		for key, _ in pairs(buildFiles) do
			local bFile = buildFiles[key].buildFile
			if bFile == file then
				-- print("found")
				-- print(buildFiles[key].command)
				return buildFiles[key].command
			end
		end
		if found then
			break
		end
	end
	vim.notify("No build file found", vim.log.levels.ERROR)
	return nil
end

local build_job_id = 0
function ProjecBuildTerm()
	if not vim.api.nvim_win_is_valid(buildState.floating.win) then
		buildState.floating = l.OpenCenteredBuffer({ buf = buildState.floating.buf })
		if vim.bo[buildState.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
			vim.cmd("setlocal nobuflisted")
			local command = FindProjectCommand()
			if command ~= nil then
				build_job_id = vim.bo.channel
				vim.fn.chansend(build_job_id, { command })
			else
				vim.api.nvim_win_close(buildState.floating.win, true)
				buildState.floating.buf = -1
				buildState.floating.win = -1
			end
		end
	else
		vim.api.nvim_win_hide(buildState.floating.win)
	end
end

function CloseBuildTerm()
	if vim.api.nvim_win_is_valid(buildState.floating.win) then
		if build_job_id ~= 0 then
			vim.fn.chansend(build_job_id, { "exit \r\n" })
			vim.api.nvim_win_close(buildState.floating.win, true)
			vim.api.nvim_buf_delete(buildState.floating.buf, { force = true })
		end
	end
end

vim.keymap.set("n", "<leader>pp", PostingTerm, { desc = "Open posting terminal" })
vim.keymap.set("n", "<leader>pb", ProjecBuildTerm, { desc = "Open Terminal for build project" })
vim.keymap.set("n", "<leader>pbc", CloseBuildTerm, { desc = "Close Build Terminal" })
