import '../../providers/base.provider.dart';
import 'vegans.models.dart';

class VegansProvider extends BaseProvider {
  VegansProvider() : super() {
    baseUrl = "${baseUrl}/vegans";
  }

  Future<List<VegansModel>> getItems(String lang) async {
    return response(() => get('/$lang'), fromJsonList(VegansModel.fromJson));
  }

  Future<VegansModel> getItem(int id, String lang) async {
    return response(() => get('/item/$id/lang/$lang'), (data) => VegansModel.fromJson(data));
  }

  Future<VegansModel> getVegans(int id, String lang) async {
    return response(() => get('/vegans/$id/lang/$lang'), (data) => VegansModel.fromJson(data));
  }
}