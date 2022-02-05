import 'dart:convert';

class Character {
  int? id;
  String? name;
  String? imagePath;

  Character({
    this.id,
    this.name,
    this.imagePath,
  });

  Character copyWith({
    int? id,
    String? name,
    String? imagePath,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() => 'Character(id: $id, name: $name, imagePath: $imagePath)';

  static List<Character> toList(List<dynamic> genericList) =>
      genericList.map((character) => Character.fromMap(character)).toList();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.id == id &&
        other.name == name &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imagePath.hashCode;
}
