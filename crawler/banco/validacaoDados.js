/*
Transforma Salario
    Validação: Se não fornecer o salário colocar -1 'A combinar'
        Se fornecer, verifica o cifrão '$' se existir 
        pega o cifrão e a virgula. 
*/
var sal = 'R$ 800,00 a R$ 2.000,00 (Bruto mensal)';
//console.log(transformaSalario(sal));
function transformaSalario(salario) {
    var novoSalario = "";
    if(salario == 'A combinar'){
        return -1;
    } 
    
    novoSalario = salario.split('$')[1];
    novoSalario = novoSalario.split(',')[0];
    novoSalario = novoSalario.replace('.', '');
    novoSalario = parseFloat(novoSalario);
    
    return novoSalario;
}

/*
Transforma Localidade
    Validação: Separa por virgula encontre o estado e a cidade e tire os espaços
        Verifico se a cidade já está associada ao estado, se não estiver adicionar e associar
        Se estiver apenas associar o id.
*/
var loc = " Rio de Janeiro, RJ";
//console.log(transformaLocalidade(loc));
function transformaLocalidade(localidade) {
    var arrayEstCid = [];
    var estado = "";
    var cidade = "";
    
    if(localidade.substring(0,1) == ' ')
        localidade = localidade.substring(1, localidade.length);
    
    console.log(localidade);

    
    cidade = localidade.split(',')[0];
    
    //estado = localidade.split(',')[1].trim();
    
    
    arrayEstCid.push(cidade);
    arrayEstCid.push(estado);
    
    return arrayEstCid;
}


/*
Transforma Grau Escolaridade
    Transforma o grau de escolaridade em um valor valido
    Antes: Escolaridade Mínima: Ensino Fundamental (1º grau)
    Depois: Ensino Fundamental (1º grau)
*/
var esc = 'Escolaridade Mínima: Ensino Fundamental (1º grau)';
//console.log(transformaGrauEscolaridade(esc));
function transformaGrauEscolaridade(escolaridade) {
    var novaEscolaridade = "";
    novaEscolaridade = escolaridade.replace('Escolaridade Mínima: ', '');
    
    return novaEscolaridade;
}

/*
Transforma Tags
    - Serve para tirar a string de começo e separar as tags que ele procura.
    - array de tags
    
    Criar tabela de tags
    Criar tabela de vagas
    Criar tabela de vagasxtags
    
    - Verifico se a tag existe eu coloco
*/
var tag = 'Área e especialização profissional: Informática, TI, Telecomunicações - Programador / Desenvolvedor';
//console.log(transformarTags(tag));
function transformaTags(strTags) {
    var arrayTags = [];
    var finalArrayTags = [];
    
    strTags = strTags.replace('Área e especialização profissional:', '');
    arrayTags = strTags.split(',');
    
    /* Tem como objetivo retirar o espaço das tags
        de algumas vagas */
    for(var i = 0; i < arrayTags.length; i++){
        var atualTag = arrayTags[i];
        
        if (atualTag.substring(0,1) == ' ') {
            atualTag = atualTag.substring(1, atualTag.length);
        }
        
        finalArrayTags.push(atualTag);
    }
    
    return finalArrayTags;
}

module.exports.transformaSalario = transformaSalario
module.exports.transformaLocalidade = transformaLocalidade
module.exports.transformaGrauEscolaridade = transformaGrauEscolaridade
module.exports.transformaTags = transformaTags





/* Exemplo de dados
{
    "titulo": "Barman Para Botafogo E Jardim Botanico",
    "jornada": "Noturno",
    "empresa": "Entretapas",
    "tipoContrato": "Efetivo – CLT",
    "salario": "R$ 1.800,00 a R$ 2.300,00 (Bruto mensal)",
    "localidade": " Rio de Janeiro, RJ",
    "grauEscolaridade": "Escolaridade Mínima: Ensino Médio (2º Grau)",
    "tags": "Área e especialização profissional: Alimentação / Gastronomia - Atendente / Recepção / Garçom"
}



*/