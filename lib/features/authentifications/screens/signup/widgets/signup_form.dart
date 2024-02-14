import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfe_project/features/authentifications/controllers/signup/signup_controller.dart';
import 'package:pfe_project/features/authentifications/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:pfe_project/utils/constants/sizes.dart';
import 'package:pfe_project/utils/constants/text_strings.dart';
import 'package:pfe_project/utils/validators/validation.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late String _selectedRole;

  @override
  void initState() {
    super.initState();
    _selectedRole = "Simple User"; // Initial value
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// Role Dropdown
          DropdownButtonFormField<String>(
            value: _selectedRole,
            onChanged: (value) {
              setState(() {
                _selectedRole = value!;
              });
            },
            items: ["Simple User", "Responsable"].map((String role) {
              return DropdownMenuItem<String>(
                value: role,
                child: Text(role),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: "Role",
              prefixIcon: const Icon(Iconsax.user),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Fist & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText('first name', value),
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText('last name', value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            validator: (value) =>
                TValidator.validateEmptyText('username', value),
            controller: controller.username,
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ), // TextFormField
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ), // TextFormField
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            validator: (value) => TValidator.validatePassword(value),
            controller: controller.password,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Terms&Conditions Checkbox
          const TermsAndConditionsCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(TTexts.createAccount)))
        ],
      ),
    );
  }
}
