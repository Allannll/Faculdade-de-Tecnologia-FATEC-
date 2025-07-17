import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/model/Constants/images.dart';
import 'package:proj_eng/services/auth_service.dart';
import 'package:proj_eng/view/profile/edit/edit_screen.dart';


class ProfileScreenTile extends StatelessWidget {
  const ProfileScreenTile({super.key});

  @override
  Widget build(BuildContext context) {

    Authentication authentication = Authentication();

    return FutureBuilder<Map<String, dynamic>?>(
      future: authentication.getCollectionData("usuarios"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const ListTile(
            title: Text("Usuário não encontrado"),
            subtitle: Text("Verifique se os dados estão cadastrados corretamente."),
          );
        }

        final user = snapshot.data!;
        final String fullName = '${user["name"] ?? ""} ${user["last name"] ?? ""}';
        final email = user["email"] ?? "";

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
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: DefaultColors.secondary),
          ),
          subtitle: Text(
            email,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: DefaultColors.secondary),
          ),
          trailing: IconButton(
            onPressed: () {
              Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => const EditProfileScreen()),
          );
            },
            icon: const Icon(Iconsax.edit, color: DefaultColors.secondary),
          ),
        );
      },
    );
  }
}
