module("DebugUtility", package.seeall)

function PrintTable(t)
  for k, v in pairs(t) do
    print(k, v)
  end
end

function PrintTableKeyOnly(t)
  for k, v in pairs(t) do
    print(k)
  end
end
