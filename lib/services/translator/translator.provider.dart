import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'translator.model.dart';

class TranslatorProvider {
  Future<List<ResultTranslatorModel>> getDataList(String host, String path, Map<String, dynamic> data) async {
    final url = Uri.https(host, path, data);
    debugPrint(url.toString());
    return await http.get(url).then((response) {
      debugPrint(response.body.toString());
      var jsonResultTranslatorModel = convert.jsonDecode(response.body) as List;
      debugPrint(jsonResultTranslatorModel.toString());
      return jsonResultTranslatorModel.map((json) => ResultTranslatorModel.fromJson(json)).toList();
    });
  }
}
