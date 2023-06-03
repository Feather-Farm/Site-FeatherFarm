var usuarioModel = require("../models/usuarioModel");


function entrar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    usuarioModel.entrar(email, senha)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                if (resultado.length == 1) {
                    console.log(resultado);
                    res.json(resultado[0]);
                } else if (resultado.length == 0) {
                    res.status(403).send("Email e/ou senha inválido(s)");
                } else {
                    res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}


function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var Nome = req.body.NomeServer;
    var Sobrenome = req.body.SobrenomeServer;
    var EmailCadastro = req.body.EmailCadastroServer;
    var Telefone = req.body.TelefoneServer;
    var Telefone2 = req.body.Telefone2Server;
    var Senha = req.body.SenhaServer;
    var Cnpj = req.body.CnpjServer;



    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    usuarioModel.cadastrar(Nome, Sobrenome, EmailCadastro, Telefone, Telefone2, Senha, Cnpj)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}


function cadastrarNovoUser(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var Nome = req.body.NomeServer;
    var Sobrenome = req.body.SobrenomeServer;
    var EmailCadastro = req.body.EmailCadastroServer;
    var Telefone = req.body.TelefoneServer;
    var Senha = req.body.SenhaServer;
    var Tipo = req.body.TipoServer;
    var Empresa = req.body.EmpresaServer


    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    usuarioModel.cadastrarNovoUser(Nome, Sobrenome, EmailCadastro, Telefone, Senha, Tipo, Empresa)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}


module.exports = {
    entrar,
    cadastrar,
    cadastrarNovoUser,
}