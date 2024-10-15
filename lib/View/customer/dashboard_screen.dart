import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/repository/shared_preference_helper/shared_preference_helper.dart';
import 'package:hire_a_driver_test/resources/resource.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/customer/dashboard_view_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardViewModel>(context);
    return Scaffold(
      appBar: provider.currentAppBar,
      body: provider.listOfBody[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Resource.blueColor,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Resource.whiteColor,
        onTap: provider.onTappedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental), label: 'Request'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sharedPreferenceHelper.removeCredential();
          setState(() {});
        },
        child: const Icon(Icons.remove_circle_outline),
      ),
    );
  }
}

