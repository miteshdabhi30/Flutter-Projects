import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/API/driver_getdriver_api/api_model_get_driver.dart';
import 'package:hire_a_driver_test/ViewModel/customer/body/offer_now_screen_view_model.dart';
import 'package:hire_a_driver_test/resources/resource.dart';
import 'package:hire_a_driver_test/widgets/custom_elevated_button.dart';
import 'package:hire_a_driver_test/widgets/custom_textformfield.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_select_date.dart';
import '../../widgets/custom_select_time.dart';

class OfferNowScreen extends StatefulWidget {
  final Data driver;

  const OfferNowScreen({super.key, required this.driver});

  @override
  State<OfferNowScreen> createState() => _OfferNowScreenState();
}

class _OfferNowScreenState extends State<OfferNowScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OfferNowScreenViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.driver.profileImage!),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(widget.driver.name!)
            ],
          ),
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Consumer<OfferNowScreenViewModel>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Pickup Date :",
                          style: TextStyle(
                              fontSize: 18,
                              color: Resource.blueColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomSelectTime(
                          title: provider.formatTime(provider.startTime),
                          value: provider.startTime,
                          onChange: provider.onStartTimeChanged,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        CustomSelectDate(
                          title: provider.formatDate(provider.startDate),
                          initialDate: provider.startDate,
                          onDateSelected: provider.onStartDateChanged,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "End Date :",
                          style: TextStyle(
                              fontSize: 18,
                              color: Resource.blueColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomSelectTime(
                          title: provider.formatTime(provider.endTime),
                          value: provider.endTime,
                          onChange: provider.onEndTimeChanged,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        CustomSelectDate(
                          title: provider.formatDate(provider.endDate),
                          initialDate: provider.endDate,
                          onDateSelected: provider.onEndDateChanged,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "From Location :",
                      style: TextStyle(
                          fontSize: 18,
                          color: Resource.blueColor,
                          fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      label: "",
                      hintText: "",
                      controller: provider.fromLocationController,
                      onChanged: (value) {
                        provider.onChangedFromController(value);
                        if (value == null &&
                            provider.fromLocationController.text.isNotEmpty) {
                          provider.clearSuggestions();
                        }
                      },
                      widthPadding: 12,
                    ),
                    if (provider.suggestionsFrom.isNotEmpty ||
                        provider.fromLocationController.text.isNotEmpty)
                      Container(
                        constraints: const BoxConstraints(maxHeight: 150),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.suggestionsFrom.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(provider.suggestionsFrom[index]
                                  ['description']),
                              onTap: () {
                                provider.fromLocationController.text = provider
                                    .suggestionsFrom[index]['description'];
                                provider.clearSuggestions();
                              },
                            );
                          },
                        ),
                      ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "To Location :",
                      style: TextStyle(
                          fontSize: 18,
                          color: Resource.blueColor,
                          fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      label: "",
                      hintText: "",
                      controller: provider.toLocationController,
                      onChanged: (value) {
                        provider.onChangedToController(value);
                        if (value.isEmpty) {
                          provider.clearSuggestions();
                        }
                      },
                      widthPadding: 12,
                    ),
                    if (provider.suggestionsTo.isNotEmpty)
                      Container(
                        constraints: const BoxConstraints(maxHeight: 150),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.suggestionsTo.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                  provider.suggestionsTo[index]['description']),
                              onTap: () {
                                provider.toLocationController.text = provider
                                    .suggestionsTo[index]['description'];
                                provider.clearSuggestions();
                              },
                            );
                          },
                        ),
                      ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Enter approximate kilometer :",
                      style: TextStyle(
                          fontSize: 18,
                          color: Resource.blueColor,
                          fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      label: "",
                      hintText: "",
                      controller: provider.kmLocationController,
                      widthPadding: 12,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Contract Type :",
                      style: TextStyle(
                          fontSize: 18,
                          color: Resource.blueColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: provider.selectedValue,
                              onChanged: provider.radioValueChange,
                            ),
                            const Text(
                              'Contract',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // Label for the first radio button
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: provider.selectedValue,
                              onChanged: provider.radioValueChange,
                            ),
                            const Text('Hourly',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            // Label for the second radio button
                          ],
                        ),
                      ],
                    ),
                    if (provider.selectedValue == 2)
                      const Text(
                        "* Hourly price should be between ${25} to ${100} ",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    Text(
                      "Price :",
                      style: TextStyle(
                          fontSize: 18,
                          color: Resource.blueColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Enter price that you wants to offer to driver",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      label: "",
                      hintText: "",
                      controller: provider.priceLocationController,
                      widthPadding: 12,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description :",
                      style: TextStyle(
                          fontSize: 18,
                          color: Resource.blueColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    CustomTextFormField(
                      label: "",
                      hintText: "",
                      controller: provider.descriptionLocationController,
                      widthPadding: 12,
                      minLine: 5,
                      maxLine: 10,
                      heightPadding: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomElevatedButton(
                        buttonName: "Offer Now",
                        onTap: () {
                          provider.onTappedOfferButton(
                              context,
                              provider.fromLocationController.text,
                              provider.toLocationController.text,
                              provider.priceLocationController.text, {
                            'pickupDate': provider.startDate,
                            'endDate': provider.endDate,
                            'fromLocation':
                                provider.fromLocationController.text,
                            'toLocation': provider.toLocationController.text,
                            'km': provider.kmLocationController.text,
                            'price': provider.priceLocationController.text,
                            'description':
                                provider.descriptionLocationController.text,
                          });
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
