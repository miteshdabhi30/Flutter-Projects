import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/View/customer/dashboard_screen.dart';
import 'package:hire_a_driver_test/View/register_screen.dart';
import 'package:hire_a_driver_test/resources/resource.dart';
import 'package:provider/provider.dart';

import '../ViewModel/login_view_model.dart';
import '../repository/shared_preference_helper/shared_preference_helper.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "LOG IN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 0,
                ),
                const Text("Welcome to Hire A Driver"),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  hintText: 'Enter Email',
                  label: 'Email',
                  focusNode: provider.emailFocus,
                  onSubmitted: (value) => provider.onFieldSubmitted(context),
                  heightPadding: 14,
                  widthPadding: 10,
                  validator: (value) =>
                      provider.validateEmail(_emailController.text.toString()),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  hintText: 'Enter Password',
                  label: 'Password',
                  focusNode: provider.passwordFocus,
                  onSubmitted: (value) => provider.onFieldSubmitted(context),
                  obscure: provider.isVisible ? false : true,
                  heightPadding: 14,
                  widthPadding: 10,
                  validator: (value) => provider.validatePassword(value),
                  suffixIcon: IconButton(
                      onPressed: provider.toggleVisibility,
                      icon: provider.isVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            )),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                    buttonName: "LOG IN",
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final dataList = await provider.login(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                            context);
                        if (dataList != null && dataList.isNotEmpty) {
                          final token = dataList[0].token;
                          final image = dataList[0].profileImage;
                          final name = dataList[0].name;
                          final companyName = dataList[0].companyList[0].companyName;
                          final companyEmail = dataList[0].email;
                          final companyNumber = dataList[0].phoneNumber;
                          final companyRepName =
                              dataList[0].companyList[0].companyRepresentative;
                          final companyRepNumber = dataList[0]
                              .companyList[0]
                              .companyRepresentativeNumber;
                          final companyAddress =
                              dataList[0].companyList[0].companyAddress;

                          await SharedPreferenceHelper().saveCredential(
                              _emailController.text,
                              _passwordController.text,
                              token,
                              image,
                              name,
                              companyName,
                              companyEmail,
                              companyNumber,
                              companyRepName,
                              companyRepNumber,
                              companyAddress);

                          print(token);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DashboardScreen()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login Failed")));
                        }
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ?"),
                    CustomTextButton.customTextButton(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    }, "Register", Resource.blueColor)
                  ],
                ),
                Center(
                  child: CustomTextButton.customTextButton(
                      () {}, "Forgot Password ?", Resource.blackColor),
                )
              ],
            ),
          ),
        ),
        if (provider.isLoading)
          Container(
            color: Colors.black54,
            child: const Center(child: CircularProgressIndicator()),
          ),
      ]),
    );
  }
}
