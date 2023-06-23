class Pokemon {

  final String name;
  final String image;
  final List<String> type;
  final int id;
  final String num;

  Pokemon({required this.name, required this.id, required this.num, required this.type, required this.image});

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      image: json['img'],
      num: json['num'],
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
    );
  }
}