import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/calendar/calendar.dart';
import 'package:proj_eng/view/grade/grade.dart';
import 'package:proj_eng/view/home/home.dart';
import 'package:proj_eng/view/news/news.dart';
import 'package:proj_eng/view/profile/profile.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: DefaultColors.secondary,
          indicatorColor: DefaultColors.componentFont,
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(color: DefaultColors.componentFont);
            }
            return const TextStyle(color: DefaultColors.componentFont);
          }),
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: DefaultColors.secondary);
            }
            return const IconThemeData(color: DefaultColors.componentFont);
          }),
        ),
        child: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.calendar), label: "Calendário"),
              NavigationDestination(icon: Icon(Iconsax.note), label: "Notas"),
              NavigationDestination(icon: Icon(Iconsax.home), label: "Inicio"),
              NavigationDestination(icon: Icon(Iconsax.book), label: "Notícias"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Perfil"),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 2.obs;

  final screens = [CalendarScreen(), GradeScreen(), HomeScreen(), NewsScreen(), ProfileScreen()];
}