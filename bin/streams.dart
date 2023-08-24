void main(List<String> args) async {
  await for (int value in generateValues(10)) {
    print(value);
  }
}
// Stream
// Yield
// await for
// async*

Stream<int> generateValues(int range) async* {
  for (int i = 0; i <= range; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}
