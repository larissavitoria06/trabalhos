function consultarendereco(){
    let cep = document.getElementById('cep').value;
    let url = "https://viacep.com.br/ws/" + cep + "/json/";

    if(cep.length !==8){
        alert("CEP inválido!!") ;
        return;
    }

    fetch(url).then(function (response){
        response.json().then(mostrardados)
    })

}

function mostrardados (dados){
    let resultado = document.querySelector('#resultado');
    if(dados.erro){
        resultado.innerHTML= `Não foi possível localizar o endereço`
    } else {
        resultado.innerHTML=`
         <p>endereço: ${dados.localidade}</p>
        <p>Lgradouro: ${dados.lagradouro}</p>
        <p>Complemento: ${dados.complemento}</p>
        <p>Estado: ${dados.estado}</p>
        <p>Região: ${dados.região}</p>
        <p>DDD: ${dados.DDD}</p>
        `
       
    }
}