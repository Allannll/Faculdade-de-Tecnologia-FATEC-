import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/model/Constants/device_utility.dart';
import 'package:proj_eng/view/regScreen.dart';

class welcomeScreen_reg_button extends StatelessWidget {
  
  const welcomeScreen_reg_button({
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
        child: Text(
          'Cadastre-se',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}