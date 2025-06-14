import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/welcomeScreen/widgets/welcomeScreen_divider.dart';
import 'package:proj_eng/view/welcomeScreen/widgets/welcomeScreen_login_button.dart';
import 'package:proj_eng/view/welcomeScreen/widgets/welcomeScreen_reg_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundia-no-logo.jpeg'), 
            fit: BoxFit.cover, 
          ),
          // gradient: LinearGradient(
          //   colors: [
          //   DefaultColors.primary,
          //   Colors.redAccent,  
          // ],
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter
          // ),
          
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Text(
                  //   'Bem-vindo',
                  //   style: TextStyle(
                  //     fontSize: 35, 
                  //     color: DefaultColors.font,
                  //     fontWeight: FontWeight.bold,
                  //     fontFamily: 'Promp'
                  //   ),
                  // ),
                  // const SizedBox(height: 1),
                  const Text(
                    'Acadify',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 90, 
                      fontFamily: 'Promp',
                      color: DefaultColors.font,
                    )
                  ),
                  const SizedBox(height: 10), 
                  const Text(
                    'Acadify Feito por alunos, para alunos. \nSua vida acadêmica, de forma simples e prática.', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15, 
                      fontFamily: 'Promp',
                      color: DefaultColors.font,
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 5), 
            // const Image(image: AssetImage('assets/images/Acadify_logo.png'),
            //       width: 500,
            //       height: 500,
            //       ),
            Expanded(child: Container()),

            welcomeScreen_login_button(),

            const SizedBox(height: 10),
            welcomeScreen_divider(), 
            const SizedBox(height: 20),

            welcomeScreen_reg_button(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

