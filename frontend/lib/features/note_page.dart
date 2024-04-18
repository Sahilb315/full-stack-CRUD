import 'package:flutter/material.dart';
import 'package:mongo_db/core/notes_service.dart';
import 'package:mongo_db/model/notes_model.dart';

class NotePage extends StatelessWidget {
  final NotesModel notesModel;
  NotePage({super.key, required this.notesModel});
  final notesService = NotesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: notesService.getSpecificNote(notesModel.id!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.title,
                          style: const TextStyle(fontSize: 24),
                        ),
                        Text(snapshot.data!.id!),
                        Text(
                          snapshot.data!.content,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
