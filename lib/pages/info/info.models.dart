abstract class InfoFields {
  static const id = 'id';
  static const e = 'e';
  static const section = 'section';
  static const series = 'series';
  static const paragraph = 'paragraph';
  static const info = 'info';
}

class InfoModel {
  int id;
  String e;
  int section;
  int series;
  String paragraph;
  String info;
  bool isTranslate = false;

  InfoModel({
    required this.id,
    required this.e,
    required this.section,
    required this.series,
    required this.paragraph,
    required this.info,
  });

  factory InfoModel.fromJson(dynamic json) {
    return InfoModel(
      id: json[InfoFields.id] ?? 0,
      e: json[InfoFields.e] ?? '',
      section: json[InfoFields.section] ?? 0,
      series: json[InfoFields.series] ?? 0,
      paragraph: json[InfoFields.paragraph] ?? '',
      info: json[InfoFields.info] ?? '',
    );
  }
}
