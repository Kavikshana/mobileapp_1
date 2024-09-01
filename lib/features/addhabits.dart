import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/calendar.dart';

class AddHabits extends StatefulWidget {
  const AddHabits({super.key});

  @override
  State<StatefulWidget> createState() => _AddHabitsState();
}

class _AddHabitsState extends State<AddHabits> {
  // late DateTime _selectedDay;
  // late DateTime _lastSelectedDay;
  // late ConfettiController _confettiController;
  // bool _wasListCompleted = true;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // @override
  // void initState() {
  //   super.initState();
  //   final DateTime curr = DateTime.now();
  //   _selectedDay = DateTime(curr.year, curr.month, curr.day);
  //   _lastSelectedDay = DateTime(2023);
  //   _confettiController = ConfettiController(duration: const Duration(milliseconds: 500));
  // }

  // @override
  // void dispose() {
  //   _confettiController.dispose();
  //   super.dispose();
  // }

  // void _onDayChanged(DateTime day) {
  //   setState(() {
  //     _lastSelectedDay = _selectedDay;
  //     _selectedDay = DateTime(day.year, day.month, day.day);
  //     _wasListCompleted = true;
  //
  //     // Trigger confetti effect
  //     _confettiController.play();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
      ),
      body: Column(
        children: [
          TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2023, 01, 01),
              lastDay: DateTime.utc(2025, 01, 01),
            selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
            },
            onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
            },
          ),
          // Expanded(
          //   child: CalendarWidget(
          //     initialDaySelected: _selectedDay,
          //     changeDay: _onDayChanged,
          //   ),
          // ),
          // ConfettiWidget(
          //   confettiController: _confettiController,
          //   blastDirectionality: BlastDirectionality.explosive,
          //   gravity: 0.2,
          //   numberOfParticles: 15,
          // ),
        ],
      ),
    );
  }
}
