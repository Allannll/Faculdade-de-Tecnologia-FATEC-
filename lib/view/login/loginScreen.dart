import 'package:flutter/material.dart';
import 'package:proj_eng/controller/autentication_repository.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/login/widgets/loginScreen_button.dart';
import 'package:proj_eng/view/login/widgets/loginScreen_optionsRow.dart';
import 'package:proj_eng/view/login/widgets/loginScreen_signUpPrompt.dart';
import 'package:proj_eng/view/login/widgets/loginScreen_textbox.dart';

final auth = AuthenticatorRepository();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(colors: [
            DefaultColors.primary,
            DefaultColors.primary,
          ]),
        ),
        child: Column(
          children: [
            const SizedBox(height: 150),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: DefaultColors.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá, conecte-se',
                              style: TextStyle(
                                fontSize: 30,
                                color: DefaultColors.font,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Entre com seu e-mail e senha para continuar!',
                              style: TextStyle(
                                fontSize: 20,
                                color: DefaultColors.componentFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    LoginScreenTextBox(
                      text: 'E-MAIL',
                      emailLoginController: auth.emailLoginController,
                      passwordLoginController: auth.passwordLoginController,
                      ),
                    const SizedBox(height: 20),
                    const LoginOptionsRow(),
                    const SizedBox(height: 50),
                    LoginButton(auth: auth),
                    const SizedBox(height: 50),
                    const SignUpPrompt(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}