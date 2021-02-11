import '../hook/gameModeList.dart';

enum mode {
  first,
  second,
  third,
}

final gameModes = {
  mode.first.toString(): "1-30",
  mode.second.toString(): "A-Z",
  mode.third.toString(): "a-z"
};

final textList = {
  "1-30": shuffleList(numbersList),
  "A-Z": shuffleList(upperAlperbelList),
  "a-z": shuffleList(lowerAlperbelList),
};

final baseTextList = {
  "1-30": numbersList,
  "A-Z": upperAlperbelList,
  "a-z": lowerAlperbelList,
};
const test = true;
const testEndPoint = 1;
