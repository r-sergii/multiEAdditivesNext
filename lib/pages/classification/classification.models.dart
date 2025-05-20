abstract class ClassificationFields {
  static const id = 'id';
  static const nomer = 'nomer';
  static const classification = 'classification';
  static const name = 'name';
  static const start = 'start';
  static const offset = 'offset';
}

class ClassificationModel {
  int id;
  int nomer;
  String classification;
  String name;
  int start;
  int offset;

  ClassificationModel({
    required this.id,
    required this.nomer,
    required this.classification,
    required this.name,
    required this.start,
    required this.offset,
  });

  factory ClassificationModel.fromJson(dynamic json) {
    return ClassificationModel(
      id: json[ClassificationFields.id],
      nomer: json[ClassificationFields.nomer],
      classification: json[ClassificationFields.classification],
      name: json[ClassificationFields.name],
      start: json[ClassificationFields.start],
      offset: json[ClassificationFields.offset],
    );
  }
}
