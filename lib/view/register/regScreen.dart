import 'package:flutter/material.dart';
import 'package:proj_eng/controller/autentication_repository.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/register/widgets/regScreen_button.dart';
import 'package:proj_eng/view/register/widgets/regScreen_loginPrompt.dart';
import 'package:proj_eng/view/register/widgets/regScreen_textbox.dart';

final auth = AuthenticatorRepository();

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: 
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cadastre-se',
                              style: TextStyle(
                                fontSize: 30,
                                color: DefaultColors.componentFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Vamos criar sua conta, insira seus dados para continuar!',
                              style: TextStyle(
                                fontSize: 20,
                                color: DefaultColors.componentFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    RegScreenTextBox(
                      text: 'E-MAIL',
                      emailController: auth.emailController,
                      passwordController: auth.passwordController,
                      nameController: auth.nameController,
                      lastNameController: auth.lastNameController
                      ),
                    const SizedBox(height: 70),
                    // const LoginOptionsRow(),
                    // const SizedBox(height: 50),
                    RegButton(auth: auth),
                    const SizedBox(height: 50),
                    const LogInPrompt(),
                  ],
                ),
              )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
