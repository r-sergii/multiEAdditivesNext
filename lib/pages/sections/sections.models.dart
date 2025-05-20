abstract class SectionsFields {
  static const id = 'id';
  static const section = 'section';
  static const name = 'name';
}

class SectionsModel {
  int id;
  int section;
  String name;

  SectionsModel({
    required this.id,
    required this.section,
    required this.name,
  });

  factory SectionsModel.fromJson(dynamic json) {
    return SectionsModel(
      id: json[SectionsFields.id] ?? 0,
      section: json[SectionsFields.section] ?? 0,
      name: json[SectionsFields.name] ?? '',
    );
  }
}
