import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = true,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // leading: showBackArrow
      //     ? IconButton(
      //         onPressed: () => Get.back(),
      //         icon: const Icon(Iconsax.arrow_left),
      //       )
      //     : leadingIcon != null
      //         ? IconButton(
      //             onPressed: leadingOnPressed,
      //             icon: Icon(leadingIcon),
      //           )
      //         : null,
      title: title,
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
