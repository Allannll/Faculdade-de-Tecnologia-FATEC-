import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/model/Constants/sizes.dart';
import 'package:proj_eng/view/password/resetPassword/resetPassword.dart';

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

            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF2F2F2),
                prefixIcon: Icon(Iconsax.direct_right, color: Colors.grey),
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red, width: 2), 
              ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPassword(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text("Enviar"),
              ),
            ),
          ],
        ),
      ),
    );
  }


  
}