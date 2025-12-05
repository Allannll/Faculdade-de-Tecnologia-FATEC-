import express from "express";
import parasiteController from "../controllers/parasiteWithTypeorm.controller";
import authMiddleware from "../middlewares/auth.middleware"; 


const route = express.Router();

route.get("/:id",authMiddleware.apiKeyAuthMiddleware, parasiteController.getParasite);
route.get("/",authMiddleware.apiKeyAuthMiddleware, parasiteController.getParasites);
route.post("/",authMiddleware.jwtAuthMiddleware, parasiteController.createParasite);
route.put("/:id",authMiddleware.jwtAuthMiddleware, parasiteController.updateParasite);
route.delete("/:id", authMiddleware.jwtAuthMiddleware,parasiteController.deleteParasite);

export default route;
