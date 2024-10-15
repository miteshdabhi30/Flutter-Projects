import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hire_a_driver_test/API/driver_getdriver_api/api_model_get_driver.dart';
import 'package:http/http.dart';

import '../../resources/api_link.dart';

class ApiServiceGetDriver {
  Future<List<Data>?> getData() async {
    Response response =
        await post(Uri.parse(ApiLink.driverAndGetDriver1), headers: {
      'app-version': '5.0.0',
      'app-type': 'android',
      'login-token': '1728964906nwqPVA1YTjtWuc0y6LwylsQoK',
      'user-id': '16'
    }, body: {});

    if (response.statusCode == 200) {
      ApiModelGetDriver apiModelGetDriver =
          ApiModelGetDriver.fromJson(jsonDecode(response.body));
      if (kDebugMode) {
        print("Driver List Loaded");
      }
      if (apiModelGetDriver.data!.isNotEmpty) {
        return apiModelGetDriver.data;
      }
    }
    if (kDebugMode) {
      print("Driver List not Getting");
    }
    return null;
  }
}
