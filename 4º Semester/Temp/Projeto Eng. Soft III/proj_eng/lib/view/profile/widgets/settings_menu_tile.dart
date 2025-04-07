import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.subtitle, 
    this.trailing, this.ontap
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: DefaultColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red)),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey)),
      trailing: trailing,
      onTap: ontap, //function to enter in page
    );
  }
}