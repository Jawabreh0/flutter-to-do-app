import 'dart:ui';

class CategoryEntity {
  final int? id;
  final String name;
  final int iconCode;
  final Color colorCode;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.iconCode,
    required this.colorCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'catgName': name,
      'catgIcon': iconCode,
      'catgColor': colorCode.value,
    };
  }

  static CategoryEntity fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      id: map['catgID'] as int?,
      name: map['catgName'],
      iconCode: map['catgIcon'] as int,
      colorCode: Color(map['catgColor'] as int),
    );
  }
}
