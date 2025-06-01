import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GradeScreen extends StatelessWidget {
  final List<String> subjects = ['Matemática', 'Português', 'Lógica', 'História', 'Programação'];

  @override
  Widget build(BuildContext context) {
    String selectedSubject = subjects[0];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Notas do Aluno', style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Visão Geral',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                value: 75,
                                color: Colors.red,
                                title: '75%',
                                radius: 50,
                                titleStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              PieChartSectionData(
                                value: 25,
                                color: Colors.red.shade100,
                                title: '',
                                radius: 50,
                              ),
                            ],
                            sectionsSpace: 0,
                            centerSpaceRadius: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Média Geral',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 100,
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          show: true,
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                final materias = ['Mat', 'Port', 'Lóg', 'Hist', 'Prog'];
                                if (value.toInt() >= materias.length) return const SizedBox.shrink();
                                return Text(
                                  materias[value.toInt()],
                                  style: TextStyle(fontSize: 10, color: Colors.red[900]),
                                );
                              },
                              interval: 1,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups: [
                          BarChartGroupData(x: 0, barRods: [
                            BarChartRodData(toY: 70, color: Colors.red),
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(toY: 85, color: Colors.red),
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(toY: 60, color: Colors.red),
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(toY: 90, color: Colors.red),
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(toY: 80, color: Colors.red),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Selecione a Matéria',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: subjects.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  final isSelected = subject == selectedSubject;
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.red : Colors.red[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        subject,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.red[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Notas de $selectedSubject',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Prova 1: 7.0', style: TextStyle(fontSize: 16)),
                  Text('Prova 2: 8.5', style: TextStyle(fontSize: 16)),
                  Text('Trabalho: 9.0', style: TextStyle(fontSize: 16)),
                  Text('Média final: 8.1', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
