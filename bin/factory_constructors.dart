import 'dart:convert';

import 'package:http/http.dart' as http;

class NoteModel {
  String title;
  String body;
  DateTime timeCreated;
  String natureOfNote;

  NoteModel(
      {required this.body,
      required this.title,
      required this.timeCreated,
      required this.natureOfNote});

  factory NoteModel.noteType(
      {required String body,
      required String title,
      required DateTime timeCreated}) {
    if (body.length > 10) {
      return NoteModel(
          body: body,
          title: title,
          timeCreated: timeCreated,
          natureOfNote: "Long Note");
    } else if (body.length > 2 && body.length < 10) {
      return NoteModel(
          body: body,
          title: title,
          timeCreated: timeCreated,
          natureOfNote: "Short Note");
    } else {
      return NoteModel(
          body: body,
          title: title,
          timeCreated: timeCreated,
          natureOfNote: "Gist");
    }
  }

  @override
  String toString() {
    return """
Title: $title
Body: $body
TimeCreated: ${timeCreated.day}
Nature: $natureOfNote
""";
  }
}

class Todo {
  final int userID;
  final int todoID;
  final String title;
  final bool isCompleted;

  const Todo(
      {required this.userID,
      required this.todoID,
      required this.title,
      required this.isCompleted});
  factory Todo.fromJson(Map<String, dynamic> json) {
    int userId = json["userId"];
    int todoId = json["id"];
    String title = json["title"];

    return Todo(
        userID: userId,
        todoID: todoId,
        title: title,
        isCompleted: json["completed"]);
  }

  @override
  String toString() {
    return " Todo(title: $title, isCompleted: $isCompleted)";
  }
}

String url = "https://jsonplaceholder.typicode.com/todos";

Future<void> getData() async {
  var uri = Uri.parse(url);
  try {
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var todos = List.from(jsonDecode(response.body));
      for (var todo in todos) {
        var item = Todo.fromJson(todo);
        allTodos.add(item);
        print(item);
      }
    } else {
      throw Exception("Check your internet connection");
    }
  } catch (error) {
    print("The error is: ${error.toString()}");
  }
}

List<Todo> allTodos = [];

void main() async {
  var note1 = NoteModel.noteType(
      body: "Hello there i am a boy",
      title: "Gender ID",
      timeCreated: DateTime.now());
  var note2 = NoteModel.noteType(
      body: "Hi", title: "Greeting", timeCreated: DateTime.now());

  print(note1);
  print(note2);
  await getData();
}
