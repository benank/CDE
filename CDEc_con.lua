--
-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.
--

-- load the gametype script
ScriptCB_DoFile("ObjectiveCTF")
ScriptCB_DoFile("setup_teams")
ScriptCB_DoFile("SaveAndLoadUtils")
ScriptCB_DoFile("teleport")
	
	--  REP Attacking (attacker is always #1)
    REP = 1;
    CIS = 2;
    --  These variables do not change
    ATT = REP;
    DEF = CIS;

	---SAVING STUFF
	
	local filename = "CastleDefenseResourcesData"
	
	local callback = function(message)
		--output the info to debug log
		print("Save result:", message)

		if message == nil then
			--show a 'Save Game Done' ingame message
			ShowMessageText("common.save")
			ShowMessageText("ifs.freeform.done")
		else
			--show a 'Save Game Skip' ingame message
			ShowMessageText("common.save")
			ShowMessageText("ifs.freeform.skip")
		end
	end
	
	
function encodeData()
	local data = {
		storedWood = wood,
		storedStone = stone,
		storedClass = playerClass,
		storedCurHp = playerCurHp,
	}
	return data
end

updateRequired = 0

function decodeData(data)
	if data == nil then
		data = {}
	end
	
	wood = data.storedWood or 0
	stone = data.storedStone or 0
	ucClassTo = data.storedClass
	playerClass = data.storedClass
	--SetReinforcementCount(2, wood)
	resourceUpdater()
	updateClass()
	playerCurHp = data.storedCurHp or 400
	SetProperty(GetCharacterUnit(playerChar), "CurHealth", playerCurHp)
	--updateRequired = 1
	
	
	print("Data decoded")

end



	local callback2 = function(message, data)
		--output the info to debug log
		print("Load result: msg, data:", message, data)

		if message == nil then
			--show a 'Load Game Done' ingame message
			ShowMessageText("common.load")
			ShowMessageText("ifs.freeform.done")
			decodeData(data)
		else
			--show a 'Load Game Skip' ingame message
			ShowMessageText("common.load")
			ShowMessageText("ifs.freeform.skip")
		end
	end
	
	--UNIT CLASS STUFF
function CompileUnitTables()

   unittablemaster1 = {}   
   unittablemaster2 = {}   
      
   if SetHeroClass then
   
      holdsetheroclass = SetHeroClass
      
      SetHeroClass = function(...)
         if arg[1] == 2 then
            table.insert (unittablemaster1, {unitteam = arg[1], unitclass = arg[2]})
         elseif arg[1] == 2 then
            table.insert (unittablemaster2, {unitteam = arg[1], unitclass = arg[2]})            
         end   

      holdsetheroclass(unpack(arg))   
         
      end
         
   end

   if AddUnitClass then
   
      holdaddunitclass = AddUnitClass   
      
      AddUnitClass = function(...)
         if arg[1] == 1 then
            table.insert (unittablemaster1, {unitteam = arg[1], unitclass = arg[2]})
         elseif arg[1] == 1 then
            table.insert (unittablemaster2, {unitteam = arg[1], unitclass = arg[2]})            
         end
         
      holdaddunitclass(unpack(arg))   
         
      end
         
   end

end

	
function killStone()
		KillObject("rock3_base")
		KillObject("rock3_base1")
		KillObject("rock3_base2")
		KillObject("rock3_base3")
		KillObject("rock3_base4")
		KillObject("rock3_base5")
		KillObject("rock3_base6")
		KillObject("rock3_base7")
		KillObject("rock3_base8")
		KillObject("rock3_base9")
		KillObject("rock3_base10")
		KillObject("rock3_base11")
		KillObject("rock3_base12")
		KillObject("rock3_base13")
		KillObject("rock3_base14")
		KillObject("rock3_base15")
		KillObject("rock3_base16")
		KillObject("rock3_base17")
		KillObject("rock3_base18")
		KillObject("rock3_base19")
		KillObject("rock3_base20")
		KillObject("rock3_base21")
		KillObject("rock3_base22")
		KillObject("rock3_base23")
		KillObject("rock3_base24")
		KillObject("rock3_base25")
		KillObject("rock3_base26")
		KillObject("rock3_base27")
		KillObject("rock3_base28")
		KillObject("rock3_base29")
		KillObject("rock3_base30")
		KillObject("rock3_base31")
		KillObject("rock3_base32")
		KillObject("rock3_base33")
		KillObject("rock3_base34")
		KillObject("rock3_base35")
		KillObject("rock3_base36")
		KillObject("rock3_base37")
		KillObject("rock3_base38")
		KillObject("rock3_base39")
		KillObject("rock3_base40")
		KillObject("rock3_base41")
		KillObject("rock3_base42")
		KillObject("rock3_base43")
		KillObject("rock3_base44")
		KillObject("rock3_base45")
		KillObject("rock3_base46")
		KillObject("rock3_base47")
		KillObject("rock3_base48")
		KillObject("rock3_base49")
		KillObject("rock1big")
		KillObject("rock1big1")
end

function resourceUpdater()
	print("resourceUpdater")
	wood = Curwood + wood
	Curwood = 0
	stone = Curstone + stone
	Curstone = 0
	SetTeamPoints(1, Curwood)
	SetTeamPoints(2, wood)
	if wood >= 450 and wood < 500 then
		RespawnObject("logs")
		KillObject("logs1")
		KillObject("logs2")
		KillObject("log1")
		KillObject("log3")
		KillObject("log4")
		KillObject("log5")
		KillObject("log6")
		KillObject("log7")
		KillObject("log8")
		KillObject("log9")
	end
	if wood >= 900 and wood < 950 then
		RespawnObject("logs1")
		KillObject("logs2")
		KillObject("log1")
		KillObject("log3")
		KillObject("log4")
		KillObject("log5")
		KillObject("log6")
		KillObject("log7")
		KillObject("log8")
		KillObject("log9")
	end
	
	if wood >= 1350 then
		RespawnObject("logs2")
	end
	if wood < 450 then
		KillObject("logs")
		KillObject("logs1")
		KillObject("logs2")
	end
	if wood >= 50 and wood < 100 or wood >= 500 and wood < 150 or wood >= 950 and wood < 1000 or wood >= 1400 and wood < 1450 then
		RespawnObject("log1")
		KillObject("log3")
		KillObject("log4")
		KillObject("log5")
		KillObject("log6")
		KillObject("log7")
		KillObject("log8")
		KillObject("log9")
	end
	if wood >= 100 and wood < 150 or wood >= 550 and wood < 600 or wood >= 1000 and wood < 1050 or wood >= 1450 and wood < 1500 then
		RespawnObject("log1")
		RespawnObject("log3")
		KillObject("log4")
		KillObject("log5")
		KillObject("log6")
		KillObject("log7")
		KillObject("log8")
		KillObject("log9")
	end
	if wood >= 150 and wood < 200 or wood >= 600 and wood < 650 or wood >= 1050 and wood < 1100 or wood >= 1500 and wood < 1550 then
		RespawnObject("log1")
		RespawnObject("log3")
		RespawnObject("log4")
		KillObject("log5")
		KillObject("log6")
		KillObject("log7")
		KillObject("log8")
		KillObject("log9")
	end
	if wood >= 200 and wood < 250 or wood >= 650 and wood < 700 or wood >= 1100 and wood < 1150 or wood >= 1550 and wood < 1600 then
		RespawnObject("log1")
		RespawnObject("log3")
		RespawnObject("log4")
		RespawnObject("log5")
		KillObject("log6")
		KillObject("log7")
		KillObject("log8")
		KillObject("log9")
	end
	if wood >= 250 and wood < 300 or wood >= 700 and wood < 750 or wood >= 1150 and wood < 1200 or wood >= 1600 and wood < 1650 then
		RespawnObject("log1")
		RespawnObject("log3")
		RespawnObject("log4")
		RespawnObject("log5")
		RespawnObject("log6")
		KillObject("log7")
		KillObject("log8")
		KillObject("log9")
	end
	if wood >= 300 and wood < 350 or wood >= 750 and wood < 800 or wood >= 1200 and wood < 1250 or wood >= 1650 and wood < 1700 then
		RespawnObject("log1")
		RespawnObject("log3")
		RespawnObject("log4")
		RespawnObject("log5")
		RespawnObject("log6")
		RespawnObject("log7")
		KillObject("log8")
		KillObject("log9")
	end
	if wood >= 350 and wood < 400 or wood >= 800 and wood < 850 or wood >= 1250 and wood < 1300 or wood >= 1700 and wood < 1750 then
		RespawnObject("log1")
		RespawnObject("log3")
		RespawnObject("log4")
		RespawnObject("log5")
		RespawnObject("log6")
		RespawnObject("log7")
		RespawnObject("log8")
		KillObject("log9")
	end
	if wood >= 400 and wood < 450 or wood >= 850 and wood < 900 or wood >= 1300 and wood < 1350 or wood >= 1750 then
		RespawnObject("log1")
		RespawnObject("log3")
		RespawnObject("log4")
		RespawnObject("log5")
		RespawnObject("log6")
		RespawnObject("log7")
		RespawnObject("log8")
		RespawnObject("log9")
	end
	if stone == 1 or stone == 51 or stone == 101 then
		killStone()
		RespawnObject("rock3_base")
	end
	--[[logscount = math.floor(wood / 450) --integer division
	logcount = math.floor(450 / wood) --modulus = remainder
	for i=1,logscount do
		RespawnObject("logs"..tostring(i))
	end
	for i=(logscount+1),(2) do
		KillObject("logs"..tostring(i))
	end
	for i=1,logcount do
		RespawnObject("log"..tostring(i))
	end
	for i=(logcount+1),(8) do
		KillObject("log"..tostring(i))
	end--]]
end



function ScriptPostLoad()	   
    
    --This defines the CPs.  These need to happen first
    --cp1 = CommandPost:New{name = "cp1"}
    --cp2 = CommandPost:New{name = "cp2"}
    --cp3 = CommandPost:New{name = "cp3"}
    --cp4 = CommandPost:New{name = "cp4"}
    
    
    
    --This sets up the actual objective.  This needs to happen after cp's are defined
    --ctf = ObjectiveCTF:New{teamATT = ATT, teamDEF = DEF, 
    --                                 textATT = "game.modes.con", 
    --                                 textDEF = "game.modes.con2",
	--								 showTeamPoints = true,
	--								 hideCPs = true, 
    --                                 multiplayerRules = true}
    
    --This adds the CPs to the objective.  This needs to happen after the objective is set up
    --conquest:AddCommandPost(cp1)
   -- conquest:AddCommandPost(cp2)
   -- conquest:AddCommandPost(cp3)
   -- conquest:AddCommandPost(cp4)    
    
    --conquest:Start()

    EnableSPHeroRules()
	
	--BEGIN GOOD STUFF----------------------------------------------------------

	
	ucPlayer = nil
	ucMatrix = nil
	ucClassTo = nil
	playerChar = nil
	playerClass = nil

	wood = 0
	stone = 0
	Curwood = 0
	Curstone = 0
	iron = 0
	Curiron = 0
	DepositMessage = true
	ForceHumansOntoTeam1()
	ActivateRegion("castle")
	ActivateRegion("stoneDis")
	ActivateRegion("woodDis")
	ActivateRegion("save")
	ActivateRegion("load")
	ActivateRegion("tree1")
	ActivateRegion("tree2")
	ActivateRegion("tree3")
	
function updateClass()
	print("updateClass")
	ucPlayer = playerChar
	ucMatrix = GetEntityMatrix(GetCharacterUnit(ucPlayer))
	print("1")
	SetEntityMatrix(GetCharacterUnit(ucPlayer), matrix) --teleport the guy away
	print("2")
	KillObject(GetCharacterUnit(ucPlayer)) --kill them
	print("3")
	--SelectCharacterTeam(ucPlayer, 2)
	print("3.25")
	SelectCharacterClass(ucPlayer, ucClassTo) --pick their new class
	print("3.5")
	SpawnCharacter(ucPlayer, ucMatrix) --spawn them back
	print("4")
	--SelectCharacterTeam(ucPlayer, 1)
end

function changeClass()
	print("changeClass")
	--ccPlayer = playerChar
	playerCurHp = GetObjectHealth(ccPlayer)
	print("0.5")
	ccMatrix = GetEntityMatrix(ccPlayer)
	print("1")
	SetEntityMatrix(ccPlayer, matrix) --teleport the guy away
	print("2")
	KillObject(ccPlayer) --kill them
	print("3")
	--SelectCharacterTeam(ucPlayer, 2) -- ccClass 0 is axe ... 1 is hammer/sword
	print("3.25")
	if ccClass == 0 and hammerLevel == 1 and swordLevel == 0 then
		SelectCharacterClass(ccPlayerC, "snw_inf_player6") --pick their new class
		ccClass = 1
	elseif ccClass == 0 and hammerLevel == 2 and swordLevel == 0 then
		SelectCharacterClass(ccPlayerC, "snw_inf_player6") --pick their new class
		ccClass = 1
	elseif ccClass == 0 and hammerLevel == 1 and swordLevel == 1 then
		SelectCharacterClass(ccPlayerC, "snw_inf_player8") --pick their new class
		ccClass = 1
	elseif ccClass == 0 and hammerLevel == 1 and swordLevel == 2 then
		SelectCharacterClass(ccPlayerC, "snw_inf_player9") --pick their new class
		ccClass = 1
	elseif ccClass == 0 and hammerLevel == 0 and swordLevel == 1 then
		SelectCharacterClass(ccPlayerC, "snw_inf_player4") --pick their new class
		ccClass = 1
	elseif ccClass == 1 and axeLevel == 1 then
		SelectCharacterClass(ccPlayerC, "snw_inf_player3") --pick their new class
		ccClass = 0
	elseif ccClass == 1 and axeLevel == 0 then
		SelectCharacterClass(ccPlayerC, "snw_inf_player2") --pick their new class
		ccClass = 0
	end
	print("3.5")
	SpawnCharacter(ccPlayerC, ccMatrix) --spawn them back
	print("4")
	SetProperty(GetCharacterUnit(ccPlayerC), "CurHealth", playerCurHp)
	print("5")
	--SelectCharacterTeam(ucPlayer, 1)
end
	
	gameSaver = OnEnterRegion(function(region,character)
		playerCurHp = GetObjectHealth(GetCharacterUnit(playerChar))
		util_saveDataToDisk( encodeData(), filename, callback )
	end,
	"save")

    
	gameLoader = OnEnterRegion(function(region,character)
		--updateRequired = 1
		util_loadDataFromDisk( filename, callback2 )
	end,
	"load")

	
	secondsTimer = CreateTimer("secondsTimer")
	SetTimerValue(secondsTimer, 1)
	OnTimerElapse(function(timer)
		SetTimerValue(secondsTimer, 1)
		playerHp = GetObjectHealth(playerObj)
		if playerHp > 0 and playerHp < 400 then
			SetProperty(playerObj, "CurHealth", (playerHp + 0.5))
			StartTimer(secondsTimer)
		end
		ShowTimer(nil)
	end,
	secondsTimer
	)
	
	playerChar = nil
	playerCurHp = nil
	
	--Setup1 = 1
	
	Setup = OnCharacterSpawn(function(character)
		if IsCharacterHuman(character) then
			ReleaseCharacterSpawn(Setup)
            if GetObjectTeam(GetCharacterUnit(character)) == 1 then
				playerClass = (unittablemaster1[GetCharacterClass(character) + 1].unitclass)
				print(unittablemaster1[GetCharacterClass(character) + 1].unitclass)
            elseif GetObjectTeam(GetCharacterUnit(character)) == 2 then
				playerClass = (unittablemaster2[GetCharacterClass(character) + 1].unitclass)
				print(unittablemaster2[GetCharacterClass(character) + 1].unitclass)
			end
			--SetReinforcementCount(1,-1) --set visual resources to zero
			--SetReinforcementCount(2,-1)
			SetTeamPoints(1,0)
			SetTeamPoints(2,0)
			ShowTeamPoints(1, true)
			ShowTeamPoints(2, true)
			playerChar = character
			KillObject("log1")
			KillObject("log3")
			KillObject("log4")
			KillObject("log5")
			KillObject("log6")
			KillObject("log7")
			KillObject("log8")
			KillObject("log9")
			KillObject("logs1")
			KillObject("logs")
			KillObject("logs2")
			--killStone()
			--print("characterunit: ", GetCharacterUnit(character))
			--playerUnit = GetCharacterUnit(character)
			--playerClass = GetEntityClassPtr(playerUnit)
			--print(GetEntityClassName(GetCharacterUnit(character)))
			--print(GetEntityClass(GetCharacterUnit(character)))
			--print(GetEntityClass(character))
			--print(GetEntityClassName(character))
			
			Setup = nil
		end
	end)

	treeName = nil
	playerHp = nil
	playerObj = nil
	stoneAmount = 0
	ccPlayer = nil
	ccMatrix = nil
	ccClass = 0
	ccPlayerC = nil
	
	axeLevel = 0 --0 is none, 1 is stone, 2 is iron
	swordLevel = 0
	hammerLevel = 0
	showMessage = 1
	showMessage1 = 1
	showMessage2 = 1
	showMessage3 = 1
	showMessage4 = 1
	
	
	
	classBuyer = OnObjectDamage(function(object,damager)
		if GetObjectLastHitWeaponClass(object) == "snw_weap_inf_interact" 
		and GetEntityClassName(object) == "table_ironaxe" then
			if axeLevel == 0 and wood >= 100 and iron >= 50 and showMessage == 0 then
				ucClassTo = "snw_inf_player3"--          IRON AXE
				axeLevel = 1
				ccClass = 0
				wood = (wood - 100)
				iron = (iron - 50)
				ShowMessageText("level.CDE.ironaxe")
				updateClass()
				resourceUpdater()
			elseif showMessage == 1 then
				ShowObjectiveTextPopup("level.CDE.ironaxeR")
				showMessage = 0
			elseif axeLevel == 1 then
				ShowMessageText("level.CDE.alreadygot")
			elseif wood < 100 or iron < 50 then
				print("1")
				ShowMessageText("level.CDE.notenough")
			end
		elseif GetObjectLastHitWeaponClass(object) == "snw_weap_inf_interact" 
		and GetEntityClassName(object) == "table_stonehammer" then
			if hammerLevel == 0 and swordLevel == 0 and wood >= 150 and stone >= 50 and showMessage1 == 0 then
				ucClassTo = "snw_inf_player6"--          STONE HAMMER
				hammerLevel = 1
				ccClass = 1
				wood = (wood - 150)
				stone = (stone - 50)
				ShowMessageText("level.CDE.stonehammer")
				updateClass()
				resourceUpdater()
			elseif hammerLevel == 0 and swordLevel == 1 and wood >= 150 and stone >= 50 and showMessage1 == 0 then
				ucClassTo = "snw_inf_player8"--              STONE HAMMER AND STONE SWORD
				hammerLevel = 1
				ccClass = 1
				wood = (wood - 150)
				stone = (stone - 50)
				ShowMessageText("level.CDE.stonehammer")
				updateClass()
				resourceUpdater()
			elseif showMessage1 == 1 then
				ShowObjectiveTextPopup("level.CDE.stonehammerR")
				showMessage1 = 0
			elseif hammerLevel >= 1 then
				ShowMessageText("level.CDE.alreadygot")
			elseif wood < 150 or stone < 50 then
				print("2")
				ShowMessageText("level.CDE.notenough")
			end
		elseif GetObjectLastHitWeaponClass(object) == "snw_weap_inf_interact" 
		and GetEntityClassName(object) == "table_ironhammer" then
			if hammerLevel == 1 and swordLevel == 0 and wood >= 150 and iron >= 50 and showMessage2 == 0 then
				ucClassTo = "snw_inf_player6"--            IRON HAMMER
				hammerLevel = 2
				ccClass = 1
				wood = (wood - 150)
				iron = (iron - 50)
				ShowMessageText("level.CDE.ironhammer")
				updateClass()
				resourceUpdater()
			elseif hammerLevel == 1 and swordLevel == 1 and wood >= 150 and iron >= 50 and showMessage2 == 0 then
				ucClassTo = "snw_inf_player11"--            IRON HAMMER AND STONE SWORD
				hammerLevel = 2
				ccClass = 1
				wood = (wood - 150)
				iron = (iron - 50)
				ShowMessageText("level.CDE.ironhammer")
				updateClass()
				resourceUpdater()
			elseif hammerLevel == 1 and swordLevel == 2 and wood >= 150 and iron >= 50 and showMessage2 == 0 then
				ucClassTo = "snw_inf_player10"--            IRON HAMMER AND IRON SWORD
				hammerLevel = 2
				ccClass = 1
				wood = (wood - 150)
				iron = (iron - 50)
				ShowMessageText("level.CDE.ironhammer")
				updateClass()
				resourceUpdater()
			elseif showMessage2 == 1 then
				ShowObjectiveTextPopup("level.CDE.ironhammerR")
				showMessage2 = 0
			elseif hammerLevel == 2 then
				ShowMessageText("level.CDE.alreadygot")
			elseif wood < 150 or iron < 50 then
				print("3")
				ShowMessageText("level.CDE.notenough")
			end
		elseif GetObjectLastHitWeaponClass(object) == "snw_weap_inf_interact" 
		and GetEntityClassName(object) == "table_stonesword" then
			if swordLevel == 0 and hammerLevel == 0 and wood >= 50 and stone >= 25 and showMessage3 == 0 then
				ucClassTo = "snw_inf_player4"--         STONE SWORD
				swordLevel = 1
				ccClass = 1
				wood = (wood - 50)
				stone = (stone - 25)
				ShowMessageText("level.CDE.stonesword")
				updateClass()
				resourceUpdater()
			elseif swordLevel == 0 and hammerLevel == 1 and wood >= 50 and stone >= 25 and showMessage3 == 0 then
				ucClassTo = "snw_inf_player8"--       STONE SWORD AND STONE HAMMER
				swordLevel = 1
				ccClass = 1
				wood = (wood - 50)
				stone = (stone - 25)
				ShowMessageText("level.CDE.stonesword")
				updateClass()
				resourceUpdater()
			elseif swordLevel == 0 and hammerLevel == 2 and wood >= 50 and stone >= 25 and showMessage3 == 0 then
				ucClassTo = "snw_inf_player11"--       STONE SWORD AND IRON HAMMER
				swordLevel = 1
				ccClass = 1
				wood = (wood - 50)
				stone = (stone - 25)
				ShowMessageText("level.CDE.stonesword")
				updateClass()
				resourceUpdater()
			elseif showMessage3 == 1 then
				ShowObjectiveTextPopup("level.CDE.stoneswordR")
				showMessage3 = 0
			elseif swordLevel == 1 then
				ShowMessageText("level.CDE.alreadygot")
			elseif wood < 50 or stone < 25 then
				print("4")
				ShowMessageText("level.CDE.notenough")
			end
		elseif GetObjectLastHitWeaponClass(object) == "snw_weap_inf_interact" 
		and GetEntityClassName(object) == "table_ironsword" then
			if swordLevel < 2 and hammerLevel == 1 and wood >= 50 and iron >= 25 and showMessage4 == 0 then
				ucClassTo = "snw_inf_player8"--       IRON SWORD AND STONE HAMMER
				swordLevel = 2
				ccClass = 1
				wood = (wood - 50)
				iron = (iron - 25)
				ShowMessageText("level.CDE.ironsword")
				updateClass()
				resourceUpdater()
			elseif swordLevel < 2 and hammerLevel == 2 and wood >= 50 and iron >= 25 and showMessage4 == 0 then
				ucClassTo = "snw_inf_player11"--       IRON SWORD AND IRON HAMMER
				swordLevel = 2
				ccClass = 1
				wood = (wood - 50)
				iron = (iron - 25)
				ShowMessageText("level.CDE.ironsword")
				updateClass()
				resourceUpdater()
			elseif showMessage4 == 1 then
				ShowObjectiveTextPopup("level.CDE.ironswordR")
				showMessage4 = 0
			elseif swordLevel == 2 then
				ShowMessageText("level.CDE.alreadygot")
			elseif wood < 50 or iron < 25 then
				print("5")
				ShowMessageText("level.CDE.notenough")
			end
		end
	end)
	
	classChanger = OnObjectDamage(function(object,damager)
		if GetObjectLastHitWeaponClass(object) == "snw_weap_inf_changer" and GetObjectTeam(object) == 1 then
			ccPlayerC = damager
			ccPlayer = GetCharacterUnit(damager)
			changeClass()
		end
	end)
	
	ResourceChecker = OnObjectDamage(function(object, killer)
		if GetObjectTeam(object) == 1 then
			playerObj = object
			StartTimer(secondsTimer)
		end
		if GetObjectLastHitWeaponClass(object) == "snw_weap_inf_axe" then --if axe
			treeName = GetEntityClassName(object)
			if treeName == "end_prop_tree01" or treeName == "end_prop_tree02" or treeName == "end_prop_tree03" or treeName == "end_prop_tree04" then
				Curwood = Curwood + math.random(3,8) --amount will depend on axe, 50 wood=1 tree/log
				SetTeamPoints(1, Curwood)
				SetTeamPoints(2, wood)
				--ShowMessageText("level.CDE.wood")
			end
		end
		if GetObjectLastHitWeaponClass(object) == "snw_weap_inf_axe_iron" then --if axe
			treeName = GetEntityClassName(object)
			if treeName == "end_prop_tree01" or treeName == "end_prop_tree02" or treeName == "end_prop_tree03" or treeName == "end_prop_tree04" then
				Curwood = Curwood + math.random(8,15) --amount will depend on axe, 50 wood=1 tree/log
				SetTeamPoints(1, Curwood)
				SetTeamPoints(2, wood)
				--ShowMessageText("level.CDE.wood")
			end
		end
		if GetObjectLastHitWeaponClass(object) == "snw_weap_inf_interact" then
			stoneName = GetEntityClassName(object)
			if stoneName == "rock1" or stoneName == "rock2" or stoneName == "rock3" then
				Curstone = Curstone + 1
				--("stoneMatrix"..stoneAmount) = GetEntityMatrix(object)
				SetEntityMatrix(object, matrix)
				SetTeamPoints(1, Curstone)
				SetTeamPoints(2, stone)
				stoneAmount = stoneAmount + 1
				--print("stoneMatrix"..stoneAmount)
			end
		end
	end)
		
	ResourceChecker2 = OnObjectKill(function(object, killer)
		if GetObjectLastHitWeaponClass(object) == "snw_weap_inf_axe" then --if axe
			treeName = GetEntityClassName(object)
			if treeName == "end_prop_tree01" or treeName == "end_prop_tree02" or treeName == "end_prop_tree03" or treeName == "end_prop_tree04" then
				Curwood = Curwood + math.random(20,30) --amount will depend on axe, 50 wood=1 tree/log
				SetTeamPoints(1, Curwood)
				SetTeamPoints(2, wood)
				--ShowMessageText("level.CDE.wood")
			end
		end
		if GetObjectLastHitWeaponClass(object) == "snw_weap_inf_axe_iron" then --if axe
			treeName = GetEntityClassName(object)
			if treeName == "end_prop_tree01" or treeName == "end_prop_tree02" or treeName == "end_prop_tree03" or treeName == "end_prop_tree04" then
				Curwood = Curwood + math.random(30,43) --amount will depend on axe, 50 wood=1 tree/log
				SetTeamPoints(1, Curwood)
				SetTeamPoints(2, wood)
				--ShowMessageText("level.CDE.wood")
			end
		end
	end)
		
		


	ActivateRegion("stone1")
	
	matrix = GetEntityMatrix("matrix") -- 53-137,191-194,197,200-224,239-242,321-329
	rock1matrix = GetEntityMatrix("rock1")

	headShot = OnObjectHeadshot(function(object, killer)
		KillObject(object)
		end
		)
		
	ResourceDropper = OnEnterRegion(function(region, character)
		if Curwood > 0 then
			resourceUpdater()
			if DepositMessage == true then
				ShowMessageText("level.CDE.deposit")
				DepositMessage = false
			end
		end
		if Curstone > 0 then
			resourceUpdater()
			if DepositMessage == true then
				ShowMessageText("level.CDE.deposit")
				DepositMessage = false
			end
		end
		DepositMessage = true
	end,
	"castle"
	)
	
	woodDisplay = OnEnterRegion(function(region, character)
		SetTeamPoints(1, Curwood)
		SetTeamPoints(2, wood)
	end,
	"woodDis"
	)
	stoneDisplay = OnEnterRegion(function(region, character)
		SetTeamPoints(1, Curstone)
		SetTeamPoints(2, stone)
	end,
	"stoneDis"
	)
		
	treeTeleport1 = OnEnterRegion(function(region, character)
		SetEntityMatrix(GetCharacterUnit(character), GetPathNodeDestination("treeNodes", math.random(0,15)))
	end,
	"tree1"
	)
	treeTeleport2 = OnEnterRegion(function(region, character)
		SetEntityMatrix(GetCharacterUnit(character), GetPathNodeDestination("treeNodes", math.random(0,15)))
	end,
	"tree2"
	)
	treeTeleport3 = OnEnterRegion(function(region, character)
		SetEntityMatrix(GetCharacterUnit(character), GetPathNodeDestination("treeNodes", math.random(0,15)))
	end,
	"tree3"
	)

 end


---------------------------------------------------------------------------
-- FUNCTION:    ScriptInit
-- PURPOSE:     This function is only run once
-- INPUT:
-- OUTPUT:
-- NOTES:       The name, 'ScriptInit' is a chosen convention, and each
--              mission script must contain a version of this function, as
--              it is called from C to start the mission.
---------------------------------------------------------------------------
function ScriptInit()
    CompileUnitTables()
    ReadDataFile("dc:ingame.lvl")
    ReadDataFile("ingame.lvl")
    
   
    SetMaxFlyHeight(300)
    SetMaxPlayerFlyHeight (300)
    
    SetMemoryPoolSize ("ClothData",20)
    SetMemoryPoolSize ("Combo",50)              -- should be ~ 2x number of jedi classes
    SetMemoryPoolSize ("Combo::State",650)      -- should be ~12x #Combo
    SetMemoryPoolSize ("Combo::Transition",650) -- should be a bit bigger than #Combo::State
    SetMemoryPoolSize ("Combo::Condition",650)  -- should be a bit bigger than #Combo::State
    SetMemoryPoolSize ("Combo::Attack",550)     -- should be ~8-12x #Combo
    SetMemoryPoolSize ("Combo::DamageSample",6000)  -- should be ~8-12x #Combo::Attack
    SetMemoryPoolSize ("Combo::Deflect",100)     -- should be ~1x #combo  
    
    ReadDataFile("sound\\yav.lvl;yav1cw")
    ReadDataFile("SIDE\\rep.lvl",
                             "rep_inf_ep3_rifleman",
                             "rep_inf_ep3_rocketeer",
                             "rep_inf_ep3_engineer",
                             "rep_inf_ep3_sniper",
                             "rep_inf_ep3_officer",
                             "rep_inf_ep3_jettrooper",
                             "rep_hover_fightertank",
                             "rep_hero_anakin",
                             "rep_hover_barcspeeder")
    ReadDataFile("SIDE\\cis.lvl",
                             "cis_inf_rifleman",
                             "cis_inf_rocketeer",
                             "cis_inf_engineer",
                             "cis_inf_sniper",
                             "cis_inf_officer",
                             "cis_inf_droideka",
                             "cis_hero_darthmaul",
                             "cis_hover_aat")
                             
                             
    ReadDataFile("dc:SIDE\\snw.lvl", 
    			"snw_inf_player1",
    			"snw_inf_player2",
    			"snw_inf_player3",
    			"snw_inf_player4",
    			"snw_inf_player5",
    			"snw_inf_player6",
    			"snw_inf_player7",
    			"snw_inf_player8",
    			"snw_inf_player9",
    			"snw_inf_player10",
    			"snw_inf_player11")
                             
	SetupTeams{
		rep = {
			team = REP,
			units = 20,
			reinforcements = -1,
			soldier  = { "snw_inf_player1",5, 5},
			assault  = { "snw_inf_player2",0, 0},
			engineer = { "snw_inf_player3",0, 0},
			sniper   = { "snw_inf_player4",0, 0},
			officer = {"snw_inf_player5",0, 0},
			special = { "snw_inf_player6",0, 0},
	        
		},
		cis = {
			team = CIS,
			units = 20,
			reinforcements = -1,
			soldier  = { "snw_inf_player7",0, 0},
			assault  = { "snw_inf_player8",0, 0},
			engineer = { "snw_inf_player9",0, 0},
			sniper   = { "snw_inf_player10",0, 0},
			officer = {"snw_inf_player11",0, 0},
			--special = { "snw_inf_player1",0, 0},
		}
	}
     

    --  Level Stats
    --  ClearWalkers()
    AddWalkerType(0, 4) -- special -> droidekas
    AddWalkerType(1, 0) -- 1x2 (1 pair of legs)
    AddWalkerType(2, 0) -- 2x2 (2 pairs of legs)
    AddWalkerType(3, 0) -- 3x2 (3 pairs of legs)
    local weaponCnt = 1024
    SetMemoryPoolSize("ParticleTransformer::SizeTransf",2000)
    SetMemoryPoolSize("ParticleTransformer::ColorTrans",2300)
    SetMemoryPoolSize("ParticleTransformer::PositionTr",1600)
    SetMemoryPoolSize("Aimer", 75)
    SetMemoryPoolSize("AmmoCounter", weaponCnt)
    SetMemoryPoolSize("BaseHint", 1024)
    SetMemoryPoolSize("EnergyBar", weaponCnt)
	SetMemoryPoolSize("EntityCloth", 32)
	SetMemoryPoolSize("EntityFlyer", 32)
    SetMemoryPoolSize("EntityHover", 32)
    SetMemoryPoolSize("SoldierAnimation", 1200)
    SetMemoryPoolSize("EntityLight", 200)
    SetMemoryPoolSize("EntitySoundStream", 4)
    SetMemoryPoolSize("EntitySoundStatic", 32)
    SetMemoryPoolSize("MountedTurret", 32)
	SetMemoryPoolSize("Navigator", 128)
    SetMemoryPoolSize("Obstacle", 1024)
	SetMemoryPoolSize("PathNode", 1024)
    SetMemoryPoolSize("SoundSpaceRegion", 64)
    SetMemoryPoolSize("TreeGridStack", 1024)
	SetMemoryPoolSize("UnitAgent", 128)
	SetMemoryPoolSize("UnitController", 128)
	SetMemoryPoolSize("Weapon", weaponCnt)
    
    SetSpawnDelay(10.0, 0.25)
    --ReadDataFile("dc:CDE\\CDE.lvl", "CDE_conquest")
    ReadDataFile("dc:CDE\\CDE.lvl", "CDE_conquest")
    SetDenseEnvironment("false")




    --  Sound
    
    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin")
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout")

    voiceSlow = OpenAudioStream("sound\\global.lvl", "rep_unit_vo_slow")
    AudioStreamAppendSegments("sound\\global.lvl", "cis_unit_vo_slow", voiceSlow)
    AudioStreamAppendSegments("sound\\global.lvl", "global_vo_slow", voiceSlow)
    
    voiceQuick = OpenAudioStream("sound\\global.lvl", "rep_unit_vo_quick")
    AudioStreamAppendSegments("sound\\global.lvl", "cis_unit_vo_quick", voiceQuick)
    
    OpenAudioStream("sound\\global.lvl",  "cw_music")
    -- OpenAudioStream("sound\\global.lvl",  "global_vo_quick")
    -- OpenAudioStream("sound\\global.lvl",  "global_vo_slow")
    OpenAudioStream("sound\\yav.lvl",  "yav1")
    OpenAudioStream("sound\\yav.lvl",  "yav1")
    OpenAudioStream("sound\\yav.lvl",  "yav1_emt")

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1)
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1)

    SetOutOfBoundsVoiceOver(2, "cisleaving")
    SetOutOfBoundsVoiceOver(1, "repleaving")

    SetAmbientMusic(REP, 1.0, "rep_yav_amb_start",  0,1)
    SetAmbientMusic(REP, 0.8, "rep_yav_amb_middle", 1,1)
    SetAmbientMusic(REP, 0.2, "rep_yav_amb_end",    2,1)
    SetAmbientMusic(CIS, 1.0, "cis_yav_amb_start",  0,1)
    SetAmbientMusic(CIS, 0.8, "cis_yav_amb_middle", 1,1)
    SetAmbientMusic(CIS, 0.2, "cis_yav_amb_end",    2,1)

    SetVictoryMusic(REP, "rep_yav_amb_victory")
    SetDefeatMusic (REP, "rep_yav_amb_defeat")
    SetVictoryMusic(CIS, "cis_yav_amb_victory")
    SetDefeatMusic (CIS, "cis_yav_amb_defeat")

    SetSoundEffect("ScopeDisplayZoomIn",      "binocularzoomin")
    SetSoundEffect("ScopeDisplayZoomOut",     "binocularzoomout")
    --SetSoundEffect("BirdScatter",             "birdsFlySeq1")
    --SetSoundEffect("WeaponUnableSelect",      "com_weap_inf_weaponchange_null")
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null")
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit")
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter")
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change")
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter")
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit")


--OpeningSateliteShot
	AddCameraShot(0.707635, -0.026789, -0.705565, -0.026711, -62.016129, 32.794556, 95.721603);
end

