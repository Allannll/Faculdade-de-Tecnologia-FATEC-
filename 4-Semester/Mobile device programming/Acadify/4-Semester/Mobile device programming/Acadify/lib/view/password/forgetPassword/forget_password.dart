import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/sizes.dart';
import 'package:proj_eng/utils/main.dart';
import 'package:proj_eng/view/password/forgetPassword/widgets/forget_password_button.dart';
import 'package:proj_eng/view/password/forgetPassword/widgets/forget_password_textbox.dart';

class Forgetpassword extends StatelessWidget{
  const Forgetpassword({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Esqueceu a senha", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text("Não se preocupe, as vezes as pessoas podem se esquecer! Insira seu e-mail e vamos te enviar o link para resetar sua senha.", style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey)),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            forgetPasswordTextBox(
              text: 'E-mail',
              forgetPasswordController: auth.forgetPasswordController,
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ForgetButton(auth: auth),
            ),
          ],
        ),
      ),
    );
  }
}