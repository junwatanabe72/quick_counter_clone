enum mode {
  first,
  second,
  third,
}

final gameModes = {
  mode.first.toString(): "10S",
  mode.second.toString(): "60S",
  mode.third.toString(): "ENDLESS"
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
