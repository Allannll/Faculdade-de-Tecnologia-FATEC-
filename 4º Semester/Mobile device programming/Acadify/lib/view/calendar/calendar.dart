import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Calendário'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.red.shade200,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayTextStyle: TextStyle(color: Colors.white),
                weekendTextStyle: TextStyle(color: Colors.red.shade800),
                defaultTextStyle: TextStyle(color: Colors.black),
              ),
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.red),
                rightChevronIcon: Icon(Icons.chevron_right, color: Colors.red),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Compromisso adicionado')),
                  );
                },
                icon: Icon(Icons.add, color: Colors.white),
                label: Text(
                  'Compromisso',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dia xx do xxx de xxxx',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Apresentação projeto Flutter - Primeira parte',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Lembrado!')),
                          );
                        },
                        child: Text(
                          'Lembrar',
                          style: TextStyle(
                            color: Colors.red, 
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Cancelado!')),
                          );
                        },
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
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
