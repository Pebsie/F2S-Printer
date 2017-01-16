# F2S-Printer
Money printers for Roaring Cow's F2S: Stronghold GMod gamemode


##How to use
Clone into the stronghold/entities/entities folder as f2s-printer.<br>
Add this to stronghold/gamemode/init.lua at any point:<br>
```Lua
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
```
Players can now type <code>/buyprinter</code> in chat to buy a printer for $100. The printer will spawn wherever they're aiming.
##Discrepancies
###Didn't RoaringCow condemn the addition of money printers?
Yes. I respectfully disagree with his thoughts on this.
###I have an issue!
Create an issue, don't try and track me down. I'll try and resolve it promptly.
