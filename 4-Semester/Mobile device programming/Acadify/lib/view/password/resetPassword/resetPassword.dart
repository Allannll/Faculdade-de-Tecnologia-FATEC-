import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/model/Constants/images.dart';
import 'package:proj_eng/model/Constants/sizes.dart';
import 'package:proj_eng/model/Helper/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear, color: Colors.red),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //img
              Image(image: const AssetImage(TImages.forgetPasswordImage), width: THelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: TSizes.spaceBtwSections),

              //title
              Text("E-mail enviado", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text("A segurança da sua conta é a nossa prioridade! Nos enviamos um e-mail com um link seguro para trocar a sua senha com segurança. Sua senha vai manter a conta em segurança!", style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey), textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),

              //buttons
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DefaultColors.componentFont,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Pronto",
                    style: TextStyle(color: DefaultColors.font),
                  )
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                height: 50,
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0, 
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      // borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){}, 
                  child: const Text(
                    "Reenviar e-mail",
                    style: TextStyle(color: DefaultColors.componentFont),
                    )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  
}