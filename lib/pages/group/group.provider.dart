import '../../providers/base.provider.dart';
import 'group.models.dart';

class GroupProvider extends BaseProvider {
  GroupProvider() : super() {
    baseUrl = "${baseUrl}/groups";
  }

  Future<List<GroupModel>> getItems(String lang) async {
    return response(() => get('/$lang'), fromJsonList(GroupModel.fromJson));
  }

  Future<GroupModel> getItem(int id, String lang) async {
    return response(() => get('/item/$id/lang/$lang'), (data) => GroupModel.fromJson(data));
  }

  Future<GroupModel> getGroup(int id, String lang) async {
    return response(() => get('/groups/$id/lang/$lang'), (data) => GroupModel.fromJson(data));
  }
}