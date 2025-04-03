import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/loginScreen/widgets/loginScreen_button.dart';
import 'package:proj_eng/view/loginScreen/widgets/loginScreen_signUpPrompt.dart';
import 'package:proj_eng/view/loginScreen/widgets/loginScreen_textbox.dart';

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
            DefaultColors.background2,
            DefaultColors.background2,
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
                  color: Colors.white,
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
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Entre com seu e-mail e senha para continuar!',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    LoginScreenTextBox(text: 'E-MAIL'),
                    const SizedBox(height: 20),
                    LoginScreenTextBox(text: 'SENHA'),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const LoginButton(),
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