# F2S-Printer
Money printers for Roaring Cow's F2S: Stronghold GMod gamemode


##How to use
Clone into the entities/entities folder.<br>
Add this to stronghold/gamemode/init.lua at any point<br>
<code>
function chatCommand(ply,text,public)
	if text == "/buyprinter" then
		if ply:GetMoney() > 100 then
			ply:AddMoney(-100)

			local printer = ents.Create("f2s-printer")
			printer:SetPos(ply:GetEyeTrace().HitPos)
			printer:Spawn()
		end
	end
end
hook.Add("PlayerSay", "chatCommand", chatCommand)
</code> 
