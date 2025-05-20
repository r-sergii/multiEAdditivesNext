import '../../providers/base.provider.dart';
import 'sections.models.dart';

class SectionsProvider extends BaseProvider {
  SectionsProvider() : super() {
    baseUrl = "${baseUrl}/sections";
  }

  Future<List<SectionsModel>> getItems(String lang) async {
    return response(() => get('/$lang'), fromJsonList(SectionsModel.fromJson));
  }

  Future<SectionsModel> getItem(int id, String lang) async {
    return response(() => get('/item/$id/lang/$lang'), (data) => SectionsModel.fromJson(data));
  }

  Future<SectionsModel> getSection(int id, String lang) async {
    return response(() => get('/section/$id/lang/$lang'), (data) => SectionsModel.fromJson(data));
  }
}
