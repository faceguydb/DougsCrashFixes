local maxDist = 2000
local _R = debug.getregistry()
local oldentsetpos = _R.Entity.SetPos
function _R.Entity:SetPos(pos)
	fixPositions(pos)
	oldentsetpos(self, pos)
end
local oldphysobjsetpos = _R.PhysObj.SetPos
function _R.PhysObj:SetPos(pos)
	fixPositions(pos)
	oldphysobjsetpos(self, pos)
end
function fixPositions(pos)
	if pos.x > maxDist then pos.x = maxDist end
	if pos.y > maxDist then pos.y = maxDist end
	if pos.z > maxDist then pos.z = maxDist end
	return pos
end