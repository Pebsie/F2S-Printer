AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.

include('shared.lua')

function ENT:Use( activator, caller )
  if IsValid(caller) and caller:IsPlayer() then

    local amount = self:GetAmount()

		if amount > 0 then
	    caller:AddMoney(amount)
	    caller:SaveMoney()
	    caller:PrintMessage(HUD_PRINTCENTER, "Got $"..amount)
			amount = 0
      self:SetAmount(0)
			text = ""
		else
			text = "no"
		end
  end
end
