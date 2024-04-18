import mongoose from "mongoose";
import express from "express";
import {
  createNote,
  getAllNotes,
  getSpecificNote,
  deleteNote
} from "../controllers/notes.controllers.js";

const router = express.Router();

router
.route("/")
.get(getAllNotes)
.post(createNote);

router
.route("/:id")
.get(getSpecificNote)
.delete(deleteNote)

export { router };
