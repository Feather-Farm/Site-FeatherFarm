var database = require("../database/config")


// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(RazaoSocial, Nome_fantasia, Cnpj, Cep, Logradouro, Numero, Bairro, Uf, Cidade) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", RazaoSocial, Nome_fantasia, Cnpj, Cep, Logradouro, Numero, Bairro, Uf, Cidade);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, cep, logradouro, numero, bairro, uf, cidade) VALUES ('${RazaoSocial}','${Nome_fantasia}','${Cnpj}','${Cep}','${Logradouro}','${Numero}','${Bairro}','${Uf}','${Cidade}')
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    cadastrar
};