import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:table_calendar/table_calendar.dart';
import 'model/event.dart';

class TableEventsExampleState extends StatefulWidget {
  const TableEventsExampleState({Key? key}) : super(key: key);

  @override
  _TableEventsExampleStateState createState() =>
      _TableEventsExampleStateState();
}

class _TableEventsExampleStateState extends State<TableEventsExampleState> {
  DateTime _selectedDay =DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late Map<DateTime, List<CalEvent>> selectedEvents;
  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    _fetchEvents();
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
              focusedDay: _focusedDay,
              eventLoader: _getEventsFromDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Calls `setState()` when updating the selected day 
                setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              } 
               );
          }
              },
              onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
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
                      Fluttertoast.showToast(
                          msg: "Another Event Added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      _uploadEvent(CalEvent(
                          title: _eventController.text,
                          selectedDay: _selectedDay));
                      selectedEvents[_selectedDay]!.add(
                        CalEvent(
                            title: _eventController.text,
                            selectedDay: _selectedDay),
                      );
                      // _uploadEvent(CalEvent(title: _eventController.text,selectedDay: _selectedDay));
                    } else {
                      Fluttertoast.showToast(
                          msg: "First Event Added ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      selectedEvents[_selectedDay] = [
                        CalEvent(
                            title: _eventController.text,
                            selectedDay: _selectedDay),
                      ];
                      _uploadEvent(CalEvent(
                          title: _eventController.text,
                          selectedDay: _selectedDay));
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

  _uploadEvent(CalEvent event) async {
    final fbInstance = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "Farhan@gmail.com", password: 'Farhan123');
    print('here');
    try {
      await FirebaseFirestore.instance.collection('events').add(event.toJson());
      print('Event Uploaded');
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  _fetchEvents() async {
    final fbInstance = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "Farhan@gmail.com", password: 'Farhan123');
    try {
      FirebaseFirestore.instance
          .collection("events")
          .snapshots()
          .listen((event) {
        for (var element in event.docs) {
          CalEvent calEvent = CalEvent.fromJson(element.data());
          if (selectedEvents[calEvent.selectedDay] != null){
            selectedEvents[calEvent.selectedDay]!.add(
              CalEvent(
                  title: calEvent.title,
                  selectedDay: calEvent.selectedDay),
            );
          }
          else {
            selectedEvents[calEvent.selectedDay] = [
              CalEvent(
                  title: calEvent.title,
                  selectedDay: calEvent.selectedDay),
            ];
          }
          print(calEvent.title);
        }
      });
      setState(() {});
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
