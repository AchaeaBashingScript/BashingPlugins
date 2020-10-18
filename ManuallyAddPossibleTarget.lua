tempAlias("^kconfig bashing addTarget (.+)$", [[
  for _, item in ipairs(keneanung.bashing.room) do
    if item.id == matches[2]:match("%d+$") then
      keneanung.bashing.addPossibleTarget(item.name)
      return
    elseif item.name == matches[2]:match("^%D+") then
      keneanung.bashing.addPossibleTarget(item.name)
      return
    end
  end
]])
