const veiculoService = require('../services/veiculoService');

const cadastroVeiculo = async (req, res) => {
  try {
    console.log('request:', req.body, req.files);
    
    const veiculoData = req.body;
    const photoLinks = req.files.map(file => file.path);

    const veiculoId = await veiculoService.insertVeiculo(veiculoData);
    await veiculoService.insertVeiculoFotos(veiculoId, photoLinks);

    res.send('Dados inseridos com sucesso');
  } catch (err) {
    console.error('Erro ao inserir dados:', err);
    res.status(500).send('Erro ao inserir dados');
  }
};

module.exports = {
  cadastroVeiculo
};