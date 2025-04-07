import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/controller/autentication_repository.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/model/Constants/images.dart';

class ProfileScreenTile extends StatelessWidget {
  const ProfileScreenTile({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthenticatorRepository();
    final user = auth.loggedInUser;

    final fullName = '${user?["name"] ?? ""} ${user?["lastName"] ?? ""}';
    final email = user?["email"] ?? "";

    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: CircleAvatar(
          backgroundImage: AssetImage(TImages.profileImage),
        ),
      ),
      title: Text(
        fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: DefaultColors.secondary),
      ),
      subtitle: Text(
        email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: DefaultColors.secondary),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.edit, color: DefaultColors.secondary),
      ),
    );
  }
}
