import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/controller/autentication_repository.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/model/Constants/images.dart';
import 'package:proj_eng/services/auth_service.dart';
import 'package:proj_eng/view/profile/edit/widgets/edit_button.dart';
import 'package:proj_eng/view/profile/edit/widgets/edit_textbox.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final AuthenticatorRepository auth = AuthenticatorRepository();
    Authentication _authentication = Authentication();

    return Scaffold(
      appBar: AppBar(
        title: Text('Atualização cadastro', style: TextStyle(color: Colors.white),),
        backgroundColor: DefaultColors.componentFont,
        foregroundColor: DefaultColors.secondary,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<Map<String, dynamic>?>(
      future: _authentication.getCollectionData("usuarios"),
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

          final userData = snapshot.data!;
          final fullName = '${userData['name'] ?? ''} ${userData['last name'] ?? ''}';
          final email = userData['email'] ?? '';

          auth.nameController.text = userData['name'] ?? '';
          auth.lastNameController.text = userData['last name'] ?? '';
          auth.emailController.text = email;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(TImages.profileImage),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  fullName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: DefaultColors.componentFont,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: DefaultColors.componentFont,
                      ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: DefaultColors.componentFont.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: DefaultColors.componentFont.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      EditScreenTextBox(
                        text: 'Nome',
                        textboxController: auth.nameController,
                        icon: Iconsax.user,
                      ),
                      const SizedBox(height: 16),
                      EditScreenTextBox(
                        text: 'Sobrenome',
                        textboxController: auth.lastNameController,
                        icon: Iconsax.user_edit,
                      ),
                      const SizedBox(height: 16),
                      EditScreenTextBox(
                        text: 'E-mail',
                        textboxController: auth.emailController,
                        icon: Iconsax.direct,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                EditButton(auth: auth),
              ],
            ),
          );
        },
      ),
    );
  }
}
