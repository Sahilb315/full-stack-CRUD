import mongoose from "mongoose";
import express from "express";
import { router } from "./routes/notes.routes.js";
import { connectDB } from "./connect.js";
import dotenv from "dotenv"

const app = express();
const PORT = 8000;

dotenv.config();

app.use(express.json());    
connectDB();

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

app.use("/notes", router);
