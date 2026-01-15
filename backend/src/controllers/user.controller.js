import bcrypt from "bcryptjs";
import { readJSON, writeJSON } from "../services/fileDB.service.js";

const USER_PATH = "src/data/users.json";

export const changePassword = async (req, res) => {
  const { oldPassword, newPassword } = req.body;
  const users = readJSON(USER_PATH);

  const user = users.find(u => u.id === req.user.id);

  const match = await bcrypt.compare(oldPassword, user.password);
  if (!match) return res.status(400).json({ message: "Eski şifre yanlış" });

  user.password = await bcrypt.hash(newPassword, 10);
  writeJSON(USER_PATH, users);

  res.json({ message: "Şifre güncellendi" });
};
