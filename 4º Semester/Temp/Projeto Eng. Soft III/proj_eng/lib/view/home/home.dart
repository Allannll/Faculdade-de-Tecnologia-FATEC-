import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/home/widgets/circular_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: DefaultColors.primary,
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Positioned(top: -150, right: -250, child: TCircularForm(backgroundColor: DefaultColors.secondary.withOpacity(0.1))),
                    Positioned(top: 100, right: -300, child: TCircularForm(backgroundColor: DefaultColors.secondary.withOpacity(0.1))),
                  ],
                ),
              ),
            ),     
          ],
        ),
      ),
    );
  }
}

