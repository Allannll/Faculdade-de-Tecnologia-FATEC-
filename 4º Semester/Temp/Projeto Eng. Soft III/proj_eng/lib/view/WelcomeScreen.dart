import 'package:flutter/material.dart';
import 'package:proj_eng/model/colors.dart';
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
         gradient: LinearGradient(
           colors: [
             DefaultColors.backgroundColor,
             DefaultColors.backgroundColor2,
           ]
         )
       ),
       child: Column(
         children: [
           const Padding(
             padding: EdgeInsets.only(top: 200.0),
             child: Image(image: AssetImage('assets/logo.png')),
           ),
           const SizedBox(
             height: 100,
           ),
           const Text('Welcome Back',style: TextStyle(
             fontSize: 30,
             color: Colors.white
           ),),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Loginscreen()));
            },


        child: ElevatedButton(
          onPressed: () {
            //inserir o direcionamento da page
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3), 
              side: BorderSide(color: Colors.white), 
            ),
            minimumSize: Size(320, 53), 
          ),
          child: const Text(
            'Entre',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )


          ),
           const SizedBox(height: 30,),
           GestureDetector(
             onTap: (){
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => const RegScreen()));
             },
             child: Container(
               height: 53,
               width: 320,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(30),
                 border: Border.all(color: Colors.white),
               ),
               child: const Center(child: Text('Cadastre-se',style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.black
               ),),),
             ),
           ),
           const Spacer(),
           const Text('Login with Social Media',style: TextStyle(
               fontSize: 17,
               color: Colors.white
           ),),//
          const SizedBox(height: 12,),
           const Image(image: AssetImage('assets/social.png'))
          ]
       ),
     ),

    );
  }
}