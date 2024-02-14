import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pfe_project/bindings/general_bidings.dart';
import 'package:pfe_project/features/authentifications/screens/login/login.dart';
import 'package:pfe_project/utils/constants/text_strings.dart';
import 'package:pfe_project/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home:
          const LoginScreen(), // Correction de la virgule après le nom de l'écran de connexion
    );
  }
}
