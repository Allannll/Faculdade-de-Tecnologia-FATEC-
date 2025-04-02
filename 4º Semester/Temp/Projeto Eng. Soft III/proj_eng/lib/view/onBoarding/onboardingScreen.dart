import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_eng/controller/onboarding_controller.dart';
import 'package:proj_eng/model/Constants/images.dart';
import 'package:proj_eng/view/onBoarding/widgets/onBoardingDotNavigation.dart';
import 'package:proj_eng/view/onBoarding/widgets/onBoardingNextButton.dart';
import 'package:proj_eng/view/onBoarding/widgets/onBoardingPage.dart';
import 'package:proj_eng/view/onBoarding/widgets/onBoardingSkip.dart';

class Onboardingscreen extends StatelessWidget{
  const Onboardingscreen({super.key});

    @override
    Widget build(BuildContext context) {
      final controller = Get.put(OnboardingController());
      return Scaffold( 
        backgroundColor: Colors.white, 
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnboardingPage(
                  image: TImages.onBoardingImage1,
                  title: 'Bem-vindo à Plataforma Acadêmica',
                  subtitle: 'Organize sua vida acadêmica em um só lugar. Acompanhe notas, faltas e anúncios diretamente no seu celular. Simples e prático!',
                ),

                OnboardingPage(
                  image: TImages.onBoardingImage2,
                  title: 'Feito por Alunos, para Alunos',
                  subtitle: 'Desenvolvido por estudantes da FATEC Ribeirão Preto, esta plataforma foi pensada para facilitar sua rotina acadêmica, com foco na praticidade e eficiência.',
                ),

                OnboardingPage(
                  image: TImages.onBoardingImage3,
                  title: 'Tudo o que Você Precisa',
                  subtitle: 'Acesse informações importantes sobre sua jornada na faculdade, acompanhe seu progresso e fique sempre atualizado com as novidades e eventos da universidade.',
                ),
              ],
            ),

            const onBoardingSkip(),

            OnBoardoDotNavigation(),

            OnboardingNextButton(),

          ],
        )
      );
    }
}