import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/model/Constants/sizes.dart';
import 'package:proj_eng/model/Helper/app_bar.dart';
import 'package:proj_eng/model/Helper/circular_container.dart';
import 'package:proj_eng/model/Helper/section_heading.dart';
import 'package:proj_eng/view/profile/widgets/profile_screen_tile.dart';
import 'package:proj_eng/view/profile/widgets/settings_menu_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  TAppBar(
                    title: Text(
                      'Conta', 
                      style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white),
                    ),
                  ),
                const SizedBox(height: 5),  

                //profile card
                ProfileScreenTile(),
  
                const SizedBox(height: 5),  
                ],
              )
            ),
            //Body
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  //Account settings 
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(title: 'Perfil estudante', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(icon: Iconsax.flag, title: 'Metas de Estudo', subtitle: 'Defina metas semanais de estudo e acompanhe seu progresso'),
                  const SizedBox(height: 5),
                  const TSettingsMenuTile(icon: Iconsax.document, title: 'Documentos', subtitle: 'Acesse boletos, declarações e históricos escolares'),
                  const SizedBox(height: 5),
                  const TSettingsMenuTile(icon: Iconsax.calendar, title: 'Planejador Pessoal', subtitle: 'Organize tarefas e compromissos próprios com lembretes'),
                  const SizedBox(height: 5),
                  const TSettingsMenuTile(icon: Iconsax.profile_2user, title: 'Contatos Importantes', subtitle: 'Veja e-mail e telefone de professores e setores acadêmicos'),
                  const SizedBox(height: 5),
                  const TSettingsMenuTile(icon: Iconsax.message_question, title: 'Feedback das Disciplinas', subtitle: 'Envie opiniões e sugestões sobre as aulas e a estrutura'),
                  const SizedBox(height: 5),
                  const TSettingsMenuTile(icon: Iconsax.book, title: 'Biblioteca Digital', subtitle: 'Acesse materiais de apoio, PDFs e indicações de leitura'),
                  
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(title: 'Curso', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(icon: Iconsax.document1, title: 'Ementa', subtitle: 'Consulte os conteúdos e objetivos de cada disciplina'),
                  const SizedBox(height: 5),
                  const TSettingsMenuTile(icon: Iconsax.hierarchy, title: 'Grade Curricular', subtitle: 'Visualize a sequência de matérias por semestre'),
                  const SizedBox(height: 5),
                  const TSettingsMenuTile(icon: Iconsax.activity, title: 'Projetos e Iniciativas Acadêmicas', subtitle: 'Descubra oportunidades, pesquisas e eventos do curso'),
                  const SizedBox(height: 5),
                  const TSettingsMenuTile(icon: Iconsax.teacher, title: 'Coordenador e Corpo Docente', subtitle: 'Conheça os professores e o coordenador do curso'),
                  const SizedBox(height: 5),
                  const TSettingsMenuTile(icon: Iconsax.info_circle, title: 'Sobre a Faculdade', subtitle: 'Informações institucionais, missão e visão'),
                  const SizedBox(height: 5),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.location, 
                  //   title: 'Localização', 
                  //   subtitle: 'Adicione a localização para melhor recomendação',
                  //   trailing: Switch(value: true, onChanged: (value) {}, activeColor: DefaultColors.primary),
                  // ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}