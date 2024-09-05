const db = require('../config/db'); // Importar a conexão com o pool de conexões

const insertVeiculo = async (veiculoData) => {
  const {
    license_plate,
    fabricated_year,
    model,
    brand,
    color,
    category_id,
    version,
    is_active,
    car_accident,
    auction,
    damage,
    mileage,
    user_id
  } = veiculoData;

  const veiculoQuery = `
    INSERT INTO CadastroVeiculo (
      license_plate, fabricated_year, model, brand, color, category_id, version, is_active, car_accident, auction, damage, mileage, user_id
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  const [result] = await db.query(veiculoQuery, [
    license_plate, fabricated_year, model, brand, color, category_id, version, is_active, car_accident, auction, damage, mileage, user_id
  ]);

  return result.insertId;
};

const insertVeiculoFotos = async (veiculoId, photoLinks) => {
  if (photoLinks.length === 0) {
    return;
  }

  const fotosQuery = `
    INSERT INTO VeiculoFotos (veiculo_id, photo_link) VALUES ?
  `;

  const fotosValues = photoLinks.map(link => [veiculoId, link]);

  await db.query(fotosQuery, [fotosValues]);
};

module.exports = {
  insertVeiculo,
  insertVeiculoFotos
};