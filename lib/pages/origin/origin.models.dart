abstract class OriginFields {
  static const id = 'id';
  static const origin = 'origin';
  static const name = 'name';
}

class OriginModel {
  int id;
  int origin;
  String name;

  OriginModel({
    required this.id,
    required this.origin,
    required this.name,
  });

  factory OriginModel.fromJson(dynamic json) {
    return OriginModel(
      id: json[OriginFields.id],
      origin: int.parse(json[OriginFields.origin]),
      name: json[OriginFields.name],
    );
  }
}
