import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class GradeScreen extends StatefulWidget {
  const GradeScreen({super.key});

  @override
  GradeScreenState createState() => GradeScreenState();
}

class GradeScreenState extends State<GradeScreen> {
  final List<String> subjects = [
    'Matemática',
    'Português',
    'Lógica',
    'História',
    'Programação',
  ];

  String selectedSubject = 'Matemática';
  Map<String, double> grades = {};
  double average = 0.0;

  @override
  void initState() {
    super.initState();
    _loadGrades();
  }

  Future<void> _loadGrades() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('grades')
        .doc(uid)
        .collection('subjects')
        .doc(selectedSubject)
        .get();

    if (doc.exists) {
      final data = doc.data()!;
      grades = data.map((k, v) => MapEntry(k, (v as num).toDouble()));
    } else {
      grades = {};
    }
    _recalculateAverage();
    setState(() {});
  }

  void _recalculateAverage() {
    if (grades.isEmpty) {
      average = 0.0;
      return;
    }
    final sum = grades.values.reduce((a, b) => a + b);
    average = sum / grades.length;
  }

  Future<void> _saveGrades() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    await FirebaseFirestore.instance
        .collection('grades')
        .doc(uid)
        .collection('subjects')
        .doc(selectedSubject)
        .set(grades);
    _recalculateAverage();
    setState(() {});
  }

  void _showEditGradesDialog() {
    final prova1 = TextEditingController(text: grades['Prova 1']?.toString() ?? '');
    final prova2 = TextEditingController(text: grades['Prova 2']?.toString() ?? '');
    final trabalho = TextEditingController(text: grades['Trabalho']?.toString() ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Notas', style: TextStyle(color: DefaultColors.componentFont)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: prova1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Prova 1',
                labelStyle: TextStyle(color: DefaultColors.componentFont),
              ),
            ),
            TextField(
              controller: prova2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Prova 2',
                labelStyle: TextStyle(color: DefaultColors.componentFont),
              ),
            ),
            TextField(
              controller: trabalho,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Trabalho',
                labelStyle: TextStyle(color: DefaultColors.componentFont),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar', style: TextStyle(color: DefaultColors.componentFont)),
            onPressed: () => Navigator.pop(ctx),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: DefaultColors.componentFont),
            child: const Text('Salvar', style: TextStyle(color: DefaultColors.secondary)),
            onPressed: () {
              final n1 = double.tryParse(prova1.text) ?? 0;
              final n2 = double.tryParse(prova2.text) ?? 0;
              final n3 = double.tryParse(trabalho.text) ?? 0;

              grades = {
                'Prova 1': n1,
                'Prova 2': n2,
                'Trabalho': n3,
              };
              _saveGrades();
              Navigator.pop(ctx);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.secondary,
      appBar: AppBar(
        backgroundColor: DefaultColors.componentFont,
        title: const Text('Notas do Aluno', style: TextStyle(color: DefaultColors.secondary)),
        iconTheme: const IconThemeData(color: DefaultColors.secondary), // <-- seta branca
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Visão Geral', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: DefaultColors.componentFont)),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(
              child: Column(children: [
                SizedBox(
                  height: 120,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: average * 10, // <-- corrigido para percentual de 10
                          color: DefaultColors.componentFont,
                          title: '${(average * 10).toStringAsFixed(0)}%',
                          radius: 50,
                          titleStyle: const TextStyle(color: DefaultColors.secondary, fontWeight: FontWeight.bold),
                        ),
                        PieChartSectionData(
                          value: 100 - (average * 10), // <-- complementa 100%
                          color: Colors.red.shade100,
                          title: '',
                          radius: 50,
                        ),
                      ],
                      centerSpaceRadius: 20,
                      sectionsSpace: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text('Média Geral', style: TextStyle(fontSize: 14, color: DefaultColors.componentFont, fontWeight: FontWeight.w600)),
              ]),
            ),
            Expanded(
              child: SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 10,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (v, meta) {
                            final materias = ['P1', 'P2', 'Tr'];
                            final ix = v.toInt();
                            if (ix >= materias.length) return const SizedBox.shrink();
                            return Text(materias[ix], style: TextStyle(fontSize: 10, color: DefaultColors.componentFont));
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: List.generate(grades.length, (i) {
                      final val = grades.values.elementAt(i);
                      return BarChartGroupData(x: i, barRods: [BarChartRodData(toY: val, color: DefaultColors.componentFont)]);
                    }),
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 32),
          Text('Selecione a Matéria', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: DefaultColors.componentFont)),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: subjects.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final s = subjects[i];
                final sel = s == selectedSubject;
                return GestureDetector(
                  onTap: () {
                    selectedSubject = s;
                    _loadGrades();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: sel ? DefaultColors.componentFont : Colors.red.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(s, style: TextStyle(color: sel ? DefaultColors.secondary : DefaultColors.componentFont, fontWeight: FontWeight.w600)),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Text('Notas de $selectedSubject', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: DefaultColors.componentFont)),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(12)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Prova 1: ${grades['Prova 1']?.toStringAsFixed(1) ?? "-"}', style: const TextStyle(fontSize: 16)),
              Text('Prova 2: ${grades['Prova 2']?.toStringAsFixed(1) ?? "-"}', style: const TextStyle(fontSize: 16)),
              Text('Trabalho: ${grades['Trabalho']?.toStringAsFixed(1) ?? "-"}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Média final: ${average.toStringAsFixed(1)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: DefaultColors.componentFont),
                  onPressed: _showEditGradesDialog,
                  child: const Text('Editar notas', style: TextStyle(color: DefaultColors.secondary)),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
