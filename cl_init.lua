include('shared.lua')

hook.Add("HUDPaint", "DrawMoney", function()

	local eye = LocalPlayer():GetEyeTrace()

	if eye.Entity:GetClass() == "f2s-printer" then
		draw.SimpleText("Money Printer\nContains $"..eye.Entity:GetPrintAmount().."\nTemperature: "..eye.Entity:GetTemperature().."%", "CenterPrintText", ScrW()/2, ScrH()/2, Color(255,0,0),1,1)
	end


end)


function buyCool(ply,text,public)
	local eye = LocalPlayer():GetEyeTrace()

	if text == "/buycooler" then
		if eye.Entity:GetClass() == "f2s-printer" and ply:GetMoney() > 24 then
			eye.Entity:SetTemperature(-math.random(35, 75))
			ply:PrintMessage(HUD_PRINTCENTER, "Coolant bought! New temperature: "..eye.Entity:GetTemperature())
		end

end
hook.Add("PlayerSay", "buyCool", buyCool)
