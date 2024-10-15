import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/API/driver_getdriver_api/api_model_get_driver.dart';

class RatingScreen extends StatefulWidget {
  final Data driver;

  const RatingScreen({super.key, required this.driver});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review History"),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.driver.profileImage!),
              radius: 40,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.driver.name!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                Text(
                  " ${widget.driver.avgRating!} Ratings",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
