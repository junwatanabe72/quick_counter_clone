import 'dart:math' as math;

const length = 4;
const fill = "";
final spaceList = List<String>.filled(length, fill, growable: true);

// ignore: top_level_function_literal_block
const lastNumber = 30;
final numbersList = new List.generate(lastNumber, (i) => (i + 1).toString());

// ignore: top_level_function_literal_block
final createGameList = (int first, int end) {
  return String.fromCharCodes([for (var i = first; i <= end; i++) i]);
};
// ignore: non_constant_identifier_names
final int char_a = 'a'.codeUnitAt(0);
// ignore: non_constant_identifier_names
final int char_z = 'z'.codeUnitAt(0);
final lowerAlperbelList = createGameList(char_a, char_z).split("");
// ignore: non_constant_identifier_names
final int char_A = 'A'.codeUnitAt(0);
// ignore: non_constant_identifier_names
final int char_Z = 'Z'.codeUnitAt(0);
final upperAlperbelList = createGameList(char_A, char_Z).split("");

List<String> shuffleList(List<String> originList) {
  List<String> list = [...originList];
  list = addList(list);
  list.forEach((element) {
    int index = list.indexOf(element);
    int otherIndex = new math.Random().nextInt(lastNumber - 1);
    String tmp = list[index];
    list[index] = list[otherIndex];
    list[otherIndex] = tmp;
  });
  return list;
}

List<String> addList(targetList) {
  const lastNumber = 30;
  if (targetList.length == lastNumber) {
    return targetList;
  }
  return [...spaceList, ...targetList];
}
