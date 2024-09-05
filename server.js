require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const multer = require('multer');
const path = require('path');
const cors = require('cors');
const veiculoController = require('./controllers/veiculoController');
const db = require('./config/db');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(cors());

// Configuração do multer para salvar arquivos na pasta uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, 'uploads'));
  },
  filename: (req, file, cb) => {
    cb(null, `${Date.now()}-${file.originalname}`);
  }
});

const upload = multer({ storage });

app.post('/cadastro-veiculo', upload.array('photos', 10), veiculoController.cadastroVeiculo);

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});