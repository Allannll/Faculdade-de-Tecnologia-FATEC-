import express from "express";
import plantController from "../controllers/plantWithTypeorm.controller";
import authMiddleware from "../middlewares/auth.middleware"; 

const route = express.Router();

route.get("/", authMiddleware.apiKeyAuthMiddleware, plantController.getPlants);
route.get("/:id", authMiddleware.apiKeyAuthMiddleware, plantController.getPlant);


route.post("/", authMiddleware.jwtAuthMiddleware, plantController.createPlant);
/* #swagger.tags = ['Plant']
   #swagger.summary = 'Cria uma nova planta no banco de dados'
   #swagger.parameters['body'] = {
       in: 'body',
       required: true,
       schema: { $ref: '#/definitions/PlantData' }
   } 
   #swagger.security = [{ "bearerAuth": [] }]
   #swagger.responses[201] = {
       schema: { $ref: '#/definitions/PlantDataResponse' },
       description: 'Planta criada com sucesso.' 
   }
   #swagger.responses[401] = { description: 'Token inválido ou expirado.' } 
*/
route.put("/:id", authMiddleware.jwtAuthMiddleware, plantController.updatePlant);
route.delete("/:id", authMiddleware.jwtAuthMiddleware, plantController.deletePlant);

export default route;