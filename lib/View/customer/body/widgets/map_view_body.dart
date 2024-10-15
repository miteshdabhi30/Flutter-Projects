import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/repository/shared_preference_helper/shared_preference_helper.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {

  String? email;
  String? password;
  String? token;

  @override
  void initState() {
    super.initState();
    loadCredential();
  }

  Future<void> loadCredential() async {
    SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
    Map<String,dynamic>  credential = await sharedPreferenceHelper.loadCredential();
    setState(() {
      email = credential['email'];
      password = credential['password'];
      token = credential['token'];
    });


  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Email: ${email ?? 'No email saved'}"),
          Text("Password: ${password ?? 'No password saved'}"),
          Text("Token: ${token ?? 'No token saved'}"),
        ],
      ),
    );
  }
}
