import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final List<String> noticias = [
    'FATEC lança novo curso de IA aplicada',
    'Evento de tecnologia atrai estudantes de toda a região',
    'Professores da FATEC publicam artigo em revista internacional',
    'Novas vagas de estágio em empresas parceiras',
    'Alunos desenvolvem app de inclusão digital',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.secondary,
      appBar: AppBar(
        title: Text('Notícias', style: TextStyle(color: Colors.white),),
        backgroundColor: DefaultColors.componentFont,
        foregroundColor: DefaultColors.secondary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: DefaultColors.secondary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: DefaultColors.componentFont,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Fatec - RP 10/04/25',
                      style: TextStyle(
                        color: DefaultColors.secondary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Text(
                          'Imagem',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          noticias[index],
                          style: TextStyle(
                            color: DefaultColors.componentFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Saiba mais',
                        style: TextStyle(
                          color: DefaultColors.componentFont,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
