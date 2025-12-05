import express from "express"
import userRoute from "./user.route"
import authRoute from "./auth.route"
import plantRoute from "./plant.route"
import parasiteRoute from "./parasite.route"

const route = express.Router();

route.use("/auth",authRoute);
route.use("/user",userRoute);
route.use("/plant",plantRoute);
route.use("/parasite",parasiteRoute);

export default route;