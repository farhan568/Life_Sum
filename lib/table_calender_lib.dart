import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'model/event.dart';

class TableEventsExampleState extends StatefulWidget {
  const TableEventsExampleState({Key? key}) : super(key: key);

  @override
  _TableEventsExampleStateState createState() =>
      _TableEventsExampleStateState();
}

class _TableEventsExampleStateState extends State<TableEventsExampleState> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late Map<DateTime, List<CalEvent>> selectedEvents;
  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<CalEvent> _getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              focusedDay: DateTime.now(),
              eventLoader: _getEventsFromDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
            ),
            ..._getEventsFromDay(_selectedDay).map(
              (CalEvent event) => ListTile(
                title: Text(
                  event.title,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[_selectedDay] != null) {
                      selectedEvents[_selectedDay]!.add(
                        CalEvent(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[_selectedDay] = [
                        CalEvent(title: _eventController.text)
                      ];
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    ));
  }
}
