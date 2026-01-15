import express from "express";
import { authMiddleware } from "../middlewares/auth.middleware.js";
import { changePassword } from "../controllers/user.controller.js";

const router = express.Router();

router.put("/change-password", authMiddleware, changePassword);

export default router;
