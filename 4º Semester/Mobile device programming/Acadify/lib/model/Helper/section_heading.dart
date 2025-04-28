import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonTitle = 'Ver',
    required this.title,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: Theme.of(context).textTheme.titleLarge!.apply(color: DefaultColors.componentFont),
          maxLines: 1,
          overflow: TextOverflow.ellipsis),
          if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle, style: const TextStyle(color: DefaultColors.componentFont),))
      ],
    );
  }
}