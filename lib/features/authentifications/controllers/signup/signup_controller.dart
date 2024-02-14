import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe_project/utils/constants/image_strings.dart';
import 'package:pfe_project/utils/helpers/network_manager.dart';
import 'package:pfe_project/utils/popups/fullscreen_loader.dart';
import 'package:pfe_project/utils/popups/loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

// Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  /// -- SIGNUP
  Future<void> signup() async {
    try {
// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information ... ', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!isConnected) {
        //Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue. ');

      // Move to Verify Email Screen
      // Get.to(() => VerifyEmailScreen(
      //       email: email.text.trim(),
      //     ));

      // Register user in the Firebase Authentication & Save user data in the Firebase
    } catch (e) {
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
