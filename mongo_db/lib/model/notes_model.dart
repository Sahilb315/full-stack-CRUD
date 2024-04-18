// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotesModel {
  final String? id;
  final String title;
  final String content;
  final bool isCompleted;
  NotesModel({
     this.id,
    required this.title,
    required this.content,
    required this.isCompleted,
  });

  NotesModel copyWith({
    String? id,
    String? title,
    String? content,
    bool? isCompleted,
  }) {
    return NotesModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'title': title,
      'content': content,
      'isCompleted': isCompleted,
    };
  }

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      id: map['_id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotesModel.fromJson(String source) => NotesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotesModel(_id: $id, title: $title, content: $content, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(covariant NotesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.content == content &&
      other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      content.hashCode ^
      isCompleted.hashCode;
  }
}
