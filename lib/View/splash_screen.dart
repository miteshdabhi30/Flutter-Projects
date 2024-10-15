import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/repository/shared_preference_helper/shared_preference_helper.dart';

import 'customer/dashboard_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper();


  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      _checkForCredentials();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  Future<void> _checkForCredentials() async {
    final credentials = await _sharedPreferenceHelper.loadCredential();
    if (credentials['email'] != null && credentials['password'] != null && credentials['token'] != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "HIRE A DRIVER",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
