String changeIntegerToString(int timeCount) {
  List<String> base = ["0", "0", "0", "0"];
  String time = timeCount.toString();
  final list = time.split("");
  final reversdList = list.reversed.toList();
  reversdList.asMap().forEach((index, value) => base[index] = value);
  base.insert(2, ".");
  return base.reversed.join();
}
