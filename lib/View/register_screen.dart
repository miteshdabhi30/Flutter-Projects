import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/ViewModel/registration_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_textformfield.dart';
import '../widgets/hire_a_driver_form.dart';
import '../widgets/im_a_driver_form.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationViewModel>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Registration"),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Join to Hire A Driver",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        label: "User Name",
                        hintText: "Enter use name",
                        controller: provider.userNameController,
                        focusNode: provider.userNameFocusNode,
                        onSubmitted: (value) => provider.moveToNextFocusNode(
                            context, provider.userNameFocusNode),
                        widthPadding: 12,
                        validator: (value) => provider.validateUseName(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Select your role :"),
                      RadioMenuButton(
                          value: 1,
                          groupValue: provider.selectedValue,
                          onChanged: (value) {
                            provider.radioToggleChange(value);
                          },
                          child: const Text("I want to HIRE A DRIVER")),
                      RadioMenuButton(
                          value: 2,
                          groupValue: provider.selectedValue,
                          onChanged: (value) {
                            provider.radioToggleChange(value);
                          },
                          child: const Text("I am a DRIVER")),
                      const Divider(),
                      if (provider.selectedValue == 1) HireADriverForm(),
                      if (provider.selectedValue == 2) const IAmADriverForm()
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
