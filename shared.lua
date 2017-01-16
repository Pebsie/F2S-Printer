ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName= "Bath"
ENT.Author= "Mruno"
ENT.Contact= "Via steam"
ENT.Purpose= "Exemplar material"
ENT.Instructions= "Use wisely"
ENT.Spawnable = true
ENT.AdminSpawnable = false


function ENT:Initialize()

	self:SetModel( "models/props_c17/consolebox01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox

  local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Use( activator, caller )
  if IsValid(caller) and caller:IsPlayer() then
    caller:AddMoney(100)
    caller:SaveMoney()
    caller:PrintMessage(HUD_PRINTCENTER, "Got $100!")
  end
end

function ENT:Think()
    -- We don't need to think, we are just a prop after all!
end
