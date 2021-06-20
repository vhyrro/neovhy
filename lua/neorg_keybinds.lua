-- File containing keybinds for Neorg

-- This sets the leader for all neorg keybinds. It is separate from the regular <Leader>,
-- And allows you to shove every neorg keybind under one "umbrella".
local neorg_leader = "<Leader>" -- You may also want to set this to <Leader>o for "organization"

local neorg_callbacks = require('neorg.callbacks')

-- NEORG KEYBINDS

-- Keys for managing TODO items and setting their states
neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, content)

	content.map_event_to_mode("norg", {
		n = {
			{ "gtd", "core.norg.qol.todo_items.todo.task_done" },
			{ "gtu", "core.norg.qol.todo_items.todo.task_undone" },
			{ "gtp", "core.norg.qol.todo_items.todo.task_pending" },
			{ "gtt", "core.norg.qol.todo_items.todo.task_cycle" }
		},
	}, { silent = true, noremap = true })

end)
