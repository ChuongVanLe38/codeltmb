import 'dart:convert';

class Note {
  int? id;
  String title;
  String content;
  int priority;
  DateTime createdAt;
  DateTime modifiedAt;
  List<String>? tags;
  String? color;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.priority,
    required this.createdAt,
    required this.modifiedAt,
    this.tags,
    this.color,
  });

  // Chuyển đối tượng note thành data
  Map<String, dynamic> toData() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'modifiedAt': modifiedAt.toIso8601String(),
      'tags': tags?.join(','),
      'color': color,
  };
  }

  // Chuyển đối tượng Note thành Map
  Map<String, dynamic> toMap() {
    return toData();
  }

  // Chuyển đối tượng Note thành Map
  String toJSON() {
    return jsonEncode(toData());
  }


  // Tạo đối tượng User từ Map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      priority: map['priority'],
      createdAt: DateTime.parse(map['createdAt']),
      modifiedAt: DateTime.parse(map['modifiedAt']),
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
      color: map['color'],
    );
  }

  // Tạo đối tượng User từ JSON
  factory Note.fromJSON(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return Note(
        id: map['id'],
        title: map['title'],
        content: map['content'],
        priority: map['priority'],
        createdAt: DateTime.parse(map['createdAt']),
        modifiedAt: DateTime.parse(map['modifiedAt']),
        tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
        color: map['color'],
    );
  }

  // Phương thức copy để tạo bản sao với một số thuộc tính được cập nhật
  Note copyWith({
    int? id,
    String? title,
    String? content,
    int? priority,
    DateTime? createdAt,
    DateTime? modifiedAt,
    List<String>? tags,
    String? color,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      tags: tags ?? this.tags,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'Note(id: $id, title: $title, content: $content, createddAt: $createdAt, modifiedAt: $modifiedAt, tags: $tags, color: $color)';
  }




}