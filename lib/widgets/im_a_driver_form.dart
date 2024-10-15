import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/ViewModel/registration_view_model.dart';
import 'package:hire_a_driver_test/widgets/custom_elevated_button.dart';
import 'package:hire_a_driver_test/widgets/custom_text_button.dart';
import 'package:hire_a_driver_test/widgets/custom_textformfield.dart';
import 'package:provider/provider.dart';

import '../resources/resource.dart';
import 'custom_dropdown_menu.dart';

class IAmADriverForm extends StatefulWidget {
  const IAmADriverForm({super.key});

  @override
  State<IAmADriverForm> createState() => _IAmADriverFormState();
}

class _IAmADriverFormState extends State<IAmADriverForm> {
  final List<String> driverTypeList = ["Both", "Bus Driver", "Truck Driver"];
  final List<String> experienceList = [
    "Route",
    "Express",
    "Tours",
    "Extend Tour"
  ];
  final List<String> languageList = ["English", "Spanish", "Russian"];
  final List<String> licenceTypeList = [
    "Car Licence",
    "Rider Licence",
    "Restricted Rider Licence",
    "Light Rigid Licence",
    "Medium Rigid Licence",
    "Heavy Rigid Licence",
    "Heavy Combination Licence",
    "Multi Combination Licence"
  ];
  final List<String> selectedLicenceType = [];

  String? driverTypeValue;
  String? licenceTypeValue;
  String? experienceValue;
  String? languageValue;

  final TextEditingController _licenceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _firstCheck = false;
  bool _secondCheck = false;
  bool _thirdCheck = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationViewModel>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text("Driver Type :"),
              const SizedBox(
                width: 10,
              ),
              CustomDropDownMenu(
                selectedValue: driverTypeValue,
                items: driverTypeList,
                onChanged: (value) => setState(() {
                  driverTypeValue = value!;
                }),
                height: 40,
                width: 140,
                hint: "Select type",
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Licence Number',
            hintText: 'Enter Licence number',
            controller: _licenceController,
            focusNode: provider.licenceNumberFocusNode,
            onSubmitted: (value) => provider.moveToNextFocusNode(
                context, provider.licenceNumberFocusNode),
            widthPadding: 12,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomDropDownMenu(
            selectedValue: licenceTypeValue,
            items: licenceTypeList,
            onChanged: (value) => setState(() {
              licenceTypeValue = value!;
              if (!selectedLicenceType.contains(value)) {
                selectedLicenceType.add(value);
              }
            }),
            height: 45,
            width: MediaQuery.of(context).size.width,
            hint: "Licence Type",
          ),
          if (selectedLicenceType.isNotEmpty)
          SizedBox(
            height: 50,
            child: Flexible(
                child: ListView.builder(
                    itemCount: selectedLicenceType.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text(selectedLicenceType[index]),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedLicenceType.removeAt(index);
                                      });
                                    },
                                    icon:
                                        const Icon(Icons.remove_circle_outline, color: Colors.purple,))
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
          ),
          CheckboxListTile(
              title: const Text("Extra Bus Driver Authority"),
              value: _firstCheck,
              onChanged: (value) {
                setState(() {
                  _firstCheck = value!;
                });
              }),
          CheckboxListTile(
              title: const Text("Working With Children Certificate"),
              value: _secondCheck,
              onChanged: (value) {
                setState(() {
                  _secondCheck = value!;
                });
              }),
          CheckboxListTile(
              title: const Text("Snow Licence"),
              value: _thirdCheck,
              onChanged: (value) {
                setState(() {
                  _thirdCheck = value!;
                });
              }),
          CustomDropDownMenu(
            selectedValue: experienceValue,
            items: experienceList,
            onChanged: (value) => setState(() {
              experienceValue = value!;
            }),
            height: 45,
            width: MediaQuery.of(context).size.width,
            hint: "Experience",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomDropDownMenu(
            selectedValue: languageValue,
            items: languageList,
            onChanged: (value) => setState(() {
              languageValue = value!;
            }),
            height: 45,
            width: MediaQuery.of(context).size.width,
            hint: "Language",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Address',
            hintText: 'Enter Address',
            controller: _addressController,
            focusNode: provider.addressFocusNode,
            onSubmitted: (value) => provider.moveToNextFocusNode(
                context, provider.addressFocusNode),
            widthPadding: 12,
            validator: (value) => provider.validateAddress(value),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Post Code',
            hintText: 'Enter Post Code',
            controller: _postCodeController,
            focusNode: provider.postCodeFocusNode,
            onSubmitted: (value) => provider.moveToNextFocusNode(
                context, provider.postCodeFocusNode),
            widthPadding: 12,
            validator: (value) => provider.validatePostCode(value),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Mobile Number',
            hintText: 'Enter Mobile Number',
            controller: _mobileController,
            focusNode: provider.mobileNumberFocusNode,
            onSubmitted: (value) => provider.moveToNextFocusNode(
                context, provider.mobileNumberFocusNode),
            widthPadding: 12,
            validator: (value) => provider.validateNumber(value),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Email',
            hintText: 'Enter Email',
            controller: _emailController,
            focusNode: provider.emailFocusNode,
            onSubmitted: (value) =>
                provider.moveToNextFocusNode(context, provider.emailFocusNode),
            widthPadding: 12,
            validator: (value) => provider.validateEmail(value),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Password',
            hintText: 'Enter Address',
            controller: _passwordController,
            focusNode: provider.passwordFocusNode,
            onSubmitted: (value) => provider.moveToNextFocusNode(
                context, provider.passwordFocusNode),
            widthPadding: 12,
            obscure: provider.isVisible,
            suffixIcon: IconButton(
              onPressed: provider.toggleVisibility,
              icon: provider.isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            validator: (value) => provider.validatePassword(value),
          ),
          const SizedBox(
            height: 17,
          ),
          CustomElevatedButton(
              buttonName: "Join Now",
              onTap: () {
                if (_formKey.currentState!.validate()) {}
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account ?"),
              CustomTextButton.customTextButton(() {
                Navigator.pop(context);
              }, "Login", Resource.blueColor)
            ],
          ),
        ],
      ),
    );
  }
}
