import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/ViewModel/customer/body/home_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../../driver_details_screen.dart';

class ListViewBody extends StatefulWidget {
  const ListViewBody({super.key});

  @override
  State<ListViewBody> createState() => _ListViewBodyState();
}

class _ListViewBodyState extends State<ListViewBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeScreenViewModel>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewModel>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.errorMessage != null) {
          return Center(child: Text(provider.errorMessage!));
        }

        if (provider.driverList != null && provider.driverList!.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              itemCount: provider.driverList!.length,
              itemBuilder: (context, index) {
                final driver = provider.driverList![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DriverDetailsScreen(driverDetails: driver,)));
                    },
                    child: Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: driver.profileImage !=
                                              null &&
                                          driver.profileImage!.isNotEmpty
                                      ? NetworkImage(driver.profileImage!)
                                      : const AssetImage(
                                              'assets/placeholder_image.png')
                                          as ImageProvider,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      driver.name!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.green),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 5),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  size: 12,
                                                  color: Colors.white,
                                                ),
                                                const Text(
                                                  " | ",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  driver.avgRating!,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                const Text("Licence No : "),
                                Text(
                                  driver.licenceNumber!,
                                  style: const TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Language : "),
                                Text(
                                  driver.language!,
                                  style: const TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Experience : "),
                                Text(
                                  driver.experience!,
                                  style: const TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.values.first,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Licences : "),
                                Expanded(
                                  child: Text(
                                    driver.licence!,
                                    style: const TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.fade,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(child: Text("No drivers available"));
      },
    );
  }
}
