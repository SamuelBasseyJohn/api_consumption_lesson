void main(List<String> arguments) async {
  // Future
  // Stream
  // async
  // await
  // async*
  // try-catch

  // String username = "";
  // try {
  //   username = await fetchUserName();
  // } catch (error) {
  //   print("The error statement is: $error");
  // }
  String body = "Get up and eat, You have somewhere important to be real soon";
  String noteTitle = "Time To Eat";

  DateTime timeCreated = DateTime.now();

  var newNote =
      NoteModel(body: body, title: noteTitle, timeCreated: timeCreated);

  notes.add(newNote);

  var title = "";

  try {
    title = await fetchNoteTitle(notes);
  } catch (error) {
    print("Popup saying: $error");
  }

  print(title);
}

List<NoteModel> notes = [];

Future<String> fetchNoteTitle(List<NoteModel> noteApi) =>
    Future.delayed(Duration(seconds: 5), () {
      if (noteApi.isEmpty) {
        throw Exception("Note not found");
      } else {
        return noteApi.first.title;
      }
    });

class NoteModel {
  String title;
  String body;
  DateTime timeCreated;

  NoteModel(
      {required this.body, required this.title, required this.timeCreated});

  @override
  String toString() {
    return """
Title: $title
Body: $body
TimeCreated: ${timeCreated.day}
""";
  }
}
