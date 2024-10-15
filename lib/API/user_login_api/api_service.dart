
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../resources/api_link.dart';
import 'api_model.dart';

class ApiService {
  Future<List<Data>?> login(String email, String password, context) async {
    try {
      Response response = await post(
          Uri.parse(ApiLink.userLogin),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        ApiModel apiModel = ApiModel.fromJson(jsonDecode(response.body));
        if (apiModel.success && apiModel.data.isNotEmpty) {
          return apiModel.data;
        }
      } else {
        if (kDebugMode) {
          print("Failed");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
    return null;
  }
}





