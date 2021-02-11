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
final gameTimes = {
  mode.first.toString(): 1000,
  mode.second.toString(): 6000,
  mode.third.toString(): 0
};

final initalCounters = {
  mode.first.toString(): "10.00",
  mode.second.toString(): "60.00",
  mode.third.toString(): "No Limit"
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
