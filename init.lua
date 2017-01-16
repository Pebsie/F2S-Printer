AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.

include('shared.lua')

local interval = 5

function ENT:Initialize()
	self:SetModel( "models/props_c17/consolebox01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox

	self:SetUseType(SIMPLE_USE)

	self.timer = CurTime()

  local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Think()
  if CurTime() > self.timer + interval then
    self.timer = CurTime()
    self:SetPrintAmount(self:GetPrintAmount() + math.random(1,3))
    self:SetTemperature(self:GetTemperature() + math.random(-2,4))
  end

  local temperature = self:GetTemperature()
  self:SetColor(255,(255-temperature*2.5),(255-temperature*2.5))

  if temperature > 80 then
    local vPoint = self:GetPos()
    local effectdata = EffectData()
    effectdata:SetStart(vPoint)
    effectdata:SetOrigin(vPoint)
    effectdata:SetScale(1)
    util.Effect("Sparks", effectdata)
  end

  if self:GetTemperature() > 100 then
    local vPoint = self:GetPos()
    local effectdata = EffectData()
    effectdata:SetStart(vPoint)
    effectdata:SetOrigin(vPoint)
    effectdata:SetScale(1)
    util.Effect("Explosion", effectdata)
    self:Remove()
  end
end

function ENT:OnTakeDamage(dmg)
  self:SetTemperature(self:GetTemperature() + dmg)
end

function ENT:Use(act, call)
  local moneyAmount = self:GetPrintAmount()
  self:SetPrintAmount(0)
  call:AddMoney(moneyAmount)
  call:SaveMoney()
  call:PrintMessage(HUD_PRINTCENTER, "Got $"..moneyAmount)
end
