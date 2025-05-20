import '../../providers/base.provider.dart';
import 'danger.models.dart';

class DangerProvider extends BaseProvider {
  DangerProvider() : super() {
    baseUrl = "${baseUrl}/danger";
  }

  Future<List<DangerModel>> getItems(String lang) async {
    return await response(() async => await get('/$lang'), fromJsonList(DangerModel.fromJson));
  }

  Future<DangerModel> getItem(int id, String lang) async {
    return await response(() => get('/item/$id/lang/$lang'), (data) => DangerModel.fromJson(data));
  }

  Future<DangerModel> getDanger(int id, String lang) async {
    return await response(() => get('/danger/$id/lang/$lang'), (data) => DangerModel.fromJson(data));
  }
}
