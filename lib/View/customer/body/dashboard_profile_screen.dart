import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/repository/shared_preference_helper/shared_preference_helper.dart';
import 'package:hire_a_driver_test/widgets/custom_elevated_button.dart';
import 'package:hire_a_driver_test/widgets/custom_textformfield.dart';
import 'package:image_picker/image_picker.dart';

import '../../../resources/resource.dart';

class DashboardProfileScreen extends StatefulWidget {
  const DashboardProfileScreen({super.key});

  @override
  State<DashboardProfileScreen> createState() => _DashboardProfileScreenState();
}

class _DashboardProfileScreenState extends State<DashboardProfileScreen> {
  String? image;
  String? name;
  String? companyEmail;
  String? companyNumber;
  String? companyName;
  String? companyRepName;
  String? companyRepNumber;
  String? companyAddress;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyNumberController =
      TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyRepNameController =
      TextEditingController();
  final TextEditingController _companyRepNumberController =
      TextEditingController();
  final TextEditingController _companyAddressController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    loadCredential();
  }

  Future<void> loadCredential() async {
    SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
    Map<String, dynamic> credential =
        await sharedPreferenceHelper.loadCredential();
    setState(() {
      image = credential['image'];
      name = credential['name'];
      companyEmail = credential['companyEmail'];
      companyNumber = credential['companyNumber'];
      companyNumber = credential['companyNumber'];
      companyName = credential['companyName'];
      companyRepName = credential['companyRepName'];
      companyRepNumber = credential['companyRepNumber'];
      companyAddress = credential['companyAddress'];
    });

    _nameController.text = name ?? '';
    _companyEmailController.text = companyEmail ?? '';
    _companyNumberController.text = companyNumber ?? '';
    _companyNameController.text = companyName ?? '';
    _companyRepNameController.text = companyRepName ?? '';
    _companyRepNumberController.text = companyRepNumber ?? '';
    _companyAddressController.text = companyAddress ?? 'Empty';
  }

  Future<void> pickImage() async {
    ImagePicker picker = ImagePicker();

    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () => pickImage(),
                child: image == null
                    ? const CircleAvatar(
                        radius: 65,
                        child: CircularProgressIndicator(),
                      )
                    : CircleAvatar(
                        radius: 65,
                        backgroundImage: NetworkImage(image!),
                      ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Name:",
              style: TextStyle(color: Resource.blueColor),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: '',
              hintText: '',
              controller: _nameController,
              widthPadding: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Company Email:",
              style: TextStyle(color: Resource.blueColor),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: '',
              hintText: '',
              controller: _companyEmailController,
              widthPadding: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Company Number:",
              style: TextStyle(color: Resource.blueColor),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: '',
              hintText: '',
              controller: _companyNumberController,
              widthPadding: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Company Name:",
              style: TextStyle(color: Resource.blueColor),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: '',
              hintText: '',
              controller: _companyNameController,
              widthPadding: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Company Representative Name:",
              style: TextStyle(color: Resource.blueColor),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: '',
              hintText: '',
              controller: _companyRepNameController,
              widthPadding: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Company Representative Number:",
              style: TextStyle(color: Resource.blueColor),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: '',
              hintText: '',
              controller: _companyRepNumberController,
              widthPadding: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Company Address:",
              style: TextStyle(color: Resource.blueColor),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: '',
              hintText: '',
              controller: _companyAddressController,
              widthPadding: 10,
              maxLine: 3,
              heightPadding: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(buttonName: 'Update Profile', onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Report Generator",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )),
            const Divider(),
            GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )),
            const Divider(),
            GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )),
            const Divider(),
            GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )),
            const Divider(),
            GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delete Account",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )),
            const Divider(),
            GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )),
            const Divider(),
            const Center(
                child: Text(
              "App Version - 5.0.2(34)",
              style: TextStyle(color: Colors.red),
            )),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
