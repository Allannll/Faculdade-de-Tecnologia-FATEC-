import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/model/Constants/device_utility.dart';
import 'package:proj_eng/view/loginScreen/loginScreen.dart';

class welcomeScreen_login_button extends StatelessWidget {
  
  const welcomeScreen_login_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDevice.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: DefaultColors.componentFont,
          backgroundColor: DefaultColors.componentBackgroud,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: DefaultColors.componentBackgroud),
          ),
          minimumSize: Size(320, 53),
        ), 
        child: Text(
          'Entre',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}