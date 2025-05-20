import '../../providers/base.provider.dart';
import 'info.models.dart';

class InfoProvider extends BaseProvider {
  InfoProvider() : super() {
    baseUrl = "${baseUrl}/info";
  }

  Future<List<InfoModel>> getItems() async {
    return response(() => get('/'), fromJsonList(InfoModel.fromJson));
  }

  Future<InfoModel> getItem(int id, String lang) async {
    return response(() => get('/item/$id/lang/$lang'), (data) => InfoModel.fromJson(data));
  }

  Future<List<InfoModel>> getAdditives(String e, int section, String lang) async {
    return response( () async => await get('/additives/$e/section/$section/lang/$lang'), fromJsonList(InfoModel.fromJson));
  }
}