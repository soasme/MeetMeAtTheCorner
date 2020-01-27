local M = {}

M.tiles = {}

M.rock = {
	is_walkable=false,
	object="rock",
}

-- Level 1
M.tiles[{1, 10, 2}] = {
	is_walkable=false,
	object="you",
	action="display_message",
	message="Nina: Hi, nice to meet you.",
}
M.tiles[{1, 10, 8}] = {
	is_walkable=false,
	object="box",
	action="open_box",
	item="lollipop"
}

M.get_tile = function(level, x, y)
	if M.tiles[{level, x, y}] then return M.tiles[{level, x, y}] end
	local t = tilemap.get_tile("#tilemap", "rocks", pos.x, pos.y)
	if t ~= 0 then return M.rock end
end

return M