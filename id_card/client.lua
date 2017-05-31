---------------------------------- VAR ----------------------------------

active = false
active1 = false
active2 = false
travail = ""
nom = ""
sac = ""
argent_sale = ""
telephone = ""
travail2 = ""
nom2 = ""
telephone2 = ""


---------------------------------- FUNCTION ----------------------------------


-- FR -- Fonction : Permet de créer les textes pour la carte d'identité
-- FR -- Paramètre(s) : Utiliser GUI Editor pour créer un GUI : https://forum.fivem.net/t/release-gui-editor-v0-2-updated-15-january-2017-7-utc/3087
---------------------------------------------------------
-- EN -- Function : Used to display the texts of ID Card
-- EN -- Param(s) : Use GUI Editor for create GUI : https://forum.fivem.net/t/release-gui-editor-v0-2-updated-15-january-2017-7-utc/3087
function DrawAdvancedText(x,y,w,h,sc,text,r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

-- FR -- Fonction : Vérifie si le joueur est à moins X mètres
-- FR -- Paramètre(s) : player = ID du joueur
---------------------------------------------------------
-- EN -- Function : Check if player is near 
-- EN -- Param(s) : player = Player ID
function IsNearPlayer(player)
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance = GetDistanceBetweenCoords(ply2Coords["x"], ply2Coords["y"], ply2Coords["z"],  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
  if(distance <= 5) then
    return true
  end
end

-- FR -- Fonction : Afficher le carte d'identité personnel
-- FR -- Paramètre(s) : Aucun
---------------------------------------------------------
-- EN -- Function : View Personal ID Card
-- EN -- Param(s) : None
function RenderCarte()
	DrawRect(0.888000000000001, 0.61, 0.185, 0.206, 0, 0, 0, 150)
	DrawAdvancedText(0.983000000000001, 0.482, 0.005, 0.0028, 0.736, "Carte d'identité", 255, 255, 255, 255, 4, 0)
	DrawAdvancedText(0.898000000000001, 0.54, 0.005, 0.0028, 0.487, "Nom : ", 255, 255, 255, 255, 6, 1)
	DrawAdvancedText(0.898000000000001, 0.575, 0.005, 0.0028, 0.487, "Travail : ", 255, 255, 255, 255, 6, 1)
	DrawAdvancedText(0.898000000000001, 0.613, 0.005, 0.0028, 0.487, "Telephone : ", 255, 255, 255, 255, 6, 1)
	DrawAdvancedText(0.952000000000001, 0.54, 0.005, 0.0028, 0.487, nom, 0, 120, 255, 255, 6, 1)
	DrawAdvancedText(0.952000000000001, 0.575, 0.005, 0.0028, 0.487, travail, 0, 120, 255, 255, 6, 1)
	DrawAdvancedText(0.952000000000001, 0.613, 0.005, 0.0028, 0.487, telephone, 0, 120, 255, 255, 6, 1)
end


-- FR -- Fonction : Afficher le GUI d'inpection pour la police
-- FR -- Paramètre(s) : Aucun
---------------------------------------------------------
-- EN -- Function : View the inspection GUI for police
-- EN -- Param(s) : None
function RenderRemoteCarte()
	DrawRect(0.888000000000001, 0.61, 0.185, 0.206, 0, 0, 0, 150)
	DrawAdvancedText(0.983000000000001, 0.482, 0.005, 0.0028, 0.736, "Inspection", 255, 255, 255, 255, 4, 0)
	DrawAdvancedText(0.898000000000001, 0.54, 0.005, 0.0028, 0.487, "Nom : ", 255, 255, 255, 255, 6, 1)
	DrawAdvancedText(0.898000000000001, 0.575, 0.005, 0.0028, 0.487, "Travail : ", 255, 255, 255, 255, 6, 1)
	DrawAdvancedText(0.898000000000001, 0.613, 0.005, 0.0028, 0.487, "Sac : ", 255, 255, 255, 255, 6, 1)
	DrawAdvancedText(0.952000000000001, 0.54, 0.005, 0.0028, 0.487, nom, 0, 120, 255, 255, 6, 1)
	DrawAdvancedText(0.952000000000001, 0.575, 0.005, 0.0028, 0.487, travail, 0, 120, 255, 255, 6, 1)
	DrawAdvancedText(0.952000000000001, 0.613, 0.005, 0.0028, 0.487, sac, 0, 120, 255, 255, 6, 1)
end

-- FR -- Fonction : Afficher le carte d'identité personnel pour d'autres personnes
-- FR -- Paramètre(s) : Aucun
---------------------------------------------------------
-- EN -- Function : View Personal ID Card for other(s) player(s)
-- EN -- Param(s) : None
function RenderRemoteCarte2()
	DrawRect(0.888000000000001, 0.61, 0.185, 0.206, 0, 0, 0, 150)
	DrawAdvancedText(0.983000000000001, 0.482, 0.005, 0.0028, 0.736, "Carte d'identité", 255, 255, 255, 255, 4, 0)
	DrawAdvancedText(0.898000000000001, 0.54, 0.005, 0.0028, 0.487, "Nom : ", 255, 255, 255, 255, 6, 1)
	DrawAdvancedText(0.898000000000001, 0.575, 0.005, 0.0028, 0.487, "Travail : ", 255, 255, 255, 255, 6, 1)
	DrawAdvancedText(0.898000000000001, 0.613, 0.005, 0.0028, 0.487, "Telephone : ", 255, 255, 255, 255, 6, 1)
	DrawAdvancedText(0.952000000000001, 0.54, 0.005, 0.0028, 0.487, nom2, 0, 120, 255, 255, 6, 1)
	DrawAdvancedText(0.952000000000001, 0.575, 0.005, 0.0028, 0.487, travail2, 0, 120, 255, 255, 6, 1)
	DrawAdvancedText(0.952000000000001, 0.613, 0.005, 0.0028, 0.487, telephone2, 0, 120, 255, 255, 6, 1)
end


-- FR -- Fonction : Récupère l'ID du joueur le plus proche
-- FR -- Paramètre(s) : distance = La distance maximum pour récupérer l'ID
---------------------------------------------------------
-- EN -- Function : Get Near ID Player
-- EN -- Param(s) : distance = Maximum distance to retrieve ID
function GetNearPlayer(distance)
  local players = GetPlayers()
  local nearPlayerDistance = distance or -1
  local nearPlayer = -1
  local playerCd = GetEntityCoords(GetPlayerPed(-1), 0)
  for i,v in ipairs(players) do
    local target = GetPlayerPed(v)
    if(target ~= GetPlayerPed(-1)) then
      local targetCoords = GetEntityCoords(GetPlayerPed(v), 0)
      local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], playerCd["x"], playerCd["y"], playerCd["z"], true)
      if(nearPlayerDistance == -1 or nearPlayerDistance > distance) then
        nearPlayer = v
      end
    end
  end
  return nearPlayer
