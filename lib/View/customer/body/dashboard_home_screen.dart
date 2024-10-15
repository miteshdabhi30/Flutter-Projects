import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/View/customer/body/widgets/list_view_body.dart';
import 'package:hire_a_driver_test/View/customer/body/widgets/map_view_body.dart';

class DashboardHomeScreen extends StatefulWidget {

  const DashboardHomeScreen({super.key});

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 0;
                    });
                  },
                  child: Container(
                    height: 32,
                    width: 120,
                    color: _index == 0 ? Colors.indigo : Colors.grey,
                    child: Center(
                        child: Text(
                      "List View",
                      style: TextStyle(
                          color: _index == 0 ? Colors.white : Colors.black),
                    )),
                  )),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _index = 1;
                  });
                },
                child: Container(
                  height: 32,
                  width: 120,
                  color: _index == 1 ? Colors.indigo : Colors.grey,
                  child: Center(
                      child: Text("Map View",
                          style: TextStyle(
                              color:
                                  _index == 1 ? Colors.white : Colors.black))),
                ),
              ),
            ],
          ),

          if(_index == 0)
             const ListViewBody(),
          if(_index == 1)
            const MapViewBody()
        ],
      ),
    );
  }
}
