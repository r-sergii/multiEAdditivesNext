import '../../providers/base.provider.dart';
import 'origin.models.dart';

class OriginProvider extends BaseProvider {
  OriginProvider() : super() {
    baseUrl = "${baseUrl}/origin";
  }

  Future<List<OriginModel>> getItems(String lang) async {
    return response(() => get('/$lang'), fromJsonList(OriginModel.fromJson));
  }

  Future<OriginModel> getItem(int id, String lang) async {
    return response(() => get('/item/$id/lang/$lang'), (data) => OriginModel.fromJson(data));
  }

  Future<OriginModel> getOrigin(int id, String lang) async {
    return response(() => get('/origin/$id/lang/$lang'), (data) => OriginModel.fromJson(data));
  }
}
