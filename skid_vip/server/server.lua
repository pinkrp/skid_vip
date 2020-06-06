local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
perm = {}
Tunnel.bindInterface("skid_vip",perm)

function perm.giveCar(id,carrin) --função de dar carro, com as duas variáveis recebidas do client
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(id))

    if vRP.hasPermission(user_id,"admin.permissao") then

        vRP.execute("creative/add_vehicle",{ user_id = parseInt(id), vehicle = carrin, ipva = parseInt(os.time()) }) 
        TriggerClientEvent("Notify",source,"Voce adicionou o veículo <b>"..carrin.."</b> para o Passaporte: <b>"..id.."</b>.","Sucesso","Verde") 
        TriggerClientEvent("Notify",nplayer,"Voce recebeu o veículo <b>"..carrin.."</b>.","Faça bom uso","Verde") 
        
    else
        TriggerClientEvent("Notify",source,"Achou que ia ser fácil driblar triggando direto do client né safado ?","HAHAHA","Rosa")
    end
end


function perm.giveMoney(id,money) --função de dar dinheiro, com as duas variáveis recebidas do client
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(id))

    if vRP.hasPermission(user_id,"admin.permissao") then

        vRP.giveBankMoney(parseInt(id),parseInt(money))
        TriggerClientEvent("Notify", source, "Você deu <b>$"..money.."</b> para o ID: <b>"..id..".</b>","Sucesso","Verde")
        TriggerClientEvent("Notify", nplayer, "Você recebeu <b>$"..money.."<b>.","Sucesso","Verde")

    else
        TriggerClientEvent("Notify",source,"Achou que ia ser fácil driblar triggando direto do client né safado ?","HAHAHA","Rosa")
    end    
end


function perm.giveHome(id,casinha) --função de dar casa, com as duas variáveis recebidas do client
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(id))
    local taxa = "1591391139"

    if vRP.hasPermission(user_id,"admin.permissao") then

        vRP.execute("homes/buy_permissions",{ home = casinha, user_id = parseInt(id), tax = parseInt(taxa) })
        TriggerClientEvent("Notify",source,"Você deu para o ID: "..id.." a casa: <b>"..casinha..".</b>","Sucesso","Verde")
        TriggerClientEvent("Notify",nplayer,"Você recebeu a casa: <b>"..casinha..".</b>","Sucesso","Verde")

    else
        TriggerClientEvent("Notify",source,"Achou que ia ser fácil driblar triggando direto do client né safado ?","HAHAHA","Rosa")
    end
end

    
function perm.giveVip(id,tipo) --função de dar vip, com as duas variáveis recebidas do client
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(id))
    local nuser_id = vRP.getUserId(nplayer)
    
    if vRP.hasPermission(user_id,"admin.permissao") then

        vRP.addUserGroup(nuser_id,tipo)
        TriggerClientEvent("Notify",source,"Você setou o ID: <b>"..id.."</b> com vip <b>"..tipo..".</b>","Sucesso","Verde")
        TriggerClientEvent("Notify",nplayer,"Você foi setado como vip <b>"..tipo..".</b>","Sucesso","Verde")

    else
        TriggerClientEvent("Notify",source,"Achou que ia ser fácil driblar triggando direto do client né safado ?","HAHAHA","Rosa")
    end  
end


--------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES REMOVE
--------------------------------------------------------------------------------------------------------------------------------


function perm.remCar(id,carrin)
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(id))

    if vRP.hasPermission(user_id,"admin.permissao") then

        vRP.execute("creative/rem_vehicle",{ user_id = parseInt(id), vehicle = carrin }) 
        TriggerClientEvent("Notify",source,"Voce removeu o veículo <b>"..carrin.."</b> para o Passaporte: <b>"..id.."</b>.","Sucesso","Verde") 
        TriggerClientEvent("Notify",nplayer,"Voce perdeu o veículo <b>"..carrin.."</b>.","Se fudeu","Vermelho") 
       
    else
        TriggerClientEvent("Notify",source,"Achou que ia ser fácil driblar triggando direto do client né safado ?","HAHAHA","Rosa")
    end
end
 

function perm.remHome(id,casinha)
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(id))

    if vRP.hasPermission(user_id,"admin.permissao") then

        vRP.execute("homes/rem_allpermissions",{ home = casinha })
        TriggerClientEvent("Notify",source,"Você removeu do ID <b>"..id.."<b> a casa: <b>"..casinha..".</b>","Sucesso","Verde")
        TriggerClientEvent("Notify",nplayer,"Você perdeu a casa: <b>"..casinha..".</b>","Parabéns","Vermelho")

    else
        TriggerClientEvent("Notify",source,"Achou que ia ser fácil driblar triggando direto do client né safado ?","HAHAHA","Rosa")
    end
end



function perm.remMoney(id,money)
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(id))
    local dindin = vRP.getBankMoney(parseInt(1))

    if vRP.hasPermission(user_id,"admin.permissao") then 

            if parseInt(dindin) < parseInt(money) then
                TriggerClientEvent("Notify",source,"O cidadão possui menos do que $<b>"..money..",00</b> no banco.","Atenção","Vermelho")            
            else
                vRP.setBankMoney(parseInt(id),parseInt(dindin)-parseInt(money))
                TriggerClientEvent("Notify", source, "Você removeu <b>$"..money.."</b> do ID: <b>"..id..".</b>","Sucesso","Verde")
                TriggerClientEvent("Notify", nplayer, "Você perdeu <b>$"..money.."</b>.","Se fodeu","Vermelho")
            end

    else
        TriggerClientEvent("Notify",source,"Achou que ia ser fácil driblar triggando direto do client né safado ?","HAHAHA","Rosa")
    end    
end



function perm.remVip(id,tipo)
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(id))
    local nuser_id = vRP.getUserId(nplayer)
    
    if vRP.hasPermission(user_id,"admin.permissao") then

        vRP.removeUserGroup(nuser_id,tipo)
        TriggerClientEvent("Notify",source,"Você removeu o vip <b>"..tipo.."</b> do ID: <b>"..id..".</b>","Sucesso","Verde")
        TriggerClientEvent("Notify",nplayer,"Você perdeu seu vip <b>"..tipo..".</b>","Sucesso","Vermelho")
        
    else
        TriggerClientEvent("Notify",source,"Achou que ia ser fácil driblar triggando direto do client né safado ?","HAHAHA","Rosa")
    end  
end


--------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÃO CHECAR PERMISSÃO
--------------------------------------------------------------------------------------------------------------------------------


function perm.checkPerm()
    local source = source
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id,"admin.permissao")
end

