import '../vegans/vegans.models.dart';
import '../danger/danger.models.dart';
import '../group/group.models.dart';
import '../origin/origin.models.dart';

abstract class EAdditivesFields {
  static const id = 'id';
  static const e = 'e';
  static const name = 'name';
  static const danger = 'danger';
  static const groups = 'groups';
  static const origin = 'origin';
  static const vegans = 'vegans';
  static const dangerName = 'danger_name';
  static const groupsName = 'groups_name';
  static const originName = 'origin_name';
  static const vegansName = 'vegans_name';
}

abstract class ECountFields {
  static const count = 'counte';
}

class EAdditivesModel {
  bool? isLoad = false;
  int id;
  String e;
  String name;
  int danger;
  List<dynamic> groups;
  List<dynamic> origin;
  int vegans;

  EAdditivesModel({
    this.isLoad = true,
    required this.id,
    required this.e,
    required this.name,
    required this.danger,
    required this.groups,
    required this.origin,
    required this.vegans,
  });

  factory EAdditivesModel.fromJson(dynamic json) {
    return EAdditivesModel(
      id: json[EAdditivesFields.id] ?? 0,
      e: json[EAdditivesFields.e] ?? '',
      name: json[EAdditivesFields.name] ?? '',
      danger: json[EAdditivesFields.danger],
      groups: json[EAdditivesFields.groups] ?? [],
      origin: json[EAdditivesFields.origin] ?? [],
      vegans: json[EAdditivesFields.vegans] ?? 0,
    );
  }
}

class EAdditivesModelExt {
  bool? isLoad = false;
  int id;
  String e;
  String name;
  int danger;
  List<dynamic> groups;
  List<dynamic> origin;
  int vegans;
  String dangerName;
  List<dynamic> groupsName;
  List<dynamic> originName;
  String vegansName;
  DangerModel? dangerItem;
  List<GroupModel>? groupsItems;
  List<OriginModel>? originItems;
  VegansModel? vegansItem;

  EAdditivesModelExt(
      {this.isLoad = true,
      required this.id,
      required this.e,
      required this.name,
      required this.danger,
      required this.groups,
      required this.origin,
      required this.vegans,
      required this.dangerName,
      required this.groupsName,
      required this.originName,
      required this.vegansName});

  factory EAdditivesModelExt.fromJson(dynamic json) {
    return EAdditivesModelExt(
      id: json[EAdditivesFields.id] ?? 0,
      e: json[EAdditivesFields.e] ?? '',
      name: json[EAdditivesFields.name] ?? '',
      danger: json[EAdditivesFields.danger],
      groups: json[EAdditivesFields.groups] ?? [],
      origin: json[EAdditivesFields.origin] ?? [],
      vegans: json[EAdditivesFields.vegans] ?? 0,
      dangerName: json[EAdditivesFields.dangerName] ?? '',
      groupsName: json[EAdditivesFields.groupsName] ?? [],
      originName: json[EAdditivesFields.originName] ?? [],
      // groupsName: groupsItems,
      // originName: originItems,
      vegansName: json[EAdditivesFields.vegansName] ?? '',
    );
  }

  make() {
    dangerItem = DangerModel(id: 0, danger: danger, name: dangerName);
    groupsItems = toGroups(groupsName);
    originItems = toOrigin(originName);
    vegansItem = VegansModel(id: 0, vegans: vegans, name: vegansName);
  }

  List<OriginModel> toOrigin(List<dynamic> jsonArray) {
    List<OriginModel> list = [];
    jsonArray.forEach((element) {
      list.add(OriginModel.fromJson(element));
    });
    return list;
  }

  List<GroupModel> toGroups(List<dynamic> jsonArray) {
    List<GroupModel> list = [];
    jsonArray.forEach((element) {
      list.add(GroupModel.fromJson(element));
    });
    return list;
  }

  EAdditivesModel toModel() {
    return EAdditivesModel(
      id: id,
      e: e,
      name: name,
      danger: danger,
      groups: groups,
      origin: origin,
      vegans: vegans,
    );
  }
}

class CountModel {
  bool? isLoad = false;
  int count;

  CountModel(
      {this.isLoad = true,
      required this.count,
});

  factory CountModel.fromJson(dynamic json) {
    return CountModel(
      count: json[ECountFields.count] ?? 0,
    );
  }

  CountModel toModel() {
    return CountModel(
      count: count,
    );
  }
}
