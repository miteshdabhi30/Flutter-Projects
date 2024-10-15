import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

import '../resources/resource.dart';

class CustomSelectTime extends StatelessWidget {
  final Time value;
  final ValueChanged<Time> onChange;
  final String title;

  const CustomSelectTime(
      {super.key,
      required this.value,
      required this.onChange,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          showPicker(
            showSecondSelector: true,
            context: context,
            value: value,
            onChange: onChange,
            minuteInterval: TimePickerInterval.ONE,
            onChangeDateTime: (DateTime dateTime) {
              debugPrint("[debug datetime]:  $dateTime");
            },
          ),
        );
      },
      child: Container(
        color: Colors.indigo.shade500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            title,
            style: TextStyle(color: Resource.whiteColor),
          ),
        ),
      ),
    );
  }
}
