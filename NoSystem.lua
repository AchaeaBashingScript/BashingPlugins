keneanung.bashing.systems.none = {

	startAttack = function()
		if keneanung.bashing.attacking > 0 then
			enableTrigger(keneanung.bashing.systems.none.queueTrigger)
		 	send("queue add eqbal keneanungki", false)
 	 	end
	end,
	
	stopAttack = function()
		disableTrigger(keneanung.bashing.systems.none.queueTrigger)
		send("cq all")
	end,
	
	flee = function()
		keneanung.bashing.systems.none.stopAttack()
		send("queue prepend eqbal " .. keneanung.bashing.fleeDirection)
	end,
	
	warnFlee = function(avg)
		echo("Better run or get ready to die!")
	end,
	
	notifyFlee = function(avg)
		echo("Running as you have not enough health left.")
	end,

	handleShield = function()
		if keneanung.bashing.configuration.autoraze then
			local command
			send("queue prepend eqbal keneanungra", false)
		end
	end,
	
	setup = function()
		keneanung.bashing.systems.none.queueTrigger = tempRegexTrigger("^\\[System\\]: Running queued eqbal command: (?:KENEANUNGKI|KENEANUNGRA)",
			[[
			local system = keneanung.bashing.getSystem()
			keneanung.bashing.attacks = keneanung.bashing.attacks + 1
			local avgDmg = keneanung.bashing.damage / keneanung.bashing.attacks
			local avgHeal = keneanung.bashing.healing / keneanung.bashing.attacks
			
			local estimatedDmg = avgDmg * 2 - avgHeal

			local fleeat = keneanung.bashing.calcFleeValue(keneanung.bashing.configuration.fleeing)

			local warnat = keneanung.bashing.calcFleeValue(keneanung.bashing.configuration.warning)

			if estimatedDmg > gmcp.Char.Vitals.hp - fleeat and keneanung.bashing.configuration.autoflee then

				system.notifyFlee(estimatedDmg)

				system.flee()

			else
				if estimatedDmg > gmcp.Char.Vitals.hp - warnat then

					system.warnFlee(estimatedDmg)

				end
		 		send("queue add eqbal keneanungki", false)
			end
			]])
		disableTrigger(keneanung.bashing.systems.none.queueTrigger)
	end,
	
	teardown = function()
		if keneanung.bashing.systems.none.queueTrigger then
			killTrigger(keneanung.bashing.systems.none.queueTrigger)
		end
	end,
	
}
