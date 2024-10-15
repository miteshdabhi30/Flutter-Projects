import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  Future<void> saveCredential(
      String email,
      String password,
      String token,
      String image,
      String name,
      String companyName,
      String companyEmail,
      String companyNumber,
      String companyRepName,
      String companyRepNumber,
      String companyAddress) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('password', password);
    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('image', image);
    await sharedPreferences.setString('name', name);
    await sharedPreferences.setString('name', companyName);
    await sharedPreferences.setString('companyEmail', companyEmail);
    await sharedPreferences.setString('companyNumber', companyNumber);
    await sharedPreferences.setString('companyRepName', companyRepName);
    await sharedPreferences.setString('companyRepNumber', companyRepNumber);
    await sharedPreferences.setString('companyAddress', companyAddress);
    print("Sp Shaved");
  }

  Future<Map<String, dynamic>> loadCredential() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? email = sharedPreferences.getString('email');
    String? password = sharedPreferences.getString('password');
    String? token = sharedPreferences.getString('token');
    String? image = sharedPreferences.getString('image');
    String? name = sharedPreferences.getString('name');
    String? companyName = sharedPreferences.getString('companyName');
    String? companyEmail = sharedPreferences.getString('companyEmail');
    String? companyNumber = sharedPreferences.getString('companyNumber');
    String? companyRepName = sharedPreferences.getString('companyRepName');
    String? companyRepNumber = sharedPreferences.getString('companyRepNumber');
    String? companyAddress = sharedPreferences.getString('companyAddress');

    return {
      'email': email,
      'password': password,
      'token': token,
      'image': image,
      'name': name,
      'companyName': companyName,
      'companyEmail': companyEmail,
      'companyNumber': companyNumber,
      'companyRepName': companyRepName,
      'companyRepNumber': companyRepNumber,
      'companyAddress': companyAddress,
    };
  }

  Future<void> removeCredential() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.clear();
    print("SP Removed");
  }
}
