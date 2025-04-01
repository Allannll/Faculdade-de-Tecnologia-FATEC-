import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/regScreen.dart';
import 'loginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            DefaultColors.background2,
            DefaultColors.background2,  
          ]),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bem-vindo',
                    style: TextStyle(
                      fontSize: 60, 
                      color: DefaultColors.font,
                    ),
                  ),
                  const SizedBox(height: 10), 
                  const Text(
                    'Estamos felizes que você \n'
                     'esteja aqui!', 
                    style: TextStyle(
                      fontSize: 20, 
                      color: DefaultColors.font,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60), 
            const Image(image: AssetImage('assets/logo.png')),
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginscreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: DefaultColors.componentFont,
                backgroundColor: DefaultColors.componentBackgroud,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white),
                ),
                minimumSize: Size(320, 53),
              ),
              child: const Text(
                'Entre',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 40,
                    endIndent: 10,
                  ),
                ),
                const Text(
                  'Ou',
                  style: TextStyle(
                    fontSize: 15, 
                    color: Colors.grey
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 10,
                    endIndent: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: DefaultColors.componentBackgroud,
                backgroundColor: DefaultColors.componentFont,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: DefaultColors.componentBackgroud),
                ),
                minimumSize: Size(320, 53),
              ),
              child: const Text(
                'Cadastre-se',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: 
                  FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Login with Social Media',
              style: TextStyle(
                fontSize: 17, 
                color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}