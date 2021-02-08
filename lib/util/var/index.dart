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
  "1-30": numbersList,
  "a-z": lowerAlperbelList,
  "A-Z": upperAlperbelList
};