end


-- FR -- Fonction : Récupère l'ID de tout les joueurs actifs
-- FR -- Paramètre(s) : Aucun
---------------------------------------------------------
-- EN -- Function : Get All ID Player Active
-- EN -- Param(s) : None
function GetPlayers()
    local players = {}
    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end

---------------------------------- EVENEMENT ----------------------------------


-- FR -- Evenement : Rempli les valeurs permettant d'afficher la carte identité du joueur
-- FR -- Paramètre(s) : result = Résultat de la requête (Tableau)
---------------------------------------------------------
-- EN -- Evenement : Fill in the values ​​to display the player ID card
-- EN -- Param(s) : result = Request result (Table)
RegisterNetEvent('id_card:envoyerinformations')
AddEventHandler('id_card:envoyerinformations', function(result)
	active = true
	nom = tostring(result[1].nom)
	travail = tostring(result[1].job_name)
	telephone = tostring(result[1].user_id)
end)


-- FR -- Evenement : Rempli les valeurs permettant d'afficher la carte identité du joueur inspecté
-- FR -- Paramètre(s) : result = Résultat de la requête (Tableau), itsOK = String qui affiche s'il y a des ressources illégales ou non, basé sur inventory system de Los Vanilla
---------------------------------------------------------
-- EN -- Evenement : Fill in the values ​​to display the inspect player ID card
-- EN -- Param(s) : result = Request result (Table), itsOK = String which displays if there are resources illegal or not, based on inventory system of Los Vanilla
RegisterNetEvent('id_card:envoyerinformations2')
AddEventHandler('id_card:envoyerinformations2', function(result, itsOK)
	nom = tostring(result[1].nom)
	travail = tostring(result[1].job_name)
	sac = tostring(itsOK)
	argent_sale = tostring(result[1].dirty_money)
	active1 = not active1
end)

-- FR -- Evenement : Rempli les valeurs permettant d'afficher la carte identité du joueur à un autre joueur
-- FR -- Paramètre(s) : result2 = Résultat de la requête (Tableau)
---------------------------------------------------------
-- EN -- Evenement : Fill in the values ​​to display the player ID card to another player
-- EN -- Param(s) : result2 = Request result (Table)
RegisterNetEvent('id_card:envoyer')
AddEventHandler('id_card:envoyer', function(result2)
	nom2 = tostring(result2[1].nom)
	travail2 = tostring(result2[1].job_name)
	telephone2 = tostring(result2[1].user_id)
	active2 = true
end)


-- FR -- Evenement : Permet l'inspection d'un joueur, ceci est l'ancienne version mais peut être toujours utilisé
-- FR -- Paramètre(s) : fromPlayer = Source de la demande, toPlayer = Joueur inspecté
---------------------------------------------------------
-- EN -- Evenement : Allows inspection of a player, this is the old version but can still be used
-- EN -- Param(s) : fromPlayer = Player source, toPlayer = Inspect Player
RegisterNetEvent('id_card:inspection')
AddEventHandler('id_card:inspection', function(fromPlayer, toPlayer)
	if(IsNearPlayer(toPlayer) == true) then
	    local player2 = GetPlayerFromServerId(toPlayer)
	    local playing = IsPlayerPlaying(player2)
	    if (playing ~= false) then
	      TriggerServerEvent("id_card:inspection", toPlayer)
	    else
	      TriggerEvent('chatMessage', "", {255, 0, 0}, "^1Ce joueur est pas connecter !");
	    end
	else
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^1Ce joueur est trop éloigner !");
	end
end)

---------------------------------- CITIZEN ----------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if active then
			RenderCarte()
		end
		if active1 then
			RenderRemoteCarte()
		end
		if active2 then
			RenderRemoteCarte2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if active then
			Wait(10000) -- FR -- Permet l'affichage pendant 10 secondes -- EN -- Allows display for 10 seconds
			active = false
		end
		if active1 then
			Wait(10000)
			active1 = false
		end
		if active2 then
			Wait(10000)
			active2 = false
		end
	end
end)