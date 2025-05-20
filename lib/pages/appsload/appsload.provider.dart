import 'package:flutter/material.dart';

import '../../providers/base.provider.dart';
import 'appsload.model.dart';

class AppsLoadProvider extends BaseProvider {
  AppsLoadProvider() : super() {
    // baseUrl = "http://192.168.0.106:3040/api/appsload";
    baseUrl = "$baseUrl/appsload";
  }

  Future<List<AppsLoadModel>> getItems(String lang) async {
    return response(() => get('/'), fromJsonList(AppsLoadModel.fromJson));
  }

  Future<void> insertItem(AppsLoadModel value) async {
    Map<String, dynamic>? params = {
      // 'id': value.id,
      'application': value.application,
      'platform': value.platform,
      'email': value.email,
      'uid': value.uid,
      'device': value.device,
      'locale': value.locale,
      'datetime': value.datetime,
    };
    debugPrint(params.toString());
    return await response(() => post<Map>('/', params), (data) {});
  }

  // Future<AppsloadModel> getItem(int id, String lang) async {
  //   return response(() => get('/item/$id/lang/$lang'), (data) => AppsloadModel.fromJson(data));
  // }
}
