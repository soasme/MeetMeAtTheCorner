local M = {}

M.STATE_MENU = 1
M.STATE_CONTROLS = 2
M.STATE_GETREADY = 3
M.STATE_PLAYING = 4
M.STATE_LEVELCLEAR = 5
M.STATE_GAMEOVER = 6
M.STATE_DIALOG = 7

M.state = M.STATE_MENU

M.TILE_SIZE = 16
M.PIXEL_SIZE = 4

M.initlevel = 1
M.level = 1
M.totallevels = 5
M.maxlevel = 1
M.offset = vmath.vector3(320, 240, 0)
M.scrollpos = vmath.vector3(0,0,0)
M.playerpos = vmath.vector3(0,0,0)
M.spawnpos = vmath.vector3(0,0,0)
M.up = vmath.vector3(0, 1, 0)
M.down = vmath.vector3(0, -1, 0)
M.left = vmath.vector3(-1, 0, 0)
M.right = vmath.vector3(1, 0, 0)

function M.direction2str(d)
	if d == M.up then
		return "up"
	elseif d == M.down then
		return "down"
	elseif d == M.left then
		return "left"
	elseif d == M.right then
		return "right"
	else
		return "up"
	end
end

function M.world2tile(p)
	return vmath.vector3(math.floor((p.x + M.TILE_SIZE) / M.TILE_SIZE), math.floor((p.y + M.TILE_SIZE) / M.TILE_SIZE), p.z)
end

function M.tile2world(p)
	return vmath.vector3((p.x * M.TILE_SIZE) - (M.TILE_SIZE / 2), (p.y * M.TILE_SIZE) - (M.TILE_SIZE / 2), p.z)
end

function M.onscreen(p, m)
	if p.x > M.scrollpos.x - m and
	p.x < M.scrollpos.x + m + M.offset.x * 2 and
	p.y > M.scrollpos.y - m and
	p.y < M.scrollpos.y + m + M.offset.y * 2 then
		return true
	else
		return false
	end
end

return M