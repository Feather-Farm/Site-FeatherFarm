var database = require("../database/config")

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT email, senha, tipo, nome, nomeFantasia, fkEmpresa FROM usuario join empresa on fkEmpresa = idEmpresa WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(Nome, Sobrenome, EmailCadastro, Telefone, Telefone2, Senha, Cnpj) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", Nome, Sobrenome, EmailCadastro, Telefone, Telefone2, Senha, Cnpj);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO usuario (nome, sobrenome, email, telefone, telefone2, senha, tipo, fkEmpresa) VALUES ('${Nome}','${Sobrenome}','${EmailCadastro}','${Telefone}','${Telefone2}','${Senha}', 'admin', fn_empresa('${Cnpj}'))
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function cadastrarNovoUser(Nome, Sobrenome, EmailCadastro, Telefone, Senha, Tipo, Empresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrarNovoUser():", Nome, Sobrenome, EmailCadastro, Telefone, Senha, Tipo, Empresa);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO usuario (nome, sobrenome, email, telefone, senha, tipo, fkEmpresa) VALUES ('${Nome}','${Sobrenome}','${EmailCadastro}','${Telefone}','${Senha}', '${Tipo}', ${Empresa})
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    entrar,
    cadastrar,
    cadastrarNovoUser
};