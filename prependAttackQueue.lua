local origNextAttack = keneanung.bashing.nextAttack

local queueBeforeAttack = {}

keneanung.bashing.nextAttack = function()
	if #queueBeforeAttack ~= 0 then
		send(queueBeforeAttack[1])
		table.remove(queueBeforeAttack, 1)
	else
		origNextAttack()
	end
end

keneanung.bashing.addFirst = function(what)
	cecho("\n<green>keneanung<reset>: Will do '" .. what .. "' before next attack.")
	queueBeforeAttack[#queueBeforeAttack + 1] = what
end
