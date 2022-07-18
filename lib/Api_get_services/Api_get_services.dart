import 'dart:convert';

import 'package:blogresponsive/Api_routes/apiRoutes.dart';
import 'package:http/http.dart' as http;

import '../Api_res_model/newsGModel.dart';

class ApiGetServices {
  static Future<NewsGModel?> newsdataservice() async {
    http.Response response = await http.get(Uri.parse(ApiRoutes.newsApiurl));

    // print("Api Response ===${jsonDecode(response.body)}");

    if (response.statusCode == 200) {
      print("Api Response Success===>>>>");

      var jsonString = response.body;
      return newsGModelFromJson(jsonString);
    } else {
      print("response ====== ApiError");
      return null;
    }
  }
}
