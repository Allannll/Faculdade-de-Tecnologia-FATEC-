import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.secondary,
      appBar: AppBar(
        backgroundColor: DefaultColors.componentFont,
        title: const Text('Bem-vindo'),
        centerTitle: true,
        foregroundColor: DefaultColors.secondary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  Icon(Icons.school, color: DefaultColors.componentFont, size: 64),
                  SizedBox(height: 16),
                  Text(
                    'Olá, Aluno!',
                    style: TextStyle(
                      color: DefaultColors.componentFont,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Confira suas notas, avisos importantes e muito mais!',
                    style: TextStyle(
                      fontSize: 16,
                      color: DefaultColors.componentFont,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _HomeButton(icon: Icons.bar_chart, label: 'Notas'),
                _HomeButton(icon: Icons.notifications, label: 'Avisos'),
                _HomeButton(icon: Icons.person, label: 'Perfil'),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Novidade!',
                    style: TextStyle(
                      fontSize: 18,
                      color: DefaultColors.componentFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Novo sistema de feedback disponível para os alunos!',
                    style: TextStyle(
                      color: DefaultColors.componentFont,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HomeButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: DefaultColors.componentFont, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: DefaultColors.componentFont,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
