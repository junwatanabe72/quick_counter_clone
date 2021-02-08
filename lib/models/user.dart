class User {
  int id;
  String name;
  int first;
  int second;
  int third;
  User({this.id, this.name, this.first, this.second, this.third});
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'first': first,
        'second': second,
        'third': third
      };
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        name: map['name'],
        first: map['first'],
        second: map['second'],
        third: map['third']);
  }
}
