import 'dart:convert';
import 'dart:developer';
import 'package:graduation/core/constants.dart';
import 'package:graduation/models/home_model.dart';
import 'package:http/http.dart' as http;
class Api_Manager {
  Future<List<Data>?> fetchHome() async {
    final response = await http.get(
        Uri.parse(
          // Constants.Ai_base_URLp + "/api/products/home",
            "http://10.0.2.2:8000/api/products/home"
        ),
        // headers:{
        //   "Access-Control-Allow-Origin": "*",
        //   "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT,DELETE,HEAD"
        // }
        );
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final homemodel = HomeModel.fromJson(decodedResponse);
      return homemodel.allDate;
    } else {
      throw Exception('Failed to load products');
    }
  }
}