import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/View/customer/appBar/history_appbar.dart';
import 'package:hire_a_driver_test/View/customer/appBar/home_screen_appbar.dart';
import 'package:hire_a_driver_test/View/customer/appBar/profile_appbar.dart';
import 'package:hire_a_driver_test/View/customer/appBar/request_appbar.dart';

import '../../View/customer/body/dashboard_history_screen.dart';
import '../../View/customer/body/dashboard_home_screen.dart';
import '../../View/customer/body/dashboard_profile_screen.dart';
import '../../View/customer/body/dashboard_request_screen.dart';

class DashboardViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  final List<Widget> _listOfBody = [
    const DashboardHomeScreen(),
    const DashboardRequestScreen(),
    const DashboardHistoryScreen(),
    const DashboardProfileScreen()
  ];

  int get currentIndex => _currentIndex;

  List<Widget> get listOfBody => _listOfBody;

  PreferredSizeWidget get currentAppBar {
    switch (_currentIndex) {
      case 0:
        return const HomeScreenAppBar();
      case 1:
        return const RequestAppBar();
      case 2:
        return const HistoryAppBar();
      case 3:
        return const ProfileAppBar();
      default:
        return AppBar(
          title: const Text("Default AppBar"),
        );
    }
  }

  void onTappedBar(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
