abstract class GroupFields {
  static const id = 'id';
  static const groups = 'groups';
  static const name = 'name';
}

class GroupModel {
  int id;
  int groups;
  String name;

  GroupModel({
    required this.id,
    required this.groups,
    required this.name,
  });

  factory GroupModel.fromJson(dynamic json) {
    return GroupModel(
      id: json[GroupFields.id],
      groups: int.parse(json[GroupFields.groups]),
      name: json[GroupFields.name],
    );
  }
}