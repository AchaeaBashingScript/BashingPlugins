tempAlias("^kconfig bashing addTarget \w*?(\d+)$", [[
  for _, item in ipairs(keneanung.bashing.room) do
    if item.id == matches[2] then
      keneanung.bashing.addPossibleTarget(item.name)
      return
    end
  end
]])