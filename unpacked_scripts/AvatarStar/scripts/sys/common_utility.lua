module("CommonUtility", package.seeall)

function gui.EventShowMessage(sender, args)
  if args then
    MessageBox.Show(args.Message, GetUTF8Text("button_common_I_Know"), function()
    end)
  end
end

function InitLtvHeader(ltv, t)
  for _, v in ipairs(t) do
    ltv:AddColumn(table.unpack(v))
  end
end
