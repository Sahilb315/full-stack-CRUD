import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mongo_db/core/config.dart';
import 'package:mongo_db/model/notes_model.dart';

class NotesService {
  Future<void> createNewNote(NotesModel noteModel) async {
    try {
      final body = jsonEncode({
        "title": noteModel.title,
        "content": noteModel.content,
      });
      final res = await http.post(
        Uri.parse("$BASE_URL/"),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );
      log(res.statusCode.toString());
      if (res.statusCode == 201) {
        // log(res.data.toString());
        log(res.body.toString());
      }
    } catch (e) {
      log("Error while creating a new note : $e");
    }
  }

  Future<List<NotesModel>> getAllNotes() async {
    try {
      final res = await http.get(Uri.parse("$BASE_URL/"));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        List<dynamic> dynamicNotes = data['notes'] as List;
        List<NotesModel> notes =
            dynamicNotes.map((note) => NotesModel.fromMap(note)).toList();
        return notes;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<NotesModel?> getSpecificNote(String noteId) async {
    try {
      final res = await http.get(Uri.parse("$BASE_URL/$noteId"));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final dynamicNote = data['note'];
        NotesModel note = NotesModel.fromMap(dynamicNote);
        return note;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> updateNote(String noteId, NotesModel noteModel) async {
    try {
      final body = jsonEncode({
        "title": noteModel.title,
        "content": noteModel.content,
      });
      await http.put(
        Uri.parse("$BASE_URL/$noteId"),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      await http.delete(Uri.parse("$BASE_URL/$noteId"));
    } catch (e) {
      log(e.toString());
    }
  }
}
