import express from "express"
import userWithTypeormController from "../controllers/userWithTypeorm.controller";
import authMiddleware from "../middlewares/auth.middleware"; 


const route = express.Router()

route.get("/:username", authMiddleware.jwtAuthMiddleware, userWithTypeormController.getUserByUsername);
route.get("/", authMiddleware.jwtAuthMiddleware, userWithTypeormController.getUsers);

route.post("/", userWithTypeormController.createUser);

export default route;