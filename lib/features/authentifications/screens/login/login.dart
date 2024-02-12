import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:pfe_project/commons/styles/spacing_styles.dart';
import 'package:pfe_project/commons/widgets/login_signup/form_divider.dart';
import 'package:pfe_project/commons/widgets/login_signup/social_buttons.dart';
import 'package:pfe_project/features/authentifications/screens/login/widgets/login_form.dart';
import 'package:pfe_project/features/authentifications/screens/login/widgets/login_header.dart';
import 'package:pfe_project/utils/constants/sizes.dart';
import 'package:pfe_project/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo, Title & Sub-Title
              const LoginHeader(),

              /// Form
              const LoginForm(),

              /// Divider
              FormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
