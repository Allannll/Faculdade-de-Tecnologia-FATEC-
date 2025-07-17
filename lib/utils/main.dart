import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proj_eng/controller/autentication_repository.dart';
import 'package:proj_eng/view/onBoarding/onboardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final AuthenticatorRepository auth = AuthenticatorRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(auth: auth));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required AuthenticatorRepository auth});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: ('inter'),
        useMaterial3: true,
      ),
      home:const Onboardingscreen(),
    );
  }
}