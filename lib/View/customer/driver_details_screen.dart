import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/resources/resource.dart';
import 'package:hire_a_driver_test/widgets/custom_elevated_button.dart';

import '../../API/driver_getdriver_api/api_model_get_driver.dart';
import 'body/widgets/rating_screen.dart';
import 'offer_now_screen.dart';

class DriverDetailsScreen extends StatelessWidget {
  final Data driverDetails;

  const DriverDetailsScreen({super.key, required this.driverDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meet Your Driver"),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(driverDetails.profileImage!),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    driverDetails.name!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    driverDetails.email!,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RatingScreen(driver: driverDetails,)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                        Text(
                          " ${driverDetails.avgRating!} Ratings",
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              const Text(
                "Licence No :",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                driverDetails.licenceNumber!,
                style: TextStyle(
                    fontSize: 18,
                    color: Resource.blueColor,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const Text(
                "Driver Type :",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                driverDetails.driverType!,
                style: TextStyle(
                    fontSize: 18,
                    color: Resource.blueColor,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const Text(
                "Languages",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                driverDetails.language!,
                style: TextStyle(
                    fontSize: 18,
                    color: Resource.blueColor,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const Text(
                "Licence Type :",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                driverDetails.licence!,
                style: TextStyle(
                    fontSize: 18,
                    color: Resource.blueColor,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const Text(
                "Experience :",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                driverDetails.experience!,
                style: TextStyle(
                    fontSize: 18,
                    color: Resource.blueColor,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(buttonName: "Offer Now", onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OfferNowScreen(driver: driverDetails,)));
              }),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
