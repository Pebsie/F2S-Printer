include('shared.lua')

hook.Add("HUDPaint", "DrawMoney", function()

	local eye = LocalPlayer():GetEyeTrace()

	if eye.Entity:GetClass() == "f2s-printer" then
		viewAlpha = viewAlpha + 100
		draw.SimpleText("Money Print (Contains $"..eye.Entity:GetPrintAmount()..")", "CenterPrintText", ScrW()/2, ScrH()/2, Color(255,0,0),1,1)
	end


end)
