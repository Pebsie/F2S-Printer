ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName= "Money Printer"
ENT.Author= "Pebsie"
ENT.Spawnable = true
ENT.AdminSpawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "PrintAmount")
	self:NetworkVar("Int", 0, "Temperature")
end

function ENT:Draw()
	self.Entity:DrawModel()
 end
