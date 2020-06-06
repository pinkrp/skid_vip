const carro = document.getElementById('carro')
const money = document.getElementById('money')
const userid = document.getElementById('userid')
const casa = document.getElementById('casa')
const vip = document.getElementById('vip')
const give = document.getElementsByClassName('buttongive')
const remove = document.getElementsByClassName('buttonremove')
const close = document.getElementById('buttonclose')

function display(bool) {
    if (bool) {
        document.querySelector('.container').style.display = ''; //mostra 
    } else {
        document.querySelector('.container').style.display = 'none'; //esconde
    }
}

display(false)

//FUNÇÃO GIVE DAQUI PRA BAIXO

function giveCar(id,carrin) {
    fetch('http://skid_vip/givecar', {  //função que passa o callback (givecar no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            passaporte: id, //atribui o valor do "id" ao "passaporte" que é passado ao client
            carro: carrin //atribui o valor do "carrin" a "carro" que é passado ao client
        })
    })
 
}

function giveHome(id,home) {
    fetch('http://skid_vip/givehome', {  //função que passa o callback (givehome no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            passaporte: id, //atribui o valor do "id" ao "passaporte" que é passado ao client
            casa: home //atribui o valor do "home" a "casa" que é passado ao client
        })
    })
}

function giveMoney(id,dindin) {
    fetch('http://skid_vip/givemoney', {  //função que passa o callback (givemoney no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            passaporte: id, //atribui o valor do "id" ao "passaporte" que é passado ao client
            money: dindin //atribui o valor do "dindin" a "money" que é passado ao client
        })
    })
}

function giveVip(id,vipe) {
    fetch('http://skid_vip/givevip', {  //função que passa o callback (givevip no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            passaporte: id, //atribui o valor do "id" ao "passaporte" que é passado ao client
            vip: vipe //atribui o valor do "vipe" a "vip" que é passado ao client
        })
    })
}

//FUNÇÃO REMOVE DAQUI PRA BAIXO


function removeCar(id,carrin) {
    fetch('http://skid_vip/removecar', {  //função que passa o callback (removecar no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            passaporte: id, //atribui o valor do "id" ao "passaporte" que é passado ao client
            carro: carrin //atribui o valor do "carrin" a "carro" que é passado ao client
        })
    })
 
}

function removeHome(id,home) {
    fetch('http://skid_vip/removehome', {  //função que passa o callback (removehome no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            passaporte: id, //atribui o valor do "id" ao "passaporte" que é passado ao client
            casa: home //atribui o valor do "home" a "casa" que é passado ao client
        })
    })
}

function removeMoney(id,dindin) {
    fetch('http://skid_vip/removemoney', {  //função que passa o callback (removemoney no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            passaporte: id, //atribui o valor do "id" ao "passaporte" que é passado ao client
            money: dindin //atribui o valor do "dindin" a "money" que é passado ao client
        })
    })
}

function removeVip(id,vipe) {
    fetch('http://skid_vip/removevip', {  //função que passa o callback (removevip no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            passaporte: id, //atribui o valor do "id" ao "passaporte" que é passado ao client
            vip: vipe //atribui o valor do "vipe" a "vip" que é passado ao client
        })
    })
}

function fail(mensagem) {
    fetch('http://skid_vip/fail', {  //função que passa o callback (fail no caso) -- FUNÇÃO RESPONSÁVEL POR CHARMAR UM NOTIFY COM ERRO
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            msg: mensagem, //atribui o valor do objeto a "arma" que é passado ao client
        })
    })
}


