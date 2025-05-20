// import '../../providers/base.provider.dart';
// import 'find.models.dart';


// class FindProvider extends BaseProvider {
//   FindProvider() : super() {
//     baseUrl = "${baseUrl}/classification";
//   }

//   Future<List<FindModel>> getItems(String lang) async {
//     return response(() => get('/$lang'), fromJsonList(FindModel.fromJson));
//   }

//   Future<FindModel> getItem(int id, String lang) async {
//     return response(() => get('/item/$id/lang/$lang'), (data) => FindModel.fromJson(data));
//   }
// }