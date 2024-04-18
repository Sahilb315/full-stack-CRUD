import { Note } from "../models/notes.models.js";

async function createNote(req, res) {
  try {
    const body = req.body;
    await Note.create({
      title: body.title,
      content: body.content,
      isCompleted: body.isCompleted,
    });
    res.status(201).send({
      msg: "Note created successfully",
    });
  } catch (error) {
    console.log(error.message);
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
    const specificNote = await Note.findById({ _id: id });
    res.status(200).send({
      note: specificNote,
    });
  } catch (error) {
    res.status(500).send({
      msg: error.message,
    });
  }
}

async function deleteNote(req, res) {
  try {
    const id = req.params.id;
    await Note.findByIdAndDelete({ _id: id });
    res.status(200).send({
      msg: "Note deleted successfully",
    });
  } catch (error) {
    res.status(500).send({
      msg: error.message,
    });
  }
}

async function updateNote(req, res) {
  try {
    const id = req.params.id;

    await Note.findByIdAndUpdate(id, {
      title: req.body.title,
      content: req.body.content,
      isCompleted: req.body.isCompleted,
    });
    res.status(200).send({
      msg: "Note Updated successfully",
    });
  } catch (error) {
    res.status(500).send({
      msg: error.message,
    });
  }
}

export { createNote, getAllNotes, getSpecificNote, deleteNote, updateNote };
