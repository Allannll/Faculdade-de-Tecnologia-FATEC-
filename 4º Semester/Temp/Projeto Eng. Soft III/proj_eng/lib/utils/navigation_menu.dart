import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/view/home/home.dart';
import 'package:proj_eng/view/profile/profile.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        destinations: [
          NavigationDestination(icon: Icon(Iconsax.calendar), label: "Calendário"),
          NavigationDestination(icon: Icon(Iconsax.note), label: "Notas"),
          NavigationDestination(icon: Icon(Iconsax.home), label: "Inicio"),
          NavigationDestination(icon: Icon(Iconsax.book), label: "Notícias"),
          NavigationDestination(icon: Icon(Iconsax.user), label: "Perfil"),
        ]
      ),
    ),
    body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 2.obs;

  final screens = [Container(color: Colors.purple), Container(color: Colors.red), HomeScreen(), Container(color: Colors.green), ProfileScreen()];
}