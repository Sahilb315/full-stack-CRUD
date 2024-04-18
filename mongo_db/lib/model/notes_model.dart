// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotesModel {
  final String title;
  final String content;
  final bool isCompleted;
  NotesModel({
    required this.title,
    required this.content,
    required this.isCompleted,
  });

  NotesModel copyWith({
    String? title,
    String? content,
    bool? isCompleted,
  }) {
    return NotesModel(
      title: title ?? this.title,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'isCompleted': isCompleted,
    };
  }

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      title: map['title'] as String,
      content: map['content'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotesModel.fromJson(String source) => NotesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NotesModel(title: $title, content: $content, isCompleted: $isCompleted)';

  @override
  bool operator ==(covariant NotesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.content == content &&
      other.isCompleted == isCompleted;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode ^ isCompleted.hashCode;
}
