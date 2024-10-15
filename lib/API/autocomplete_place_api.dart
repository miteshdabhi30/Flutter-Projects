import 'dart:convert';

import 'package:http/http.dart';

class AutoCompletePlaceApi {
  Future<List<dynamic>> fetchSuggestions(String input) async {
    String sessionToken = '1234567890';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String token = "AIzaSyBxa0BWP6lNqOF4ZidliO_fky18n0Z8w2Q&sessiontoken";
    String request = '$baseURL?input=$input&key=$token=$sessionToken';

    try {
      Response response = await get(Uri.parse(request));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['predictions'];
      } else {
        return [];
      }
    } catch (e) {
      print("e: $e");
      return [];
    }
  }
}
