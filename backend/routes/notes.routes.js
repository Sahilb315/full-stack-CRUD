import mongoose from "mongoose";
import express from "express";
import {
  createNote,
  getAllNotes,
  getSpecificNote,
  deleteNote,
  updateNote
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
.put(updateNote);


export { router };
