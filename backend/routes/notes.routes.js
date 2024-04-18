import mongoose from "mongoose";
import express from "express";
import {
  createNote,
  getAllNotes,
  getSpecificNote,
} from "../controllers/notes.controllers.js";

const router = express.Router();

router
.route("/")
.get(getAllNotes)
.post(createNote);

router.get("/:id", getSpecificNote);

export { router };
