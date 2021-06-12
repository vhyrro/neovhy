-- File containing keybinds for Neorg

-- This sets the leader for all neorg keybinds. It is separate from the regular <Leader>,
-- And allows you to shove every neorg keybind under one "umbrella".
local neorg_leader = "<Leader>" -- You may also want to set this to <Leader>o for "organization"

local neorg_callbacks = require('neorg.callbacks')

-- NEORG KEYBINDS

-- Keys for managing TODO items and setting their states
neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(event, content)
	if content.mode == "norg" then
		content.map("n", "gtd", ":Neorg keybind norg core.norg.qol.todo_items.todo.task_done<CR>", { silent = true, noremap = true })
		content.map("n", "gtu", ":Neorg keybind norg core.norg.qol.todo_items.todo.task_undone<CR>", { silent = true, noremap = true })
		content.map("n", "gtp", ":Neorg keybind norg core.norg.qol.todo_items.todo.task_pending<CR>", { silent = true, noremap = true })
		content.map("n", "gtt", ":Neorg keybind norg core.norg.qol.todo_items.todo.task_cycle<CR>", { silent = true, noremap = true })
	end
end)
