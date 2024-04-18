import { Note } from "../models/notes.models.js";

async function createNote(req, res) {
  try {
    const body = req.body;
    const note = await Note.create({
      title: body.title,
      content: body.content,
      isCompleted: body.isCompleted,
    });
    res.status(201).send({
      msg: "Note created successfully",
    });
  } catch (error) {
    res.status(500).send({
      msg: error.message,
    });
  }
}

async function getAllNotes(req, res) {
  try {
    const allNotes = await Note.find({});
    res.status(200).send({
      notes: allNotes,
    });
  } catch (error) {
    res.status(500).send({
      msg: error.message,
    });
  }
}

async function getSpecificNote(req, res) {
  try {
    const id = req.params.id;
    const specificNote = await Note.findById({ _id : id });
    res.status(200).send({
      note: specificNote,
    });
  } catch (error) {
    res.status(500).send({
      msg: error.message,
    });
  }
}

export { createNote, getAllNotes, getSpecificNote };
