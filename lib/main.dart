import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/View/splash_screen.dart';
import 'package:hire_a_driver_test/ViewModel/login_view_model.dart';
import 'package:hire_a_driver_test/ViewModel/registration_view_model.dart';
import 'package:provider/provider.dart';

import 'ViewModel/customer/body/home_screen_view_model.dart';
import 'ViewModel/customer/body/offer_now_screen_view_model.dart';
import 'ViewModel/customer/dashboard_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(create: (context) => RegistrationViewModel()),
        ChangeNotifierProvider(create: (context) => DashboardViewModel()),
        ChangeNotifierProvider(create: (context) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (context) => OfferNowScreenViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
