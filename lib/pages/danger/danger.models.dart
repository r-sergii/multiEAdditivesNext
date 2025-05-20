abstract class DangerFields {
  static const id = 'id';
  static const danger = 'danger';
  static const name = 'name';
}

class DangerModel {
  int id;
  int danger;
  String name;

  DangerModel({
    required this.id,
    required this.danger,
    required this.name,
  });

  factory DangerModel.fromJson(dynamic json) {
    return DangerModel(
      id: json[DangerFields.id],
      danger: json[DangerFields.danger],
      name: json[DangerFields.name],
    );
  }
}
