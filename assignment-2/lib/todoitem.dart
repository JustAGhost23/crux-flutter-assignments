import 'dart:convert';

class TodoItem {
  String title;
  String description;
  bool completed = false;
  TodoItem({required this.title, required this.description});

  factory TodoItem.fromMap(Map<String, dynamic> jsonData) {
    return TodoItem(
      title: jsonData['title'] as String,
      description: jsonData['description'] as String,
    );
  }

  static Map<String, String> toMap(TodoItem item) {
    return {
      'title': item.title,
      'description': item.description,
    };
  }

  static List<TodoItem> fromJSON(String? json) {
    if (json != null) {
      return (jsonDecode(json) as List<dynamic>)
          .map<TodoItem>((item) => TodoItem.fromMap(item))
          .toList();
    }
    return [];
  }

  static String toJSON(List<TodoItem> item) {
    return jsonEncode(item
        .map<Map<String, String>>((music) => TodoItem.toMap(music))
        .toList());
  }

  static void complete(TodoItem item) {
    item.completed = true;
  }
}
