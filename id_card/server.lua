require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "losvanillaos", "root", "")

---------------------------------- FUNCTION ----------------------------------

function stringsplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end

---------------------------------- EVENEMENT ----------------------------------

-- FR -- Evenement : Permet l'inspection d'un joueur
-- FR -- Paramètre(s) : toPlayer = Joueur inspecté
---------------------------------------------------------
-- EN -- Evenement : Allows inspection of a player
-- EN -- Param(s) :  toPlayer = Inspect Player
RegisterServerEvent('id_card:inspection')
AddEventHandler('id_card:inspection', function(toPlayer)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:getPlayerFromId', toPlayer, function(user2)
			local user2Identifier = user2.identifier
			local name = GetPlayerName(toPlayer)
			TriggerClientEvent("es_freeroam:notifysimple", source, "Inspecté : " .. name)
			TriggerClientEvent("es_freeroam:notifysimple", toPlayer, "Vous êtes inpecté par : " .. GetPlayerName(source))
			-- FR -- Il faut adapter la requête -- EN -- You have to adapt the query
			executed_query = MySQL:executeQuery("SELECT * FROM `users` INNER JOIN jobs ON users.job = jobs.job_id WHERE identifier = '@identifier'", {['@identifier'] = user2Identifier})
			result = MySQL:getResults(executed_query, {'nom','job_name','money','dirty_money'})
			-- FR -- Il faut adapter la requête pour votre système d'inventaire -- EN -- You have to adapt the query for your inventory system
			executed_query2 = MySQL:executeQuery("SELECT * FROM in_backpack INNER JOIN resources ON in_backpack.resources_id = resources.resources_id INNER JOIN backpack ON in_backpack.backpack_id = backpack.backpack_id WHERE (backpack_userid = '@identifier' AND resources_type = 1) OR (backpack_userid = '@identifier' AND resources_type = 3)", {['@identifier'] = user2Identifier})
			result2 = MySQL:getResults(executed_query2, {'backpack_userid'})
			if(result2[1] == nil) then
				itsOK = "Rien à signaler"
			else
				itsOK = "Possède des ressources illégales"
			end
			TriggerClientEvent('id_card:envoyerinformations2', source, result, itsOK)
		end)
	end)
end)


-- FR -- Evenement : Récupère les informations d'un joueur puis les renvoies pour permettre de l'afficher
-- FR -- Paramètre(s) : toPlayer = Joueur inspecté
---------------------------------------------------------
-- EN -- Evenement : "Recovers" a player's information and then returns it for display
-- EN -- Param(s) :  Aucun
RegisterServerEvent('id_card:donnercarte')
AddEventHandler('id_card:donnercarte', function(toPlayer)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:getPlayerFromId', toPlayer, function(user2)
			local user2Identifier = user.identifier
			-- FR -- Il faut adapter la requête -- EN -- You have to adapt the query
			-- FR -- Actuellement le numéro de téléphone est "user_id" c'est une valeur AUTO_INCREMENT-- EN -- Currently the phone number is "user_id"
			executed_query = MySQL:executeQuery("SELECT * FROM `users` INNER JOIN jobs ON users.job = jobs.job_id WHERE identifier = '@identifier'", {['@identifier'] = user2Identifier})
			result4 = MySQL:getResults(executed_query, {'nom','job_name','user_id'})
			TriggerClientEvent('id_card:envoyer', toPlayer, result4)
		end)
	end)
end)


-- FR -- Evenement : Récupère les informations du joueur puis les renvoies pour permettre de l'afficher
-- FR -- Paramètre(s) : toPlayer = Joueur inspecté
---------------------------------------------------------
-- EN -- Evenement : "Recovers" a player's information and then returns it for display
-- EN -- Param(s) :  None
RegisterServerEvent('id_card:getinfos')
AddEventHandler('id_card:getinfos', function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		local player = user.identifier
		local name = "'" .. GetPlayerName(source) .. "'"
		-- FR -- Il faut adapter la requête -- EN -- You have to adapt the query
		-- FR -- Actuellement le numéro de téléphone est "user_id" c'est une valeur AUTO_INCREMENT -- EN -- Currently the phone number is "user_id"
		executed_query = MySQL:executeQuery("SELECT * FROM `users` INNER JOIN jobs ON users.job = jobs.job_id WHERE identifier = '@identifier'", {['@identifier'] = player})
		result = MySQL:getResults(executed_query, {'nom','job_name','user_id'})
		TriggerClientEvent('id_card:envoyerinformations',source,result)
	end)
end)

