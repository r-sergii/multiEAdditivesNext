import '../../providers/base.provider.dart';
import 'classification.models.dart';


class ClassificationProvider extends BaseProvider {
  ClassificationProvider() : super() {
    baseUrl = "${baseUrl}/classification";
  }

  Future<List<ClassificationModel>> getItems(String lang) async {
    return response(() => get('/$lang'), fromJsonList(ClassificationModel.fromJson));
  }

  Future<ClassificationModel> getItem(int id, String lang) async {
    return response(() => get('/item/$id/lang/$lang'), (data) => ClassificationModel.fromJson(data));
  }
}