addEventListener('message', function(event) //recebe a msg do client
{
    var item = event.data;  //data é a variável que está na function do client


    if (item.type === "ui") // type enviado pelo client
    {
        if (item.status == true){ //status enviado pelo client
            display(true) //seta display como true

                // GIVAR DAQUI PRA BAIXO
            
                give[0].addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão give, representado por "[0]"
                    if(!carro.value) {  //checa se o valor é vazio, caso seja, retorna a função de erro   
                        fail('Precisa estar preenchido.') 
                    }else if(isNaN(userid.value)){ //checa se o valor digitado é um numero, caso não seja, retorna função de erro
                        fail('Passaporte precisa ser um número.')
                    }else if(!userid.value){ //checa de o passaporte está vazio, caso esteja, retorna erro
                        fail('Passaporte precisa ser preenchido.')
                    }else{ //caso esteja tudo certo, ele executa a função
                    giveCar(userid.value,carro.value)                
                    }
                })

                give[1].addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão give, representado por "[1]"
                    if(!casa.value) { //checa se o valor é vazio, caso seja, retorna a função de erro         
                        fail('Precisa estar preenchido.')
                    }else if(isNaN(userid.value)){ //checa se o valor digitado é um numero, caso não seja, retorna função de erro
                        fail('Passaporte precisa ser um número.')
                    }else if(!userid.value){ //checa de o passaporte está vazio, caso esteja, retorna erro
                        fail('Passaporte precisa ser preenchido.')
                    }else{ //caso esteja tudo certo, ele executa a função
                        giveHome(userid.value,casa.value)                 
                    }
                       
                })

                give[2].addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão give, representado por "[2]"
                    if(isNaN(money.value) || !money.value) {  //checa se o valor é vazio, caso seja, retorna a função de erro                        
                        fail('Precisa ser valor numérico ou estar preenchido.')
                    }else if(isNaN(userid.value)){ //checa se o valor digitado é um numero, caso não seja, retorna função de erro
                        fail('Passaporte precisa ser um número.')
                    }else if(!userid.value){ //checa de o passaporte está vazio, caso esteja, retorna erro
                        fail('Passaporte precisa ser preenchido.')
                    }else{ //caso esteja tudo certo, ele executa a função
                        giveMoney(userid.value,money.value)                
                    }
                })

                give[3].addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão give, representado por "[3]"
                    if(!isNaN(vip.value) || !vip.value) {  //checa se o valor é vazio, caso seja, retorna a função de erro                    
                        fail('VIP não pode ser número e deve estar preenchido.')                  
                    }else if(isNaN(userid.value)){ //checa se o valor digitado é um numero, caso não seja, retorna função de erro
                        fail('Passaporte precisa ser um número.')
                    }else if(!userid.value){ //checa de o passaporte está vazio, caso esteja, retorna erro
                        fail('Passaporte precisa ser preenchido.')
                    }else if(vip.value === 'Platina' || vip.value === 'Ouro' || vip.value === 'Prata'){ //caso esteja tudo certo, ele executa a função   
                        giveVip(userid.value,vip.value)  
                    }else{                        
                        fail('A PORRA DO VIP TÁ ESCRITO ERRADO.')
                    }                                 
                })

                // REMOVER DAQUI PRA BAIXO


                remove[0].addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão remove, representado por "[0]"
                    if(!carro.value) {  //checa se o valor é vazio, caso seja, retorna a função de erro                
                        fail('Precisa estar preenchido.')
                    }else if(isNaN(userid.value)){ //checa se o valor digitado é um numero, caso não seja, retorna função de erro
                        fail('Passaporte precisa ser um número.')
                    }else if(!userid.value){ //checa de o passaporte está vazio, caso esteja, retorna erro
                        fail('Passaporte precisa ser preenchido.')
                    }else{ //caso esteja tudo certo, ele executa a função
                        removeCar(userid.value,carro.value)                
                    }
                })

                remove[1].addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão remove, representado por "[1]"
                    if(!casa.value) {  //checa se o valor é vazio, caso seja, retorna a função de erro                     
                        fail('Precisa estar preenchido.')
                    }else if(isNaN(userid.value)){ //checa se o valor digitado é um numero, caso não seja, retorna função de erro
                        fail('Passaporte precisa ser um número.')
                    }else if(!userid.value){ //checa de o passaporte está vazio, caso esteja, retorna erro
                        fail('Passaporte precisa ser preenchido.')
                    }else{ //caso esteja tudo certo, ele executa a função
                        removeHome(userid.value,casa.value)                 
                    }
                       
                })

                remove[2].addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão remove, representado por "[2]"
                    if(isNaN(money.value) || !money.value) {     //checa se o valor é vazio, caso seja, retorna a função de erro                   
                        fail('Precisa ser valor numérico ou estar preenchido.')
                    }else if(isNaN(userid.value)){ //checa se o valor digitado é um numero, caso não seja, retorna função de erro
                        fail('Passaporte precisa ser um número.')
                    }else if(!userid.value){ //checa de o passaporte está vazio, caso esteja, retorna erro
                        fail('Passaporte precisa ser preenchido.')
                    }else{ //caso esteja tudo certo, ele executa a função
                        removeMoney(userid.value,money.value)                
                    }
                })

                remove[3].addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão remove, representado por "[3]"
                    if(!isNaN(vip.value) || !vip.value) {    //checa se o valor é vazio, caso seja, retorna a função de erro                  
                        fail('VIP não pode ser número e deve estar preenchido.')                  
                    }else if(isNaN(userid.value)){ //checa se o valor digitado é um numero, caso não seja, retorna função de erro
                        fail('Passaporte precisa ser um número.')
                    }else if(!userid.value){ //checa de o passaporte está vazio, caso esteja, retorna erro
                        fail('Passaporte precisa ser preenchido.')
                    }else if(vip.value === 'Platina' || vip.value === 'Ouro' || vip.value === 'Prata'){  //caso esteja tudo certo, ele executa a função
                        removeVip(userid.value,vip.value)  
                    }else{                 
                        fail('A PORRA DO VIP TÁ ESCRITO ERRADO.')
                    }                             
                })


                close.addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão close
                    closeNUI()              
                })  
        } else {
            display(false) //seta display como false
        }             
    } 
})


function closeNUI() {
    fetch('http://skid_vip/fechar', {
        method: 'POST',
        body: JSON.stringify({
       
        })
    })
    display(false)
    window.location.reload()
}


document.onkeyup = function (event){
    if (event.which == 27){
        closeNUI()
    }
}
