import 'package:flutter/material.dart';

import '../resources/resource.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;

  const CustomElevatedButton(
      {super.key, required this.buttonName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Resource.blueColor),
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(color: Resource.whiteColor, fontSize: 18),
        )),
      ),
    );
  }
}
