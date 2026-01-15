import jwt from "jsonwebtoken";

const SECRET = "super_secret_key";

export const generateToken = (user) =>
  jwt.sign({ id: user.id, email: user.email }, SECRET, {
    expiresIn: "7d",
  });

export const verifyToken = (token) =>
  jwt.verify(token, SECRET);
