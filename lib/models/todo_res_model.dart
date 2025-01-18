import 'dart:convert';

TodoResModel todoResModelFromJson(String str) =>
    TodoResModel.fromJson(json.decode(str));

class TodoResModel {
  List<Todo>? todos;
  int? total;
  int? skip;
  int? limit;

  TodoResModel({
    this.todos,
    this.total,
    this.skip,
    this.limit,
  });

  factory TodoResModel.fromJson(Map<String, dynamic> json) => TodoResModel(
        todos: json["todos"] == null
            ? []
            : List<Todo>.from(json["todos"]!.map((x) => Todo.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );
}

class Todo {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todo({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );
}
