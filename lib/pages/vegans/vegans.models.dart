abstract class VegansFields {
  static const id = 'id';
  static const vegans = 'vegans';
  static const name = 'name';
}

class VegansModel {
  int id;
  int vegans;
  String name;

  VegansModel({
    required this.id,
    required this.vegans,
    required this.name,
  });

  factory VegansModel.fromJson(dynamic json) {
    return VegansModel(
      id: json[VegansFields.id],
      vegans: json[VegansFields.vegans],
      name: json[VegansFields.name],
    );
  }
}
