var empresaModel = require("../models/empresaModel");


function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var RazaoSocial = req.body.RazaoSocialServer;
    var Nome_fantasia = req.body.Nome_fantasiaServer;
    var Cnpj = req.body.CnpjServer;
    var Cep = req.body.CepServer;
    var Logradouro = req.body.LogradouroServer;
    var Numero = req.body.NumeroServer;
    var Bairro = req.body.BairroServer;
    var Uf = req.body.UfServer;
    var Cidade = req.body.CidadeServer;

    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    empresaModel.cadastrar(RazaoSocial, Nome_fantasia, Cnpj, Cep, Logradouro, Numero, Bairro, Uf, Cidade)
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
    cadastrar
}