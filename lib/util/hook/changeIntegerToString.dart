String changeIntegerToString(int timeCount) {
  var base = new List.generate(5, (i) => "0");
  String time = timeCount.toString();
  final list = time.split("");
  final reversdList = list.reversed.toList();
  reversdList.asMap().forEach((index, value) {
    base[index] = value;
  });
  if (base[base.length - 1] == "0") {
    base.removeLast();
  }
  base.insert(2, ".");
  return base.reversed.join();
}
