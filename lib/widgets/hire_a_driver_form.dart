import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/ViewModel/registration_view_model.dart';
import 'package:hire_a_driver_test/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

import '../resources/resource.dart';
import 'custom_text_button.dart';
import 'custom_textformfield.dart';

class HireADriverForm extends StatelessWidget {
  HireADriverForm({super.key});

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _rePreController = TextEditingController();
  final TextEditingController _rePreNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          CustomTextFormField(
            label: 'Company Name (optional)',
            hintText: 'Enter Company Name',
            controller: _companyNameController,
            widthPadding: 12,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Company Representative Name (optional)',
            hintText: 'Company Representative Name',
            controller: _rePreController,
            widthPadding: 12,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Company Representative Number (optional)',
            hintText: 'Enter Company Number',
            controller: _rePreNoController,
            widthPadding: 12,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          CustomTextFormField(
            label: 'Address',
            hintText: 'Address',
            controller: _addressController,
            focusNode: provider.addressFocusNode,
            onSubmitted: (value) => provider.moveToNextFocusNode(
                context, provider.addressFocusNode),
            widthPadding: 12,
            validator: (value) => provider.validateAddress(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Post Code',
            hintText: 'Post Code',
            controller: _postCodeController,
            focusNode: provider.postCodeFocusNode,
            onSubmitted: (value) => provider.moveToNextFocusNode(
                context, provider.postCodeFocusNode),
            widthPadding: 12,
            validator: (value) => provider.validatePostCode(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Mobile Number',
            hintText: 'Mobile Number',
            controller: _mobileNumberController,
            focusNode: provider.mobileNumberFocusNode,
            onSubmitted: (value) => provider.moveToNextFocusNode(
                context, provider.mobileNumberFocusNode),
            widthPadding: 12,
            validator: (value) => provider.validateNumber(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Email',
            hintText: 'Email',
            controller: _emailController,
            focusNode: provider.emailFocusNode,
            onSubmitted: (value) =>
                provider.moveToNextFocusNode(context, provider.emailFocusNode),
            widthPadding: 12,
            validator: (value) => provider.validateEmail(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Password',
            hintText: 'Password',
            controller: _passwordController,
            focusNode: provider.passwordFocusNode,
            onSubmitted: (value) => provider.moveToNextFocusNode(
                context, provider.passwordFocusNode),
            widthPadding: 12,
            validator: (value) => provider.validatePassword(value),
          ),
          const SizedBox(
            height: 20,
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
