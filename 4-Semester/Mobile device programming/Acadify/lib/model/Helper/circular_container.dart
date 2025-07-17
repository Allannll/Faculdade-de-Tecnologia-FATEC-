import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/home/widgets/circular_form.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child
    });

    final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DefaultColors.primary,
      child: Stack(
        children: [
          // ignore: deprecated_member_use
          Positioned(top: -150, right: -250,child: TCircularForm(backgroundColor: DefaultColors.secondary.withOpacity(0.1))),
          // ignore: deprecated_member_use
          Positioned(top: 100, right: -300,child: TCircularForm(backgroundColor: DefaultColors.secondary.withOpacity(0.1))),
          child, 
        ],
      ),
    );
  }
}