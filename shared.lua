ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName= "Money Printer"
ENT.Author= "Pebsie"
ENT.Spawnable = true
ENT.AdminSpawnable = false

ENT.moneyAmount = 0
text = ""

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Amount")
end

function ENT:Initialize()
	self:SetModel( "models/props_c17/consolebox01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox

	self:SetUseType(SIMPLE_USE)


  local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	timer.Create( "addmoney", 3, 0, function() local amount = self:GetAmount() amount = amount + math.random(1,2) self:SetAmount(amount) end)
end



function ENT:Draw()
	self.Entity:DrawModel()

	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	local amount = self:GetAmount()

	surface.SetFont("HUDNumber5")
	text = "Printer: $"..amount
	local TextWidth = surface.GetTextSize(text)


	Ang:RotateAroundAxis(Ang:Up(), 90)

	cam.Start3D2D(Pos + Ang:Up() * 11.5, Ang, 0.11)
		 draw.WordBox(2, -TextWidth * 0.5, -30, text, "HUDNumber5", Color(140, 0, 0, 100), Color(255, 255, 255, 255))
	cam.End3D2D()
 end

function ENT:Think()

end
