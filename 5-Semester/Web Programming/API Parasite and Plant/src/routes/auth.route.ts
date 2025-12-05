import express from "express"
import authController from "../controllers/auth.controller"
//import authMiddleware from "../middlewares/auth.middleware";

const route = express.Router();

route.post("/login", authController.login);
//route.post("/login", authMiddleware.basicAuthMiddleware, authController.login);

export default route;