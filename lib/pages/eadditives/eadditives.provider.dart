import '../../providers/base.provider.dart';
import 'eadditives.models.dart';

class EAdditivesProvider extends BaseProvider {
  EAdditivesProvider() : super() {
    baseUrl = "${baseUrl}/list";
  }

  Future<List<EAdditivesModel>> getDanger(int item) async {
    return response(() => get('/danger/$item'), fromJsonList(EAdditivesModel.fromJson));
  }

  Future<List<EAdditivesModel>> getVegans(int item) async {
    return response(() => get('/vegans/$item'), fromJsonList(EAdditivesModel.fromJson));
  }

  Future<List<EAdditivesModel>> getOrigin(int item) async {
    return response(() => get('/origin/$item'), fromJsonList(EAdditivesModel.fromJson));
  }

  Future<List<EAdditivesModel>> getGroups(int item) async {
    return response(() => get('/groups/$item'), fromJsonList(EAdditivesModel.fromJson));
  }

  Future<List<EAdditivesModel>> getClassification(int start, int count) async {
    return response(() => get('/classification/offset/$start/count/$count'), fromJsonList(EAdditivesModel.fromJson));
  }

  Future<EAdditivesModelExt> getAdditives(String e, String lang) async {
    return response(() => get('/additives/$e/lang/$lang'), (data) => EAdditivesModelExt.fromJson(data));
  }

  Future<CountModel> getCount(String e) async {
    return response(() => get('/ise/e/$e'), (data) => CountModel.fromJson(data));
  }
}
