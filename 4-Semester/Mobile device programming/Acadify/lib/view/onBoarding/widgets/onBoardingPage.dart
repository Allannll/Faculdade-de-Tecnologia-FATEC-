 import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/sizes.dart';
import 'package:proj_eng/model/Helper/helper_functions.dart';

class OnboardingPage extends StatelessWidget {


  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              width: THelperFunctions.screenWidth() * 0.8,
              height: THelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image),
            ),
            Text(
              title, 
              style: 
                Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black, 
                  fontSize: 22, 
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Calibri'
                ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(
              subtitle, 
              style: 
                Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Color(0xFF333333), 
                  fontSize: 16,
                  fontFamily: 'Calibri'                  
                ),
              textAlign: TextAlign.left,
            ),
            ],
          )
        );
  }
}
