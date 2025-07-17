import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:proj_eng/view/onBoarding/onboarding_screen.dart';


//Class uses to setup themes, inicial bindings or any animation
class App extends StatelessWidget{
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      // theme: TAppThemes.LightTheme,
      // darkTheme: TAppThemes.DarkTheme,
      home: Onboardingscreen(),
    );

  }
}