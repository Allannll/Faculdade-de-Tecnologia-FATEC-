import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Map<String, dynamic>> _appointments = [];

  List<Map<String, dynamic>> _allAppointments = [];
  List<Map<String, dynamic>> _filteredAppointments = [];

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _loadAppointments(_selectedDay!);
    _loadAllAppointments();
  }

  void _showCustomSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: DefaultColors.secondary),
        ),
        backgroundColor: DefaultColors.componentFont,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _loadAppointments(DateTime day) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final formattedDate =
        "${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}";

    final snapshot = await FirebaseFirestore.instance
        .collection('compromissos')
        .doc(uid)
        .collection('eventos')
        .where('date', isEqualTo: formattedDate)
        .get();

    final data = snapshot.docs.map((doc) {
      final appointmentData = doc.data();
      appointmentData['id'] = doc.id;
      return appointmentData;
    }).toList();

    setState(() {
      _appointments = List<Map<String, dynamic>>.from(data);
    });
  }

  Future<void> _loadAllAppointments() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('compromissos')
        .doc(uid)
        .collection('eventos')
        .orderBy('created_at', descending: true)
        .get();

    final data = snapshot.docs.map((doc) {
      final appointmentData = doc.data();
      appointmentData['id'] = doc.id;
      return appointmentData;
    }).toList();

    setState(() {
      _allAppointments = List<Map<String, dynamic>>.from(data);
      _filteredAppointments = List<Map<String, dynamic>>.from(data);
    });
  }

  Future<void> _saveAppointment(DateTime date, String title, String description) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final formattedDate =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

    await FirebaseFirestore.instance
        .collection('compromissos')
        .doc(uid)
        .collection('eventos')
        .add({
      'date': formattedDate,
      'title': title,
      'description': description,
      'created_at': Timestamp.now(),
    });

    await _loadAppointments(date);
    await _loadAllAppointments();
  }

  Future<void> _deleteAppointment(String id) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    await FirebaseFirestore.instance
        .collection('compromissos')
        .doc(uid)
        .collection('eventos')
        .doc(id)
        .delete();

    await _loadAppointments(_selectedDay!);
    await _loadAllAppointments();
    _showCustomSnackBar('Compromisso deletado.');
  }

  void _showAddAppointmentDialog() {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Novo compromisso',
        style: TextStyle(color: DefaultColors.componentFont),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Título',
              labelStyle: TextStyle(color: DefaultColors.componentFont),
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              labelText: 'Descrição',
              labelStyle: TextStyle(color: DefaultColors.componentFont),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cancelar', style: TextStyle(color: DefaultColors.componentFont)),
          onPressed: () => Navigator.pop(dialogContext), // safe pop
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: DefaultColors.componentFont),
          child: const Text('Salvar', style: TextStyle(color: DefaultColors.secondary)),
          onPressed: () {
            final title = titleController.text.trim();
            final description = descriptionController.text.trim();

            if (title.isEmpty || description.isEmpty) {
              _showCustomSnackBar('Por favor, preencha todos os campos');
              return;
            }

            // Close the dialog before the async call
            Navigator.pop(dialogContext);

            // Then do the async operation
            _saveAppointment(_selectedDay!, title, description).then((_) {
              if (!mounted) return;
              _showCustomSnackBar('Compromisso salvo com sucesso');
            });
          },
          ),
        ],
      ),
    );
  }


  void _showEditAppointmentDialog(Map<String, dynamic> appointment) {
  final titleController = TextEditingController(text: appointment['title']);
  final descriptionController = TextEditingController(text: appointment['description']);

  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Editar compromisso',
        style: TextStyle(color: DefaultColors.componentFont),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Título',
              labelStyle: TextStyle(color: DefaultColors.componentFont),
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              labelText: 'Descrição',
              labelStyle: TextStyle(color: DefaultColors.componentFont),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cancelar', style: TextStyle(color: DefaultColors.componentFont)),
          onPressed: () => Navigator.pop(dialogContext),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: DefaultColors.componentFont),
          child: const Text('Salvar', style: TextStyle(color: DefaultColors.secondary)),
          onPressed: () async {
            final title = titleController.text.trim();
            final description = descriptionController.text.trim();

            if (title.isEmpty || description.isEmpty) {
              _showCustomSnackBar('Por favor, preencha todos os campos');
              return;
            }

            final uid = FirebaseAuth.instance.currentUser?.uid;
            if (uid == null) return;

            // ✅ Pop the dialog FIRST before any async calls
            Navigator.pop(dialogContext);

            // ✅ Perform updates AFTER closing dialog
            await FirebaseFirestore.instance
                .collection('compromissos')
                .doc(uid)
                .collection('eventos')
                .doc(appointment['id'])
                .update({
              'title': title,
              'description': description,
            });

            // ✅ Safely check widget state before using context-bound methods
            if (!mounted) return;

            await _loadAppointments(_selectedDay!);
            await _loadAllAppointments();
            _showCustomSnackBar('Compromisso atualizado');
          },
        ),
      ],
     ),
    );
  }


  void _showAllAppointmentsDialog() {
    final searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            void filterAppointments(String query) {
              final filtered = _allAppointments.where((appointment) {
                final title = appointment['title']?.toLowerCase() ?? '';
                return title.contains(query.toLowerCase());
              }).toList();

              setStateDialog(() {
                _filteredAppointments = filtered;
              });
            }

            return AlertDialog(
              backgroundColor: DefaultColors.secondary,
              title: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: filterAppointments,
                      style: const TextStyle(color: DefaultColors.componentFont),
                      decoration: InputDecoration(
                        hintText: 'Pesquisar compromisso',
                        // ignore: deprecated_member_use
                        hintStyle: TextStyle(color: DefaultColors.componentFont.withOpacity(0.7)),
                        prefixIcon: Icon(Icons.search, color: DefaultColors.componentFont),
                        filled: true,
                        // ignore: deprecated_member_use
                        fillColor: DefaultColors.secondary.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: DefaultColors.componentFont),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              content: SizedBox(
                width: double.maxFinite,
                height: 300,
                child: _filteredAppointments.isEmpty
                    ? Center(
                        child: Text(
                          'Nenhum compromisso encontrado.',
                          style: TextStyle(color: DefaultColors.componentFont),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredAppointments.length,
                        itemBuilder: (context, index) {
                          final appointment = _filteredAppointments[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              title: Text(
                                appointment['title'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: DefaultColors.componentFont,
                                ),
                              ),
                              subtitle: Text(
                                appointment['description'] ?? '',
                                style: TextStyle(color: DefaultColors.componentFont),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: DefaultColors.componentFont),
                                onPressed: () async {
                                  await _deleteAppointment(appointment['id']);
                                  setStateDialog(() {
                                    _filteredAppointments.removeAt(index);
                                    _allAppointments.removeWhere((a) => a['id'] == appointment['id']);
                                  });
                                },
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                _showEditAppointmentDialog(appointment);
                              },
                            ),
                          );
                        },
                      ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Fechar',
                    style: TextStyle(color: DefaultColors.componentFont),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.secondary,
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: DefaultColors.componentFont,
        foregroundColor: DefaultColors.secondary,
        actions: [
          IconButton(
            icon: const Icon(Icons.search), // Ícone de lupa aqui
            tooltip: 'Ver todos os compromissos',
            onPressed: _showAllAppointmentsDialog,
            color: DefaultColors.secondary,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                _loadAppointments(selectedDay);
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.red.shade200,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: DefaultColors.componentFont,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: DefaultColors.secondary),
                todayTextStyle: TextStyle(color: DefaultColors.secondary),
                weekendTextStyle: TextStyle(color: DefaultColors.componentFont),
                defaultTextStyle: const TextStyle(color: Colors.black),
              ),
              headerStyle: HeaderStyle(
                titleTextStyle: const TextStyle(
                  color: DefaultColors.componentFont,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                formatButtonDecoration: BoxDecoration(
                  color: DefaultColors.componentFont,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: const TextStyle(color: DefaultColors.secondary),
                leftChevronIcon: const Icon(Icons.chevron_left, color: DefaultColors.componentFont),
                rightChevronIcon: const Icon(Icons.chevron_right, color: DefaultColors.componentFont),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _showAddAppointmentDialog,
                icon: const Icon(Icons.add, color: DefaultColors.secondary),
                label: const Text(
                  'Adicionar compromisso',
                  style: TextStyle(color: DefaultColors.secondary),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: DefaultColors.componentFont,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (_appointments.isEmpty)
              const Text(
                'Sem compromissos para essa data',
                style: TextStyle(color: Colors.black54),
              )
            else
              ..._appointments.map((appointment) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.red.withOpacity(0.1),
                      // ignore: deprecated_member_use
                      border: Border.all(color: Colors.red.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                appointment['title'] ?? '',
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: DefaultColors.componentFont),
                                  onPressed: () => _showEditAppointmentDialog(appointment),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: DefaultColors.componentFont),
                                  onPressed: () => _deleteAppointment(appointment['id']),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          appointment['description'] ?? '',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
