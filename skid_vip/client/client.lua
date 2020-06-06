-- ESSE RESOURCE FOI FEITO COM UM UNICO INTUÍTO DE APRENDIZADO
-- SENDO ASSIM, É PROÍBIDO A VENDA E COMERCIALIZAÇÃO :C
-- VOCÊ TEM TOTAL LIBERDADE PARA MODIFICAR O QUE QUISER, COMPARTILHAR COM QUEM QUISER, SÓ NÃO VENDA <3
-- FOI FEITO COM CARINHO E TÁ COMENTADO NAS PARTES MAIS DIFICIEIS
-- PRECISA ALTERAR AS NOTIFYS POIS ESTÁ CONFIGURADO PARA O MEU
-- ATÉ ONDE FOI TESTADO ESTAVA COMPLETAMENTE FUNCIONAL, QUALQUER BUG, RELATE PARA O DISCORD ABAIXO
-- DISCORD CRIADOR: @pink_rp#0803


local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
perm = Tunnel.getInterface("skid_vip")


-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION DISPLAY - SHOW/HIDE NUI
-----------------------------------------------------------------------------------------------------------------------------------------
local display = false

function ToggleActionMenu()

	SetDisplay(not display)
end

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool,bool)
    SendNUIMessage({  --envia informações para o javascript, no caso Message
        type = "ui",
        status = bool
    })
end


RegisterCommand('vip', function()
    if perm.checkPerm() then
        ToggleActionMenu()
    else
        TriggerEvent("Notify","Você não é admin.","Acesso Negado","Vermelho")
    end             
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- NUI CALLBACK - CALLBACK DO JAVASCRIPT GIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('givecar', function(data) --regista o call back do JS
    local id = data.passaporte --variavel id recebe valor de data.passaporte (passaporte é do callback JS)
    local car = data.carro --variavel carro recebe valor de data.carro (carro é do callback JS)
    if perm.checkPerm() then --checa a permissão para ver se é ADM
        perm.giveCar(id,car) -- função é passada para o server com as variáveis acima
    end
end)

RegisterNUICallback('givemoney', function(data) --regista o call back do JS
    local id = data.passaporte --variavel id recebe valor de data.passaporte (passaporte é do callback JS)
    local money = data.money --variavel money recebe valor de data.money (money é do callback JS)
    if perm.checkPerm() then --checa a permissão para ver se é ADM
        perm.giveMoney(id,money) -- função é passada para o server com as variáveis acima
    end    
end)


RegisterNUICallback('givehome', function(data) --regista o call back do JS
    local id = data.passaporte --variavel id recebe valor de data.passaporte (passaporte é do callback JS)
    local home = data.casa --variavel home recebe valor de data.casa (casa é do callback JS)
    if perm.checkPerm() then --checa a permissão para ver se é ADM
        perm.giveHome(id,home) -- função é passada para o server com as variáveis acima
    end
end)



RegisterNUICallback('givevip',function(data) --regista o call back do JS
    local id = data.passaporte --variavel id recebe valor de data.passaporte (passaporte é do callback JS)
    local type = data.vip --variavel type recebe valor de data.vip (vip é do callback JS)
    if perm.checkPerm() then --checa a permissão para ver se é ADM
        perm.giveVip(id,type) -- função é passada para o server com as variáveis acima
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- NUI CALLBACK - CALLBACK DO JAVASCRIPT REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('removecar', function(data)  --regista o call back do JS
    local id = data.passaporte --variavel id recebe valor de data.passaporte (passaporte é do callback JS)
    local car = data.carro --variavel carro recebe valor de data.carro (carro é do callback JS)
    if perm.checkPerm() then --checa a permissão para ver se é ADM
        perm.remCar(id,car) -- função é passada para o server com as variáveis acima
    end
end)

RegisterNUICallback('removemoney', function(data)  --regista o call back do JS
    local id = data.passaporte --variavel id recebe valor de data.passaporte (passaporte é do callback JS)
    local money = data.money --variavel money recebe valor de data.money (money é do callback JS)
    if perm.checkPerm() then --checa a permissão para ver se é ADM
        perm.remMoney(id,money) -- função é passada para o server com as variáveis acima
    end    
end)


RegisterNUICallback('removehome', function(data) --regista o call back do JS
    local id = data.passaporte --variavel id recebe valor de data.passaporte (passaporte é do callback JS)
    local home = data.casa --variavel home recebe valor de data.casa (casa é do callback JS)
    if perm.checkPerm() then --checa a permissão para ver se é ADM
        perm.remHome(id,home) -- função é passada para o server com as variáveis acima
    end
end)


RegisterNUICallback('removevip',function(data) --regista o call back do JS
    local id = data.passaporte --variavel id recebe valor de data.passaporte (passaporte é do callback JS)
    local type = data.vip --variavel type recebe valor de data.vip (vip é do callback JS)
    if perm.checkPerm() then --checa a permissão para ver se é ADM
        perm.remVip(id,type) -- função é passada para o server com as variáveis acima
    end
end)


--------------------------------------------------------------------------------------------------------
-- FF (FAIL E FECHAR)
--------------------------------------------------------------------------------------------------------


RegisterNUICallback('fail', function(data) --regista o call back do JS
    TriggerEvent("Notify",data.msg,"OLHA A PORRA DO VALOR","Vermelho")
end)

RegisterNUICallback('fechar',function()
	SetDisplay(false)
end)